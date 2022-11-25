# Cpds

#### Description
CPDS (Container Problem Detect System) is a container cluster problem detection system, it's designed and developed by Linx Software Co., Ltd. The software system realizes the monitoring and identification of container TOP faults and sub-health detection.

#### Software Architecture
CPDS (Container Problem Detect System) Consists of 4 components  
*   [cpds-agent](https://gitee.com/openeuler/cpds-agent)
    ：The data collection component is responsible for collecting the container and system raw data of each node of the cluster.    
    code reviewer:
        [@Feixiang Li](https://gitee.com/linx-fxli)
        [@Junhan Zeng](https://gitee.com/zeng-junhan)  
    repo owner:
        [@Yixiang Peng](https://gitee.com/pencc)

*   [cpds-detector](https://gitee.com/openeuler/cpds-detector)
    ：The anomaly detection component analyzes the raw data of each node according to the configured anomaly rules, and detects whether there is an anomaly in the node.  
    code reviewer:
        [@Feixiang Li](https://gitee.com/linx-fxli)  
    repo owner:
        [@Yixiang Peng](https://gitee.com/pencc)

*   [cpds-analyzer](https://gitee.com/openeuler/cpds-analyzer)
    ：Fault/sub-health diagnosis component, according to the configured diagnosis rules, conducts health analysis on abnormal nodes and calculates the current health status of nodes.  
    code reviewer：
        [@Feixiang Li](https://gitee.com/linx-fxli)  
    repo owner：
        [@Yixiang Peng](https://gitee.com/pencc)

*    [cpds-dashboard](https://gitee.com/openeuler/cpds-dashboard)
    ：User interaction component, providing web pages, displaying the health status of nodes in the cluster, and supporting the distribution of diagnosis rule configuration.  
    code reviewer：
        [@Feixiang Li](https://gitee.com/linx-fxli)  
    repo owner：
        [@Yixiang Peng](https://gitee.com/pencc)


#### Contribution

1.  Fork the repository
2.  Create Feat_xxx branch
3.  Commit your code
4.  Create Pull Request
