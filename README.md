##  毕业设计-基于Nodejs的住院信息系统

> ### 前言:
>
> 该项目是本人毕业时所开发的系统，前端用layui，后端用nodejs，用axios来交互数据。奈何水平有限，项目还有亿点bug，不过完成运行下来还是没问题。最近在学vue，之后说不定会用vue重构。
>
> 👉[在线演示地址](https://project.thinkpeach.cn/his_browser/page/login.html)      账号:admin   密码:123456

> ### 安装环境:
> #### 前端：
> 必须在服务器环境下，vscode的live server、webpack、等。。
> #### 后端:
> 1. 安装node,之后在his_server文件下npm i下载依赖包
> 2. 安装mysql，将his_database文件中的数据库文件执行一下
> 3. 之后在his_browser\js\common.js和his_server\app.js和his_server\database\index.js中分别配置前端，后端，跨域接口，数据库设置

### 运行截图

- 登录页面

  ![image-20220728231957448](https://wordpress-1253884057.cos.ap-beijing.myqcloud.com/typora/image-20220728231957448.png)

有时长时间不登陆会提示：

```js
Cannot read properties of undefined(reading 'toLowerCase')
```

验证码cookie失效了，重新输入验证码再次点击登入即可。

- 进入首页

  ![image-20220728233703207](https://bucket.thinkpeach.cn/typora/image-20220728233703207.png)

  > 首页分为`业务管理`和`系统管理`两大部分

  - 业务管理

    ![image-20220728234131449](https://bucket.thinkpeach.cn/typora/image-20220728234131449.png)

  - 系统管理

    ![image-20220728234158146](https://bucket.thinkpeach.cn/typora/image-20220728234158146.png)

- 支持简单的菜单分配

  ![image-20220728234308036](https://bucket.thinkpeach.cn/typora/image-20220728234308036.png)
