let registerInfo

function renderRegisterInfo(data) {
    registerInfo = data
    $('#registerId').val(data.registerId)
    $('#userName').val(data.userName)
}

layui.use(['form', 'step'], function () {
    var $ = layui.$,
        form = layui.form,
        step = layui.step;

    step.render({
        elem: '#stepForm',
        filter: 'stepForm',
        width: '100%', //设置容器宽度
        stepWidth: '600px',
        height: '380px',
        stepItems: [{
            title: '填写入款信息'
        }, {
            title: '确认入款信息'
        }, {
            title: '完成'
        }]
    });

    //入款信息渲染
    form.on('submit(formStep)', function (data) {
        data.field.balance = registerInfo.balance
        registerInfo.money = +data.field.money
        $('#textRegisterId').text(data.field.registerId)
        $('#textUserName').text(data.field.userName)
        $('#textBalance').text(data.field.balance + ' 元')
        $('#textMoney').text(data.field.money + ' 元')
        step.next('#stepForm');
        return false;
    });

    //提交入款
    form.on('submit(formStep2)', function () {
        axios({
            method: 'POST',
            url: '/register/addMoney',
            data: registerInfo
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            $('#cleanMoney').val('');
            parent.$("#searchRegisterBalanceBtn").click()
            step.next('#stepForm');
            return false;
        })
    });


    $('.pre').click(function () {
        step.pre('#stepForm');
    });

    $('.next').click(function () {
        step.next('#stepForm');
    });
})