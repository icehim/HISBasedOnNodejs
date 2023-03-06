##  毕业设计-基于Nodejs的住院信息系统

> ### 前言:
>
> 该项目是本人毕业时所全站开发的系统，由此获得优秀毕业论文。
>
> 技术栈：Layui + JQuery + Axios + Echarts + Nodejs + Express + Mysql
>
> 在线演示地址:
>
> 账号:admin   密码:123456

> ### 安装环境:
> #### 前端：
> 必须在本地 web 服务器环境下，
>
> 1. 通过本地 web 服务器去访问 *./start/index.html* 即可运行系统
>
> #### 后端:
> 1. 安装node,之后在his_server文件下npm i下载依赖包
> 2. 安装mysql，将his_database文件中的数据库文件执行一下
> 3. 之后在his_browser\js\common.js和his_server\app.js和his_server\database\index.js中分别配置前端，后端，跨域接口，数据库设置

### 运行截图

#### 登录页面

![image-20220728231957448](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728231957448.png)


#### 进入首页

![image-20220728233703207](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728233703207.png)

> 首页分为`业务管理`和`系统管理`两大部分

#### 业务管理

![image-20220728234131449](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728234131449.png)

#### 系统管理

![image-20220728234158146](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728234158146.png)

#### 支持简单的菜单分配

![image-20220728234308036](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728234308036.png)

#### 角色分配

![image-20220728234732448](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728234732448.png)

> ### 功能挺多的，毕竟做了一个多月，但是代码也挺容易看懂的，就是太“屎”了
>
> ### 里面很多功能就是增删改查就完事儿了，稍微有点难度的就是，父子菜单的遍历渲染到页面。
>
> # 觉得对你有帮助(不是倒忙)的话，可以点个星星~
