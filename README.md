# 毕业设计-基于Nodejs的住院信息系统

> ### 前言:
>
> 该项目是本人毕业时所全站开发的系统，由此获得优秀毕业论文。
>
> 技术栈：Layui + JQuery + Axios + Echarts + Nodejs + Express + Mysql
>
> 在线演示地址:[点此跳转](https://project.icehim.com/his_browser/page/login.html)
>
> 账号:admin   密码:123456

> ### 安装环境:
> #### 前端：
> 必须在本地 web 服务器环境下，
>
> 1. 通过本地 web 服务器去访问 *page/login.html* 即可运行系统
> 1. 在js\common.js中设置axios后端接口基地址
> 1. 在js\login.js 和page\login.html 中设置访问验证码的接口地址
>
> #### 后端:
> 1. 安装nodejs之后,之后在his_server文件下npm i下载依赖包
> 2. 安装mysql，将执行his_database文件中的数据库，在database\index.js文件中修改数据库账号密码等信息
> 3. 在his_server\app.js中配置跨域设置和启动端口

## 项目介绍

本系统一共27个html页面,106个后端接口。

绝大部分是增删改查，其中较为有特点的功能是：

1. 系统设计了用户，角色，权限设计。
2. token登录获取本地存储，失效后触发相应的事件。
3. 树形角色菜单的获取和渲染。
4. 逻辑功能严谨，前后端分离。

## 运行展示

### 登录页面

![image-20220728231957448](https://cos.icehim.com/typora/image-20220728231957448.png)


#### 进入首页

![image-20220728233703207](https://cos.icehim.com/typora/image-20220728233703207.png)

> **首页分为`业务管理`和`系统管理`两大部分**

#### 业务管理

![image-20220728234131449](https://cos.icehim.com/typora/image-20220728234131449.png)

#### 系统管理

![image-20220728234158146](https://cos.icehim.com/typora/image-20220728234158146.png)

#### 支持为系统角色进行菜单分配

![image-20220728234308036](https://cos.icehim.com/typora/image-20220728234308036.png)

#### 为用户分配角色

![image-20220728234732448](https://cos.icehim.com/typora/image-20220728234732448.png)

> ### 功能挺多的，代码也容易看懂，该有的注释都有。有的地方可能处理的不是很好，以后有机会进行重构。
>
> ## 觉得对你有帮助的话，可以点个星星~
