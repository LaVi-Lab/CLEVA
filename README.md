# <h1 align="center">CLEVA: Chinese Language Models EVAluation Platform</h1>
<div align="center">

[![GitHub Repo stars](https://img.shields.io/github/stars/Lavi-Lab/CLEVA)](https://github.com/Lavi-Lab/CLEVA/stargazers)
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-blue.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)
[![Ask me anything](https://img.shields.io/badge/Ask%20me-anything-blue.svg)](https://github.com/LaVi-Lab/CLEVA/issues/new)

[🌐Website](http://www.lavicleva.com/)
•[📜Paper \[EMNLP 2023 Demo\]](https://arxiv.org/abs/2308.04813)
•[📌Instructions](#instructions)
•✉️<a href="mailto:clevaplat@gmail.com">Email</a>

English | [简体中文](README_zh-CN.md)

</div>

## 🎯 Introduction

[CLEVA](https://arxiv.org/abs/2308.04813) is a Chinese Language Models EVAluation Platform developed by CUHK [LaVi Lab](https://lwwangcse.github.io/). CLEVA would like to thank Shanghai AI Lab for the great collaboration in the process. The main features of CLEVA include:
- A comprehensive **Chinese Benchmark**, featuring 31 tasks (11 application assessments + 20 ability evaluation tasks), with a total of 370K Chinese test samples (33.98% are newly collected, mitigating *data contamination* issues);
- A standardized **Prompt-Based Evaluation Methodology**, incorporating unified pre-processing for all data and using *a consistent set* of Chinese prompt templates for evaluation.
- A trustworthy **Leaderboard**, as CLEVA uses a significant amount of new data to minimize data contamination and regularly organizes evaluations.

The leaderboard is evaluated and maintained by CLEVA using new test data. Past leaderboard data (processed test samples, annotated prompt templates, etc.) are made available to users for local evaluation runs.

![Overview](overview.png)

## 🔥 News

- **\[2024-12-06\]** We are thrilled to announce <a href="https://arxiv.org/abs/2412.04947">C<sup>2</sup>LEVA</a>, an effort toward building a comprehensive bilingual benchmark with systematic contamination prevention. 🔥🔥🔥
- **\[2023.11.02\]** Thanks for the support of Stanford CRFM HELM team! CLEVA has now been integrated into the [latest release](https://github.com/stanford-crfm/helm/releases/tag/v0.3.0) of HELM. You can use CLEVA to evaluate your own models locally via HELM.
- **\[2023.09.30\]** CLEVA has been accepted to [EMNLP 2023 System Demonstrations](https://2023.emnlp.org/calls/demos/)!
- **\[2023.08.09\]** Our [paper](https://arxiv.org/abs/2308.04813) for CLEVA is out!

<a id="instructions"></a>
## 📌 Instructions

[CLEVA](https://arxiv.org/abs/2308.04813) has been integrated into [HELM](https://github.com/stanford-crfm/helm). CLEVA would like to thank Stanford CRFM HELM team for the support. Users can employ CLEVA's datasets, prompt templates, perturbations, and Chinese automatic metrics for local evaluations via HELM.

> **Note**<br />
> If you want to evaluate your models on CLEVA online, please contact us via <clevaplat@gmail.com> for authentication and check out [📘Documentation](http://www.lavicleva.com/#/homepage/createautotask) for API development.

### 🛠️ Installation

Users can refer to the [installation guide](https://crfm-helm.readthedocs.io/en/latest/installation/) of HELM for setting up the Python environment and dependencies (`Python>=3.8`).

<details>
<summary><b>Installation Using Anaconda</b></summary>

Here is an example for installation using [Anaconda](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html):

Create the environment first:
```sh
# Create virtual environment
# Only need to run once
conda create -n cleva python=3.8 pip

# Activate the virtual environment
conda activate cleva
```

Then install the dependencies:

```sh
pip install crfm-helm
```
</details>

### ⚖️ Evaluation

Example command to evaluate `gpt-3.5-turbo-0613` on CLEVA's Chinese-to-English translation task using HELM:

```sh
helm-run \
-r "cleva:model=openai/gpt-3.5-turbo-0613,task=translation,subtask=zh2en,prompt_id=0,version=v1,data_augmentation=cleva" \
--num-train-trials <num_trials> \
--max-eval-instances <max_eval_instances> \
--suite <suite_id>
```

Explanation of parameters in `-r` (run configuration):

- `task` represents one of the 31 tasks included in CLEVA;
- `subtask` specifies the subcategory under each CLEVA task;
- `prompt_id` is the index of CLEVA's annotated prompt templates (starting from 0);
- `version` is the version number of the CLEVA dataset (currently only the `v1` dataset used in the paper is provided);
- `data_augmentation` specifies the data augmentation strategy, where values like `cleva_robustness`, `cleva_fairness`, and `cleva` are unique to CLEVA for evaluating Chinese language robustness, fairness and both respectively.

For other parameters, please refer to HELM's [tutorial](https://crfm-helm.readthedocs.io/en/latest/tutorial/).

The full list of available `task`, `subtask`, and `prompt_id` of CLEVA (`version=v1`) can be found in HELM's [.conf](https://github.com/stanford-crfm/helm/blob/main/src/helm/benchmark/presentation/run_specs_cleva_v1.conf) file. Users can run the entire CLEVA evaluation suite using the following command (the running time for reproducing CLEVA results can be found in the [paper](https://arxiv.org/abs/2308.04813)):

```sh
helm-run \
-c src/helm/benchmark/presentation/run_specs_cleva_v1.conf \
--num-train-trials <num_trials> \
--max-eval-instances <max_eval_instances> \
--suite <suite_id>
```
Generally, setting `--max-eval-instances` to over 5000 ensures all CLEVA task data are used for evaluation.

### 📊 Reference Results

Comparison between the results obtained using HELM for evaluating `gpt-3.5-turbo-0613` on selected CLEVA tasks (`version=v1`) and those from the CLEVA platform:

| Scenario | Metric | Reproduced in HELM | Evaluated by CLEVA |
| ---- | ----------------- | ---------------- | ----------- |
| task=summarization,subtask=dialogue_summarization | ROUGE-2 | 0.3045 | 0.3065 |
| task=translation,subtask=en2zh | SacreBLEU | 60.48 | 59.23 |
| task=fact_checking | Exact Match | 0.4595 | 0.4528 |
| task=bias,subtask=dialogue_region_bias | Micro F1 | 0.5656 | 0.5589 |

> **Note**<br />
> The difference is mainly due to different random seeds resulting in different in-context demonstrations, and the ChatGPT versions used by CLEVA and HELM are not completely aligned.

## ⏬ Download Data

If you want to use CLEVA data for evaluation with your own code, you can download the data by:
```sh
bash download_data.sh
```
After a successful run, a folder named with the data version will be generated in the current directory, which contains the data of each task of CLEVA. You can specify the data version by passing arguments to `download_data.sh`. It is `v1` by default.

## 🛂 License

CLEVA is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

You should have received a copy of the license along with this work. If not, see <https://creativecommons.org/licenses/by-nc-nd/4.0/>.

## 🖊️ Citation

Please cite our paper if you use CLEVA in your work:
```bib
@misc{li2023cleva,
      title={CLEVA: Chinese Language Models EVAluation Platform}, 
      author={Yanyang Li and Jianqiao Zhao and Duo Zheng and Zi-Yuan Hu and Zhi Chen and Xiaohui Su and Yongfeng Huang and Shijia Huang and Dahua Lin and Michael R. Lyu and Liwei Wang},
      year={2023},
      eprint={2308.04813},
      archivePrefix={arXiv},
      primaryClass={cs.CL}
}
```
