getUserInfo()

function getUserInfo() {
    //发送ajax请求
    axios({
        url: '/my/userinfo', //通过请求头设置token身份认证

    }).then(res => {
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderUserinfo(res.data.data);
    });
}

function renderUserinfo(data) {
    layui.use(['form','miniTab'], function () {
        var form = layui.form,
            layer = layui.layer,
            miniTab = layui.miniTab;
        $('#dataFrm')[0].reset();
        form.val("dataFrm", data);
        //监听提交

        $('#resetUserInfoBtn').on('click',function () {
            form.val("dataFrm", data);
        })

        form.on('submit(doSubmit)', function (data) {
            axios({
                method: 'POST',
                url: '/my/updateUserInfo',
                data: data.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getUserInfo()
            })
        });
    });
}