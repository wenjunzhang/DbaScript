<h1 style="color:red;text-align:center">📢 Oracle 一键安装脚本开源了！</h1>

# 功能点对比
开源版和付费版的具体功能点对比如下：

| 分类        | 描述                                             | 开源版 | 付费版 |
| ----------- | ------------------------------------------------ | ------ | ------ |
| 功能        | 脚本帮助 help                                    | ✅      | ✅      |
| 功能        | 脚本安装日志                                     | ✅      | ✅      |
| 功能        | 脚本参数配置                                     | ✅      | ✅      |
| 功能        | 脚本参数检查                                     | ✅      | ✅      |
| 功能        | 创建多个实例                                     | ✅      | ✅      |
| 功能        | 配置多路径、UDEV、ASM 绑盘                       | ✅      | ✅      |
| 功能        | 可重复执行                                       | ✅      | ✅      |
| 功能        | 全程无需人工干预                                 | ✅      | ✅      |
| 功能        | 安装后优化数据库                                 | ✅      | ✅      |
| 架构        | 单机/单机 ASM                                    | ✅      | ✅      |
| 架构        | NON-CDB/CDB(PDB)                                 | ✅      | ✅      |
| 架构        | RAC（不限节点数）                                | ❌      | ✅      |
| CPU         | X86                                              | ✅      | ✅      |
| CPU         | ARM                                              | ❌      | ✅      |
| 系统        | 红帽 RHEL/Oracle Linux/Centos                    | ✅      | ✅      |
| 系统        | 国产化系统（麒麟、欧拉、统信、龙蜥等等 20 多种） | ❌      | ✅      |
| Oracle 版本 | 11GR2/12CR2/19C/21C/23ai                         | ✅      | ✅      |
| 兼容性      | Oracle 官方认证组合安装                          | ✅      | ✅      |
| 兼容性      | 非 Oracle 官方认证组合安装                       | ❌      | ✅      |
| 安装补丁    | Grid/DB/OJVM 一键安装打补丁                      | ❌      | ✅      |
| 安装介质    | 提供系统镜像 ISO、Oracle 安装包/补丁等安装介质   | ❌      | ✅      |
| 脚本答疑    | 安装日志排错、专属付费群、群直播答疑等           | ❌      | ✅      |

<h3 style="color:red;text-align:center">如需完整付费版功能，请添加作者微信订阅：Lucifer-0622</h3>

# 更新记录
- `2025/01/12`
	- 开源 OracleShellInstall 脚本

# Oracle一键安装脚本
作为 IT 人，相信大家多多少少都接触使用过 Oracle 数据库，但是很少有人安装过 Oracle 数据库，因为这种活一般都是 DBA 干的，比如我。那么，如果自己想安装一套 Oracle 数据库进行测试，如何安装呢？

**首先想要成功安装一套Oracle数据库，至少需要满足以下几个条件：**
- 了解基础的硬件资源配置：硬盘，内存，CPU 等；
- 熟悉如何安装 Linux 系统，包括多种虚拟机的使用；
- 熟悉 Linux 常用命令和系统服务；
- 熟悉 Oracle 数据库的整体安装流程，可参考官方文档；

**具体步骤可以参考：**
- 安装 Linux 操作系统；
- 配置存储，网络；
- 配置操作系统服务和参数等；
- 配置 Oracle 相关用户目录等；
- 上传解压安装介质；
- 安装 Oracle 软件；
- 创建数据库实例；

**可参考文档：**
- [《实战篇：Linux 安装 Oracle 11GR2 数据库保姆级教程》](https://www.modb.pro/db/168337)    
- [《实战篇：使用 StarWind 配置 ISCSI 共享存储》](https://www.modb.pro/db/152431)    
- [《实战篇：一步步教你 Linux 7 安装 Oracle 11GR2 RAC》](https://www.modb.pro/db/153861)    
- [《Redhat 7 安装 Oracle 12CR2 RAC 完全避坑宝典》](https://www.modb.pro/db/193241)    
- [《实战篇：Linux7 安装 Oracle 19C RAC 详细图文教程》](https://www.modb.pro/db/154424)    
- [《实战篇：SUSE 15 SP3 安装 Oracle 19C RAC 数据库》](https://www.modb.pro/db/159384)    

如果本篇文章只是如此，不免过于标题党，俗话说的好，抛转引玉，接下来就介绍下本文的主角：**<font color='red'>Oracle一键安装脚本</font>**，建库只需短短一行命令，一杯茶的功夫，敲代码的同时也不忘养生。

# 介绍
俗说得好：**<font color='#f47920'>"懒人"推动世界的发展。</font>** 既然能用脚本解决的事情，为什么还要那么麻烦，干就完事儿了。

# 脚本兼容性列表
目前脚本已支持操作系统（已安装验证）：
- [RedHat 6/7/8/9 全系](https://developers.redhat.com/products/rhel/download)
- [OracleLinux 6/7/8/9 全系](https://yum.oracle.com/oracle-linux-isos.html)
- [Centos 6/7/8 全系](https://mirrors.tuna.tsinghua.edu.cn/centos/)

# 目前脚本已知支持的 Oracle 版本
```bash
11GR2
12CR2
19C
21C
23ai
```

## 目前脚本已知支持列表组合

| 支持 单机/单机ASM    | 11GR2 | 12CR2 | 19C | 21C | 23ai |
| -------------------- | ----- | ----- | --- | --- | ---- |
| Centos >=6 全系      | ✅     | ✅     | ✅   | ✅   | ✅    |
| RedHat >=6 全系      | ✅     | ✅     | ✅   | ✅   | ✅    |
| OracleLinux >=6 全系 | ✅     | ✅     | ✅   | ✅   | ✅    |

开源版本脚本仅适配 Oracle 官方认证列表的系统组合，非标请购买付费版本支持。

# 常见问题
1. 挂载 ISO 镜像源，必须使用 Everything 或者比较全的源，否则可能安装失败。

# 实操参考
以下为作者安装测试的教程合集，请仔细阅读：
- [Oracle 一键安装脚本实操合集，持续更新中！！！](https://www.modb.pro/db/1773583263184031744)

# 脚本使用
使用脚本前，务必先做好以下步骤：
- 安装好操作系统，最小化和图形化皆可；
- 配置好主机网络；
- 配置软件源准备（本地或者网络），脚本会自动配置，只需要挂载 ISO 镜像即可；
- 创建软件存放目录：`mkdir /soft`；
- 上传安装所需软件包：Oracle 安装包；
- 上传一键安装脚本：OracleShellInstall；

更详细可以参考：
- **单机**
	- 系统组安装好操作系统（支持最小化安装）
	- 网络组配置好主机网络，通常只需要一个公网 IP 地址
	- DBA 创建软件目录：`mkdir /soft`
	- DBA 上传 Oracle 安装介质（基础包，补丁包）到 /soft 目录下
	- DBA 上传 Oracle 一键安装脚本到 /soft 目录下，授予脚本执行权限：`chmod +x OracleshellInstall`
	- DBA 挂载主机 ISO 镜像，这里只需要 mount 上即可（这个很简单，不了解的可以百度下）
	- 根据脚本安装脚本以及实际情况，配置好脚本的安装参数，在 /soft 目录下执行一键安装即可。
- **单机 ASM**
	- 系统组安装好操作系统（支持最小化安装）
	- 网络组配置好主机网络，通常只需要一个公网 IP 地址
	- 存储组配置并在主机层挂载好 ASM 磁盘，虚拟化环境需要确保已开启磁盘的 UUID
	- DBA 创建软件目录：`mkdir /soft`
	- DBA 上传 Oracle 安装介质（基础包）到 /soft 目录下
	- DBA 上传 Oracle 一键安装脚本到 /soft 目录下，授予脚本执行权限：`chmod +x OracleshellInstall`
	- DBA 挂载主机 ISO 镜像，这里只需要 mount 上即可
	- 根据脚本安装脚本以及实际情况，配置好脚本的安装参数，在 /soft 目录下执行一键安装即可。

## 参数介绍
关于脚本的参数使用可执行 `./OracleShellInstall -h` 进行查看，使用脚本前强烈建议全部看一遍再执行安装：
```bash

   ███████                             ██          ████████ ██               ██  ██ ██                    ██              ██  ██
  ██░░░░░██                           ░██         ██░░░░░░ ░██              ░██ ░██░██                   ░██             ░██ ░██
 ██     ░░██ ██████  ██████    █████  ░██  █████ ░██       ░██       █████  ░██ ░██░██ ███████   ██████ ██████  ██████   ░██ ░██
░██      ░██░░██░░█ ░░░░░░██  ██░░░██ ░██ ██░░░██░█████████░██████  ██░░░██ ░██ ░██░██░░██░░░██ ██░░░░ ░░░██░  ░░░░░░██  ░██ ░██
░██      ░██ ░██ ░   ███████ ░██  ░░  ░██░███████░░░░░░░░██░██░░░██░███████ ░██ ░██░██ ░██  ░██░░█████   ░██    ███████  ░██ ░██
░░██     ██  ░██    ██░░░░██ ░██   ██ ░██░██░░░░        ░██░██  ░██░██░░░░  ░██ ░██░██ ░██  ░██ ░░░░░██  ░██   ██░░░░██  ░██ ░██
 ░░███████  ░███   ░░████████░░█████  ███░░██████ ████████ ░██  ░██░░██████ ███ ███░██ ███  ░██ ██████   ░░██ ░░████████ ███ ███
  ░░░░░░░   ░░░     ░░░░░░░░  ░░░░░  ░░░  ░░░░░░ ░░░░░░░░  ░░   ░░  ░░░░░░ ░░░ ░░░ ░░ ░░░   ░░ ░░░░░░     ░░   ░░░░░░░░ ░░░ ░░░ 


注意：本脚本仅用于新服务器上实施部署数据库使用，严禁在已运行数据库的主机上执行，以免发生数据丢失或者损坏，造成不可挽回的损失！！！                                                                                  


用法: OracleShellInstall [选项] 对象 { 命令 | help }                                                                                  

单机模式：                                                                                       

-lrp                 配置本地软件源，需要挂载本地 ISO 镜像源，默认值：[Y]                                                   
-nrp                 配置网络软件源，默认值：[N]                                                   
-lf                  [必填] 公网 IP 的网卡名称                                                   
-n                   主机名，默认值：[orcl]
-ou                  系统 oracle 用户名称，默认值：[oracle]                                                   
-op                  系统 oracle 用户密码，若包含特殊字符必须以单引号包裹，例如：'Passw0rd#'，默认值：[oracle]                                                   
-d                   Oracle 软件安装根目录，默认值：[/u01]                                                   
-ord                 Oracle 数据文件目录，默认值：[/oradata]                                                   
-ard                 Oracle 归档文件目录，默认值：[/oradata/archivelog]                                                 
-o                   Oracle 数据库名称，默认值：[orcl]                                                   
-dp                  Oracle 数据库 sys/system 密码，若包含特殊字符(_,#,$)必须以单引号包裹，例如：'Passw0rd#'，默认值：[oracle]                                                   
-ds                  数据库字符集，默认值：[AL32UTF8]                                                   
-ns                  数据库国家字符集，默认值：[AL16UTF16]                                                   
-er                  是否启用归档日志，默认值：[true]                                                   
-pdb                 用于 CDB 架构，PDB 名称，支持传入多个PDB：-pdb pdb01,pdb02，默认值：[pdb01]                                                   
-redo                数据库 redo 日志文件大小，单位为 MB，默认值[1024]                                                                                                  
-m                   仅配置操作系统，默认值：[N]                                                   
-ud                  安装到 Oracle 软件结束，默认值：[N]                                                   
-gui                 是否安装系统图形界面，默认值：[N]                                                   
-opd                 安装完成是否优化 Oracle 数据库，默认值：[N]  
-hf                  安装完成是否配置内存大页，默认值：[N]                                                 

单机 ASM 模式：                                                                                  

-lrp                 配置本地软件源，需要挂载本地 ISO 镜像源，默认值：[Y]                                                   
-nrp                 配置网络软件源，默认值：[N]                                                   
-lf                  [必填] 公网 IP 的网卡名称                                                   
-n                   主机名，默认值：[orcl]   
-ou                  系统 oracle 用户名称，默认值：[oracle]                                                 
-op                  系统 oracle 用户密码，若包含特殊字符必须以单引号包裹，例如：'Passw0rd#'，默认值：[oracle]                                                   
-d                   Oracle 软件安装根目录，默认值：[/u01]                                                   
-ord                 Oracle 数据文件目录，默认值：[/oradata]                                                   
-o                   Oracle 数据库名称，默认值：[orcl]   
-gu                  系统 grid 用户名称，默认值：[grid]                                                 
-gp                  系统 grid 用户密码，，若包含特殊字符必须以单引号包裹，例如：'Passw0rd#'，默认值：[oracle]                                                   
-dp                  Oracle 数据库 sys/system 密码，若包含特殊字符(_,#,$)必须以单引号包裹，例如：'Passw0rd#'，默认值：[oracle]                                                   
-adc                 是否需要脚本配置 ASM 磁盘，如果不需要配置，则需要自行提前配置好，默认值：[Y]                                                   
-mp                  是否需要脚本配置 multipath 多路径，如果不需要配置多路径，则使用UDEV直接绑盘，默认值：[Y]                                                   
-dd                  [必填] ASM DATA 磁盘组的磁盘列表，默认传参为(sd名称)：-dd /dev/sdb：若设置参数 -adc N，则传入已配置好的磁盘列表：-dd /dev/asm_data1                                                   
-dn                  ASM DATA 磁盘组名称，默认值：[DATA]                                                   
-dr                  ASM DATA 磁盘组冗余度，默认值：[EXTERNAL]                                                   
-ds                  数据库字符集，默认值：[AL32UTF8]                                                   
-ns                  数据库国家字符集，默认值：[AL16UTF16]                                                   
-er                  是否启用归档日志，默认值：[true]                                                   
-pdb                 用于 CDB 架构，PDB 名称，支持传入多个PDB：-pdb pdb01,pdb02，默认值：[pdb01]                                                   
-redo                数据库 redo 日志文件大小，单位为 MB，默认值[1024]                                                                                                     
-m                   仅配置操作系统，默认值：[N]                                                   
-ud                  安装到 Oracle 软件结束，默认值：[N]                                                   
-gui                 是否安装系统图形界面，默认值：[N]                                                   
-opd                 安装完成是否优化 Oracle 数据库，默认值：[N]                                                   
-vbox                在虚拟机 virtualbox 上安装 RAC 时需要设置 -vbox Y，用于修复 BUG，默认值：[N]                                                   
-fd                  过滤多路径磁盘，去除重复路径，获取唯一盘符：参数值为非ASM盘符（系统盘等），例如：-fd /dev/sda，多个盘符用逗号拼接：-fd /dev/sda,/dev/sdb                                             
-hf                  安装完成是否配置内存大页，默认值：[N]                       
```

## 单机
### 最简安装
```bash
./OracleShellInstall -lf eth0 `# 主机网卡名称`
```
### 生产环境安装
```bash
./OracleShellInstall -lf ens33 `# 主机网卡名称`\
-n uos1050d `# 主机名`\
-op oracle `# 主机 oracle 用户密码`\
-d /u01 `# Oracle 软件安装基础目录`\
-ord /oradata `# 数据库文件存放目录`\
-o lucifer `# 数据库名称`\
-dp 'Passw0rd#PST' `# sys/system 用户密码`\
-ds AL32UTF8 `# 数据库字符集`\
-ns AL16UTF16 `# 国家字符集`\
-redo 1000 `# 在线重做日志大小（M）`\
-opd Y `# 是否优化数据库`
```

## 单机 ASM
### 最简安装
```bash
./OracleShellInstall -lf eth0 `# 主机网卡名称` \
-dd /dev/sdc `# DATA 磁盘盘符名称`
```
### 生产环境安装
```bash
./OracleShellInstall -lf ens33 `# 主机网卡名称`\
-n uos1050d `# 主机名`\
-op oracle `# 主机 oracle 用户密码`\
-d /u01 `# Oracle 软件安装基础目录`\
-o lucifer `# 数据库名称`\
-dp 'Passw0rd#PST' `# sys/system 用户密码`\
-ds AL32UTF8 `# 数据库字符集`\
-ns AL16UTF16 `# 国家字符集`\
-redo 1000 `# 在线重做日志大小（M）`\
-dd /dev/sdc `# DATA 磁盘盘符名称`\
-opd Y `# 是否优化数据库`
```

### Grid 和 DB 不同版本
以 `19C Grid` 和 `11GR2 DB` 为例：
```bash
./OracleShellInstall -lf ens33 `# 主机网卡名称`\
-n uos1050d `# 主机名`\
-op oracle `# 主机 oracle 用户密码`\
-d /u01 `# Oracle 软件安装基础目录`\
-o lucifer `# 数据库名称`\
-dp 'Passw0rd#PST' `# sys/system 用户密码`\
-ds AL32UTF8 `# 数据库字符集`\
-ns AL16UTF16 `# 国家字符集`\
-redo 1000 `# 在线重做日志大小（M）`\
-dd /dev/sdc `# DATA 磁盘盘符名称`\
-opd Y `# 是否优化数据库`\
-giv 19 `# Grid 软件版本号`
```
