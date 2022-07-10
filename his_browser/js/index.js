getUserInfo();
getUserMenu()

function getUserMenu() {
    axios({
        //请求方式是get可以省略
        // method:'GET',
        url: '/my/initUserMenu', //通过请求头设置token身份认证
        // }
    }).then(res => {
        renderIndex(res.data)
    });
}

function renderIndex(data) {
    layui.use(['jquery', 'layer', 'miniAdmin', 'miniTongji'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniAdmin = layui.miniAdmin
        var options = {
            iniUrl: data,    // 初始化接口
            urlHashLocation: true,      // 是否打开hash定位
            bgColorDefault: false,      // 主题默认配置
            multiModule: true,          // 是否开启多模块
            menuChildOpen: false,       // 是否默认展开菜单
            loadingTime: 0,             // 初始化加载时间
            pageAnim: true,             // iframe窗口动画
            maxTabNum: 20,              // 最大的tab打开数量
        };
        miniAdmin.render(options);
        $('.login-out').on("click", function () {
            layer.confirm('确认退出登录吗?', {icon: 3, title: '提示'}, function (index) {
                //do something - 跳转到登录页面，销毁token
                location.href = 'page/login.html';
                localStorage.removeItem('token')
                layer.close(index);
            });
        });
    });
}
//获取用户信息渲染封装成函数
//要求:必须设置为全局函数，不是局部函数
function getUserInfo() {
    //发送ajax请求
    axios({
        url: '/my/userinfo', //通过请求头设置token身份认证
    }).then(res => {
        if (res.data.status !== 0) {
            location.href = 'page/login.html';
            localStorage.removeItem('token')
            return false;
        }
        //渲染
        renderUserinfo(res.data.data);
    });
}

//渲染用户信息
function renderUserinfo(userInfo) {
    let realName = userInfo.realName;
    $('#realName').text(realName);
    layer.msg(`${realName}您好! 欢迎登录~`)
}

//渲染实时时间
function countdown() {
    let myDate = new Date();
    //获取当前年
    let year = myDate.getFullYear();
    //获取当前月
    let month = myDate.getMonth() + 1;
    //获取当前日
    let date = myDate.getDate();
    let h = myDate.getHours();       //获取当前小时数(0-23)
    let m = myDate.getMinutes();     //获取当前分钟数(0-59)
    let s = myDate.getSeconds();
    let now = year + '年' + getNow(month) + '月' + getNow(date) + "日     " + getNow(h) + ':' + getNow(m) + ":" + getNow(s);
    // 赋值给展示时间
    $('#time').text(now);
}

// 获取当前时间
function getNow(s) {
    return s < 10 ? '0' + s : s;
}

setInterval(function () {
    countdown()
}, 1000);

