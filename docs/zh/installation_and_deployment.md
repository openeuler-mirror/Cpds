# 安装与部署

本章介绍如何安装和部署CPDS。

## 安装CPDS

本节介绍CPDS的安装方法。

安装cpds-agent。

> cpds-agent采集节点原始数据，可在多个节点上单独安装部署。

```shell
yum install cpds-agent
```

安装cpds-detector

```shell
yum install cpds-detector
```

安装cpds-analyzer

```shell
yum install cpds-analyzer
```

安装cpds-dashboard

```shell
yum install cpds-dashboard
```

安装Cpds

```shell
yum install Cpds
```

## 部署CPDS

本节介绍CPDS的配置部署。

### 配置介绍

#### cpds-agent配置

cpds-agent采集节点网络信息是采用向指定ip发送icmp包的方式，即"net_diagnostic_dest"需要指定可连接的ip地址，不可指定本节点ip。建议节点指定master的ip，master指定任意一节点ip。

```bash
vim /etc/cpds/agent/config.json
```

```json
{
    "expose_port":"20001", # 需要监听的端口
    "log_cfg_file": "/etc/cpds/agent/log.conf",
    "net_diagnostic_dest": "192.30.25.18" # 发送icmp包的目的ip
}
```

#### prometheus配置

CPDS 使用prometheus采集cpds-agent产生的原始数据。cpds-agent默认开放20001端口，需编辑prometheus配置文件，连接至cpds-agent以采集数据。

```bash
vim /etc/prometheus/prometheus.yml
```

```yaml
global:
  scrape_interval: 2s
  evaluation_interval: 3s
scrape_configs:
  - job_name: "cpds"
    static_configs:
    - targets: ["cpds-agent1:port","cpds-agent2:port","..."] # 填入已部署cpds-agent的ip和端口号
```

#### cpds-detector配置

```bash
vim /etc/cpds/detector/config.yml
```

```yaml
generic:
  bindAddress: "127.0.0.1" # 需要监听的地址
  port: 19091 # 需要监听的端口

database:
  host: "127.0.0.1" # 数据库 ip 地址
  port: 3306 # 数据库端口号
  username: root # 数据库用户名
  password: root # 数据库密码
  maxOpenConnections: 123 # 最大连接数

prometheus:
  host: "127.0.0.1" #detector ip 地址
  port: 9090 #prometheus 端口号

log:
  fileName: "/var/log/cpds/cpds-detector/cpds-detector.log"
  level: "warn"
  maxAge: 15
  maxBackups: 100
  maxSize: 100
  localTime: true
  compress: true
```

#### cpds-analyzer配置

```bash
vim /etc/cpds/analyzer/config.yml
```

```yaml
generic:
  bindAddress: "127.0.0.1" # 需要监听的地址
  port: 19091 # 需要监听的端口

database:
  host: "127.0.0.1" # 数据库 ip 地址
  port: 3306 # 数据库端口号
  username: root # 数据库用户名
  password: root # 数据库密码
  maxOpenConnections: 123 # 最大连接数

detector:
  host: "127.0.0.1" #detector ip 地址
  port: 19092 #detector 端口号

log:
  fileName: "/var/log/cpds/cpds-analyzer/cpds-analyzer.log"
  level: "warn"
  maxAge: 15
  maxBackups: 100
  maxSize: 100
  localTime: true
```

#### cpds-dashboard配置

```bash
vim /etc/nginx/conf.d/cpds-ui.conf
```

```conf
server {
  listen 10119;

  location / {
    root /etc/cpds/cpds-ui/;
    index index.html index.htm;
  }

  location /api/ {
    proxy_pass http://127.0.0.1:19091; # 后端 analyzer 的 ip 和端口
  }

  location /websocket/ {
    proxy_pass http://127.0.0.1:19091; # 后端 analyzer 的 ip 和端口
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-Proto http;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "Upgrade";
  }
}
```

## 启动CPDS

本节介绍CPDS的启动方法。

### 关闭防火墙

```shell
systemctl stop firewalld
systemctl disable firewalld
```

修改/etc/selinux/config文件中SELINUX状态为disabled。

```conf
SELINUX=disabled
```

再重启系统。

### 初始化数据库

1. 启动数据库

    ```shell
    systemctl start mariadb.service
    systemctl enable mariadb.service
    ```

2. 在root权限下初始化数据库

    ```shell
    /usr/bin/mysql_secure_installation
    ```

    > 命令执行过程中需要输入数据库的root设置的密码，若没有密码则直接按“Enter”。然后根据提示及实际情况进行设置。

3. 设置数据库连接权限

    ```shell
    mysql -u root -p
    ```

    命令执行后提示输入密码。密码为2中设置的密码。

    ```shell
    GRANT ALL PRIVILEGES ON *.* TO 'username'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
    ```

    > 其中username为数据库用户名，password为该用户的密码。

    例如：

    ```shell
    mysql -u root -p
    Enter password:
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 5
    Server version: 10.5.16-MariaDB MariaDB Server

    Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION;
    Query OK, 0 rows affected (0.014 sec)
    ```

### 启动服务

```shell
systemctl start Cpds.service
systemctl enable Cpds.service
```

启动各节点上的cpds-agent。

```shell
systemctl start cpds-agent
systemctl enable cpds-agent
```

### 访问前端管理平台

上述服务启动成功后，打开浏览器，在浏览器导航栏中输入`http://localhost:10119`访问前端管理平台。
