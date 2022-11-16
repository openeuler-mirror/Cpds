# Cpds

#### 介绍
CPDS (Container Problem Detect System) 容器故障检测系统，是由北京凝思软件股份有限公司设计并开发的容器集群故障检测系统，该软件系统实现了对容器TOP故障、亚健康检测的监测与识别。

#### 软件架构
CPDS (Container Problem Detect System) 容器故障检测系统由4个模块组成
*   [cpds-agent](https://gitee.com/openeuler/cpds-agent)
    ：信息采集模块，负责采集集群各节点的容器和系统原始数据  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)
        [@曾俊涵](https://gitee.com/zeng-junhan)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

*   [cpds-detector](https://gitee.com/openeuler/cpds-detector)
    ：异常检测模块，根据配置的异常规则对各节点原始数据进行分析，检测节点是否存在异常  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

*   [cpds-analyzer](https://gitee.com/openeuler/cpds-analyzer)
    ：故障/亚健康诊断模块，根据配置的诊断规则，对异常节点进行健康分析，计算出节点当前健康状态  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

*    [cpds-dashboard](https://gitee.com/openeuler/cpds-dashboard)
    ：用户交互模块，提供web页面，对集群内节点健康情况进行展示，支持诊断规则配置下发  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

#### 安装教程

1.  xxxx
2.  xxxx
3.  xxxx

#### 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
