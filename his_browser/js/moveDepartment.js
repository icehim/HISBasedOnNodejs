

let registerinfo

function renderOldDepartment(data) {
    registerinfo = data
    $('#oldDepartmentId').val(data.department)
    $('#oldDoctorId').val(data.doctorName)
    $('#oldBedId').val(data.bedName)
}

// let operator = window.parent.parent.document.querySelector('#realname').textContent

getDepartments()


function getDepartments() {
    axios({
        url: '/cate/getDepartments',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $.each(res.data.data, function (index, item) {
            $("#newDepartmentId").append(new Option(item.department, item.departmentId))
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
        $("#newDoctorId").empty()
        $("#newDoctorId").append(new Option('请选择医生', ''))
        $.each(res.data.data, function (index, item) {
            $("#newDoctorId").append(new Option(item.doctorName, item.doctorId))
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
        $("#newBedId").empty()
        $("#newBedId").append(new Option('请选择床位', ''))
        $.each(res.data.data, function (index, item) {
            $("#newBedId").append(new Option(item.bedName, item.bedId))
        })
        layui.form.render("select");
    });
}

// 联动
layui.use('form', function () {
    let form = layui.form,
        layer = layui.layer,
        $ = layui.$;

    form.on('select(newDepartmentId)', function (data) {
        getDoctors(data);
        getBed(data);
    });
    //监听提交
    form.on('submit(saveBtn)', function (data) {
        data.field.registerId = registerinfo.registerId
        axios({
            method: 'POST',
            url: '/register/updateRegister',
            data: data.field
        }).then(res => {
            if (res.data.status !== 0) {
                return layer.msg(res.data.message)
            }
            //成功：提示初始化文章分类
            parent.layer.msg('更新成功')
            parent.getALLRegisterInfo()
            //关闭对话框
            let iframeIndex = parent.layer.getFrameIndex(window.name);
            // console.log(iframeIndex)
            parent.layer.close(iframeIndex);
        })
        return false;
    });
});
