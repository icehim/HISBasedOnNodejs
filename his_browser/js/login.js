// 粒子线条背景
$(document).ready(function () {
    $('.layui-container').particleground({
        dotColor: '#7ec7fd',
        lineColor: '#7ec7fd'
    });
});
//验证码点击切换
$('#captchaPic').click(function () {
    // 图片的src属性，拼接每次产生的时间戳
    $(this).attr("src", 'http://localhost:6543/api/captcha?time='+Date.now())
})
//入口函数
$(function () {
    let form = layui.form;

    //需求4:登录功能
    $("#formLogin").on('submit', function (e) {
        e.preventDefault();
        // axios.defaults.withCredentials = true;
        axios({
            method: 'POST',
            url: '/api/login',
            data: $(this).serialize(),
            withCredentials:true
        }).then(res => {
            //判断
            if (res.data.status !== 0) {
                $('#captchaPic').click()
                return layer.msg(res.data.message);
            }
            //成功，存储token,页面跳转到index.html
            localStorage.setItem('token', res.data.token);
            //页面跳转到index.html
            location.href = '../index.html'
        })
    })
});

