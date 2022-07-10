//导入express
const express = require('express');
//导入captcha,图形验证码
const svgCaptcha = require('svg-captcha');
//创建路由对象
const router = express.Router();

router.get('/captcha', (req, res) => {
    let captcha = svgCaptcha.create({
        color: true,
        noise: 2,
        ignoreChars: 'Oo01il',
        size: 4
    })
    let {text, data} = captcha;//text存放验证码的值，data存放图片
    req.session.captcha = text;//session 存储验证码数值
    res.type('svg'); // 响应的类型
    res.send(data);
});
// 导出
module.exports = router;