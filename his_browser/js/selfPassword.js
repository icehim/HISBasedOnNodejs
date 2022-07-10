layui.use(['form','miniTab'], function () {
    var form = layui.form,
        layer = layui.layer,
        miniTab = layui.miniTab;

    form.on('submit(doSubmit)', function (data) {
        axios({
            method: 'POST',
            url: '/my/updateUserPassword',
            data: data.field
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            //成功：提示初始化文章分类
            layer.msg(res.data.message)
            localStorage.removeItem('token')
            setTimeout(function(){
                top.location.href = 'login.html';
            },2000)
        })
    });
});