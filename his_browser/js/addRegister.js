$(function () {

    let operator = window.parent.parent.document.querySelector('#realName').textContent

    getDepartments()
    getMedicare()

    function getDepartments() {
        axios({
            url: '/cate/getDepartments',
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            $.each(res.data.data, function (index, item) {
                $("#departmentId").append(new Option(item.department, item.departmentId))
            })
            layui.form.render("select");
        });
    }

    function getDoctors(data) {
        if (!data.value) return
        let params = {
            departmentId: data.value
        }
        axios({
            url: '/cate/getDoctors',
            params: params
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            //获取成功后渲染
            $("#doctorId").empty()
            $("#doctorId").append(new Option('请选择医生', ''))
            $.each(res.data.data, function (index, item) {
                $("#doctorId").append(new Option(item.doctorName, item.doctorId))
            })
            layui.form.render("select");
        });
    }

    function getBed(data) {
        if (!data.value) return
        let params = {
            departmentId: data.value
        }
        axios({
            url: '/cate/getBed',
            params: params
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            $("#bedId").empty()
            $("#bedId").append(new Option('请选择床位', ''))
            $.each(res.data.data, function (index, item) {
                $("#bedId").append(new Option(item.bedName, item.bedId))
            })
            layui.form.render("select");
        });
    }

    function getMedicare() {
        axios({
            url: '/cate/getMedicare',
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            $.each(res.data.data, function (index, item) {
                $("#medicarePercent").append(new Option(item.medicareType, item.medicarePercent))
            })
            layui.form.render("select");
        });
    }

    // 联动
    layui.use('form', function () {
        let form = layui.form,
            layer = layui.layer,
            $ = layui.$;

        form.on('select(department)', function (data) {
            getDoctors(data);
            getBed(data);
        });
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            data.field.operator = operator
            axios({
                method: 'POST',
                url: '/register/addRegister',
                data: data.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                parent.layer.msg('添加成功')
                parent.getALLRegisterInfo()
                //关闭对话框
                let iframeIndex = parent.layer.getFrameIndex(window.name);
                // console.log(iframeIndex)
                parent.layer.close(iframeIndex);
            })
            return false;
        });
    });

})