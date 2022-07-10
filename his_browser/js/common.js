//拦截所有请求，添加路径前缀
// axios.defaults.baseURL = 'http://www.liulongbin.top:3007';
axios.defaults.baseURL = 'http://localhost:6543';

// axios.defaults.withCredentials=true
//从需求角度出发，没有必要所有的请求都添加token
// axios.defaults.headers.common['Authorization'] = localStorage.getItem("token");

// 添加请求拦截器
//use方法里面可以传递两个函数
axios.interceptors.request.use(function (config) {
    //打印config参数
    // console.log(config);
    //判断路径中是否包含/api 或者/my
    //或者>=0  或者 !== -1  或者> -1
    //indexOf() 方法可返回某个指定的字符串值在字符串中首次出现的位置。如果要检索的字符串值没有出现，则该方法返回 -1。

    if (config.url.indexOf('/api')===-1) {
        //此处是=赋值
        // config.headers = {
        //     Authorization: localStorage.getItem('token')
        // }
        //这样赋值，不会影响原来的头信息设置!
        //所有头信息的色湖之不要使用对象赋值，要使用 .属性 . 不会出现覆盖
        config.headers.Authorization = localStorage.getItem('token')
    }

    //修改完毕的config需要返回
    return config;
}, function (error) {
    //Promise用法
    return Promise.reject(error);
});

// 添加响应拦截器
axios.interceptors.response.use(function (response) {
    //输出响应结果
    // console.log(response)
    if (response.data.message === "身份认证失败！") {
        //跳转到登录页面，销毁token
        location.href = './page/login.html'
        localStorage.removeItem('token')
        return;
    }
    //返回response
    return response;
}, function (error) {
    return Promise.reject(error);
})
