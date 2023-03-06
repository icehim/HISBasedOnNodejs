//导入express-基于nodejs的web开发框架
const express = require('express');
//创建
const app = express();

// 引入校验规则的包，在定义错误级别的中间件时会用到
const joi = require('@hapi/joi')
//导入验证码session模块
const session = require('express-session');
//导入验证码cookie模块
const cookieParser = require('cookie-parser');
//导入JsonWebToken
const expressJWT = require('express-jwt');

app.use((req, res, next) => {
    // status 默认值为 1，表示失败的情况
    // err 的值，可能是一个错误对象，也可能是一个错误的描述字符串
    res.cc = function (err, status = 1) {
        res.send({
            status,
            message: err instanceof Error ? err.message : err,
        })
    }
    next()
})


//跨域设置
app.all("*", function (req, res, next) {
    res.header('Access-Control-Allow-Origin', 'http://localhost:63342');
    res.header('Access-Control-Allow-Credentials', true);
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE');
    res.header('Access-Control-Allow-Headers', 'Content-Type, Content-Length, Authorization, Accept, X-Requested-With');
    next();
})
//cookie和session中间件初始化
app.use(session({
    secret: '12345',
    cookie: {maxAge: 60000},
    resave: false,
    saveUninitialized: false,
}));

app.use(cookieParser());

//使用
app.use(
    //忽略哪些路径
    //解析token
    expressJWT({secret: 'hissys'}).unless({path: [/^\/api/]})
);

// 要想接收 application/x-www-form-urlencoded请求体参数，要如下设置
app.use(express.urlencoded({extended: false}));//设置了这句话，req上就有body属性
// content-type:application/json
app.use(express.json());

//导入验证码中间件
const captchaRouter = require('./router/captcha');
//挂载路由，自定义路由前缀
app.use('/api', captchaRouter);

//挂载-登录/注册模块化路由
const loginRouter = require('./router/login');
//挂在路由，自定义路由前缀
app.use('/api', loginRouter);

//个人中心模块化
const userRouter = require('./router/user');
app.use('/my', userRouter);

//病人管理模块化
const registerRouter = require('./router/register');
app.use('/register', registerRouter);

//分类模块化
const cateRouter = require('./router/cate');
app.use('/cate', cateRouter);

//药品模块化
const drugRouter = require('./router/drugInfo');
app.use('/drug', drugRouter);

//项目模块化
const projectRouter = require('./router/projectInfo');
app.use('/project', projectRouter);

//药房模块化
const pharmacyRouter = require('./router/pharmacy');
app.use('/pharmacy', pharmacyRouter);

//系统管理模块化
const sysManageRouter = require('./router/sysManage');
app.use('/sysManage', sysManageRouter);

//公告管理模块化
const noticeManageRouter = require('./router/noticeManage');
app.use('/noticeManage', noticeManageRouter);

//错误处理中间件，一般写道最末尾，如果有监听，写道监听之前
app.use((err, req, res,next) => {
    // 验证失败导致的错误
    if (err instanceof joi.ValidationError) return res.cc(err)
    // 身份认证失败后的错误
    if (err.name === 'UnauthorizedError') return res.cc('身份认证失败！')
    // 未知的错误
    res.cc(err)
})

//监听
app.listen(6543, function () {
    console.log('后端服务启动在http://localhost:6543')
})

