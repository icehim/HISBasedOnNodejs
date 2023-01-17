// 导入
const express = require('express');
// 创建路由对象
const router = express.Router();
// 导入数据库模块，根据用户名查询，判断是否查到具体的数据;
const db = require('../database/index');
// 下载: npm  i  utility@1.17.0
const utility = require('utility');
// 下载：npm  i  jsonwebtoken@8.5.1
// 导入
const jwt = require('jsonwebtoken');
// 登陆
router.post('/login', (req, res) => {
    if (!req.session.captcha) return res.send({status: 1, message: "验证码失效,请重新输入!"});
    // 把前端传递过来的post参数解构
    let {loginName, password,captcha} = req.body;
    //获取过来的验证码以及session中的验证码统一小写
    captcha = captcha.toLowerCase();
    let sessionCaptcha = req.session.captcha.toLowerCase()
    //验证码判断
    if (captcha !== sessionCaptcha) return res.send({status: 1, message: "验证码输入错误!"});
    // 密码加密
    password = utility.md5(password);
    // 用户名密码判断 ： 1.根据用户名查询数据，判断密码;   2.根据用户名和密码查询数据，判断有没有查到;
    let sql = `select * from sys_user where loginName="${loginName}" and password="${password}" and available = 1`;
    db(sql, (err, results) => {
        // 判断sql
        if (err) return res.send({status: 1, message: err.message});
        // 判断结果
        if (results.length === 0) return res.send({status: 1, message: "用户名或密码错误！"});

        // 生成token
        let userinfo = {id: results[0].userId};// id,username,nickname, password,email,user_pic
        const token = "Bearer " + jwt.sign(userinfo, "hissys", {expiresIn: '24h'});

        // 成功
        res.send({
            status: 0,
            message: "登录成功!",
            token: token
        });
    })
});

// 导出
module.exports = router;
