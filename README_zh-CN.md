# <h1 align="center">CLEVA: Chinese Language Models EVAluation Platform</h1>
<div align="center">

[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-blue.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)

[🌐网站](http://www.lavicleva.com/)
•[📜论文 \[EMNLP 2023 Demo\]](https://arxiv.org/abs/2308.04813)
•✉️<a href="mailto:clevaplat@gmail.com">邮箱</a>

[English](README.md) | 简体中文

</div>

## 🎯 引言

[CLEVA](https://arxiv.org/abs/2308.04813)是由香港中文大学计算机科学与工程系王历伟教授带领的[LaVi实验室](https://lwwangcse.github.io/)主力开发的中文大模型能力评测平台。它包括了
- 一个全面的**中文评测基准**，包括31个任务（11个应用评估+20个能力评测任务），共370K中文测试样本（33.98%为全新构造，*缓解数据泄露*的问题）；
- 一个标准的**中文评测流程**，其中包括所有数据进行统一的预处理，所有模型使用同样*一组中文提示模板*进行评测等。
- 一个可信的**中文模型排行榜**，因为CLEVA使用了大量新数据来缓解数据泄露，并定期组织评测。

其中排行榜由CLEVA使用全新的测试数据进行评测和维护。往期排行榜使用到的评测数据（处理好的测试样本、标注的提示模板等）将开放给用户，用户可自行在本地运行评测任务使用。

![总览](overview.png)

## 🔥 新闻

- **\[2023.09.30\]** CLEVA被[EMNLP 2023 System Demonstrations](https://2023.emnlp.org/calls/demos/)接收！
- **\[2023.08.09\]** CLEVA的[论文](https://arxiv.org/abs/2308.04813)在ArXiv放出！

## ⏬ 数据下载

如果您想在自己的代码中使用CLEVA的数据进行评测，您可以通过以下命令下载数据：
```sh
bash download_data.sh
```
运行成功后会在当前目录生成以数据版本命名的文件夹，里面包含CLEVA各个任务的数据。您可以通过向`download_data.sh`传递参数来指定数据版本。默认是`v1`。

## 🛂 许可

CLEVA is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

You should have received a copy of the license along with this work. If not, see <https://creativecommons.org/licenses/by-nc-nd/4.0/>.

## 🖊️ 引用

如果您在您的工作中使用了CLEVA，请引用我们的论文：
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
