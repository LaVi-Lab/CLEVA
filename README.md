# <h1 align="center">CLEVA: Chinese Language Models EVAluation Platform</h1>
<div align="center">

[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-blue.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

[🌐Website](http://www.lavicleva.com/)
•[📜Paper \[EMNLP 2023 Demo\]](https://arxiv.org/abs/2308.04813)
•✉️<a href="mailto:clevaplat@gmail.com">Email</a>

English | [简体中文](README_zh-CN.md)

</div>

## 🎯 Introduction

[CLEVA](https://arxiv.org/abs/2308.04813) is a Chinese Language Models EVAluation Platform developed by CUHK@CSE [LaVi Lab](https://lwwangcse.github.io/) led by Professor Liwei Wang. It includes:
- A comprehensive **Chinese Benchmark**, featuring 31 tasks (11 application assessments + 20 ability evaluation tasks), with a total of 370K Chinese test samples (33.98% are newly collected, mitigating *data contamination* issues);
- A standardized **Prompt-Based Evaluation Methodology**, incorporating unified pre-processing for all data and using *a consistent set* of Chinese prompt templates for evaluation.
- A trustworthy **Leaderboard**, as CLEVA uses a significant amount of new data to minimize data contamination and regularly organizes evaluations.

The leaderboard is evaluated and maintained by CLEVA using new test data. Past leaderboard data (processed test samples, annotated prompt templates, etc.) are made available to users for local evaluation runs.

![Overview](overview.png)

## 🔥 News

- **\[2023.09.30\]** CLEVA has been accepted to [EMNLP 2023 System Demonstrations](https://2023.emnlp.org/calls/demos/)!
- **\[2023.08.09\]** Our [paper](https://arxiv.org/abs/2308.04813) for CLEVA is out!

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
