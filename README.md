# Cpds

#### 介绍
CPDS (Container Problem Detect System) 容器故障检测系统，是由北京凝思软件股份有限公司设计并开发的容器集群故障检测系统，该软件系统实现了对容器TOP故障、亚健康检测的监测与识别。

#### 软件架构
CPDS (Container Problem Detect System) 容器故障检测系统由4个组件组成
*   [cpds-agent](https://gitee.com/openeuler/cpds-agent)
    ：信息采集组件，负责采集集群各节点的容器和系统原始数据  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)
        [@曾俊涵](https://gitee.com/zeng-junhan)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

*   [cpds-detector](https://gitee.com/openeuler/cpds-detector)
    ：异常检测组件，根据配置的异常规则对各节点原始数据进行分析，检测节点是否存在异常  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

*   [cpds-analyzer](https://gitee.com/openeuler/cpds-analyzer)
    ：故障/亚健康诊断组件，根据配置的诊断规则，对异常节点进行健康分析，计算出节点当前健康状态  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)

*    [cpds-dashboard](https://gitee.com/openeuler/cpds-dashboard)
    ：用户交互组件，提供web页面，对集群内节点健康情况进行展示，支持诊断规则配置下发  
    代码审核人员：
        [@李飞翔](https://gitee.com/linx-fxli)  
    代码合并人员：
        [@彭驿翔](https://gitee.com/pencc)


#### 工作计划 
1. 设计实现整体软件分层架构，从信息采集到用户交互; 2022.11.14 ~ 2022.12.5  
2. 整理、抽象容器的故障类型; 2022.12.6 ~ 2023.2.2 
3. 软件模块设计及开发; 2023.3.3 ~ 2023.8.31 
4. 运营社区，持续开发完善系统; 长期


#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request
