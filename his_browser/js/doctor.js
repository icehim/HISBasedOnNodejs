let valueInPage = {
    doctorName: ""
}

getDoctor()
getDepartments()

//搜索功能
$("#searchDoctorBtn").on('click', function () {
    valueInPage.doctorName = $("#searchDoctorInp").val()
    axios({
        method: 'GET',
        url: '/cate/selectDoctor',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderTable(res.data.data);
    });
})


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

function getDoctor() {
    axios({
        url: '/cate/getDoctor',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        renderTable(res.data.data);
    });
}

function renderTable(doctor) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: doctor,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'doctorId', title: 'ID', sort: true, align: "center"},
                {field: 'doctorName', title: '姓名', align: "center"},
                {field: 'department', title: '所属科室', align: "center"},
                {title: '操作', toolbar: '#currentTableBar', align: "center"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        let url
        table.on('toolbar(currentTableFilter)', function (obj) {

            if (obj.event === 'add') {  // 监听添加操作
                url = '/cate/addDoctor'
                openIndex = layer.open({
                    title: '添加医生',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['360px', '240px'],
                    content: $("#addOrUpdateDoctor"),
                    success: function () {
                        $("#dataFrm")[0].reset();
                    },
                    end: function () {
                        $('#dataFrm')[0].reset();
                    }
                });
            }
        });
        table.on('tool(currentTableFilter)', function (obj) {
            if (obj.event === 'edit') {  // 监听添加操作
                url = '/cate/updateDoctor'
                openIndex = layer.open({
                    title: '编辑医生',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['360px', '240px'],
                    content: $("#addOrUpdateDoctor"),
                    success: function () {
                        form.val("dataFrm", obj.data);
                    },
                    end: function () {
                        $('#dataFrm')[0].reset();
                    }
                });
            }

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.doctorName + '】这名医生吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/cate/deleteDoctor',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getDoctor()
                    })
                });
            }
        });
        //监听提交
        form.on('submit(doSubmit)', function (obj) {
            axios({
                method: 'POST',
                url: url,
                data: obj.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getDoctor()
                layer.close(openIndex)
            })
            return false;
        });
    });
}