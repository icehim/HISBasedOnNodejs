let valueInPage = {
    department: ""
}

getDepartments()

//搜索功能
$("#searchDepartmentBtn").on('click', function () {
    valueInPage.department = $("#searchDepartmentInp").val()
    axios({
        method: 'GET',
        url: '/cate/selectDepartments',
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
        renderTable(res.data.data);
    });
}

function renderTable(department) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: department,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'departmentId', title: 'ID', sort: true, align: "center"},
                {field: 'department', title: '部门', align: "center"},
                {title: '操作', toolbar: '#currentTableBar', align: "center"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                openIndex = layer.open({
                    title: '添加新科室',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['370px', '180px'],
                    content: $("#addDepartment"),
                    end: function () {
                        $('#dataFrm')[0].reset();
                    }
                });
            }
        });

        //监听提交
        form.on('submit(doSubmit)', function (obj) {
            axios({
                method: 'POST',
                url: '/cate/addDepartments',
                data: obj.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg('添加成功')
                getDepartments()
                layer.close(openIndex)
            })
            return false;
        });

        table.on('tool(currentTableFilter)', function (obj) {
            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【'+obj.data.department+'】这个科室吗', function(index){
                    axios({
                        method: 'POST',
                        url: '/cate/deleteDepartments',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getDepartments()
                    })
                });
            }
        });
    });
}