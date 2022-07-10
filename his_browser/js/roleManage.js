let valueInPage = {
    roleName: "",
    rid: ""
}

getRole()
let openIndex

//搜索功能
$("#searchRoleBtn").on('click', function () {
    valueInPage.roleName = $("#searchRoleInp").val()
    axios({
        method: 'GET',
        url: '/sysManage/selectRole',
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


function getRole() {
    axios({
        url: '/sysManage/getAllRoleInfo',
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
                {field: 'roleId', title: 'ID', sort: true, align: "center"},
                {field: 'roleName', title: '角色名称', align: "center"},
                {field: 'roleDesc', title: '角色备注', align: "center"},
                {
                    field: 'available', title: '是否可用', align: "center", templet: function (d) {
                        if (d.available) {
                            return '<div style="color: #52C41A;font-weight: 700">可用</div>'
                        } else return '<div style="color: red;font-weight: 700">不可用</div>'
                    }
                },
                {title: '操作', toolbar: '#currentTableBar', align: "center"}
            ]],
        });


        /**
         * toolbar监听事件
         */
        let url
        let reset
        table.on('toolbar(currentTableFilter)', function (obj) {

            if (obj.event === 'add') {  // 监听添加操作
                reset = obj
                url = '/sysManage/addRole'
                openIndex = layer.open({
                    title: '添加角色',
                    type: 1,
                    area: ['600px', '300px'],
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    content: $("#saveOrUpdateDiv"),
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
                reset = obj
                url = '/sysManage/updateRole'
                openIndex = layer.open({
                    title: '编辑角色',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['600px', '300px'],
                    content: $("#saveOrUpdateDiv"),
                    success: function () {
                        if (obj.data.roleId === 1) {
                            $('#roleAvailable').attr('disabled', true)
                        } else $('#roleAvailable').attr('disabled', false)
                        form.val("dataFrm", obj.data);
                    },
                    end: function () {
                        $('#roleAvailable').attr('disabled', false)
                        $('#dataFrm')[0].reset();
                    }
                });
            }

            if (obj.event === 'selectRoleMenu') {  // 监听添加操作
                // reset = obj
                // url = '/sysManage/selectRoleMenu'
                valueInPage.rid = obj.data.roleId
                openIndex = layer.open({
                    title: '分配角色菜单',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    // area:  ['280px', '500px'],
                    area:  '280px',
                    offset: '80px',
                    content: $("#selectRoleMenu"),
                    success: function () {
                        axios({
                            url: '/sysManage/selectRoleMenu',
                            params: valueInPage
                        }).then(res => {
                            if (res.data.status !== 0) {
                                return layer.msg(res.data.message)
                            }
                            doResetMenuData = res.data.data
                            renderTree(res.data.data)
                        });
                    },
                    end: function () {
                        $('#roleMenu').empty()
                    }
                });
            }

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.roleName + '】这个角色吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/sysManage/deleteRole',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getRole()
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
                getRole()
                layer.close(openIndex)
            })
            return false;
        });
        form.on('submit(doReset)', function () {
            if (reset.event === 'add') {
                $('#dataFrm')[0].reset();
            }
            if (reset.event === 'edit') {
                form.val("dataFrm", reset.data);
            }
            return false;
        });
        //监听提交

    });
}

let doResetMenuData

function renderTree(data) {
    layui.use(['jquery', 'form', 'tree', 'util'], function () {
        let tree = layui.tree,
            layer = layui.layer,
            util = layui.util,
            form = layui.form,
            $ = layui.jquery

        tree.render({
            elem: '#roleMenu',
            showCheckbox: true,
            data: data,
            id: 'checkedId',
        });

        function getChecked_list(data) {
            let id = "";
            $.each(data, function (index, item) {
                if (id !== "") {
                    id = id + "," + item.id;
                } else {
                    id = item.id;
                }
                let i = getChecked_list(item.children);
                if (i !== "") {
                    id = id + "," + i;
                }
            });
            return id;
        }

        form.on('submit(doSubmitMenu)', function () {
            let checkData = tree.getChecked('checkedId');
            let list = new Array();
            list = getChecked_list(checkData);
            valueInPage.list = list
            axios({
                method: 'POST',
                url: '/sysManage/updateRoleMenu',
                data: valueInPage
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                layer.msg(res.data.message)
                getRole()
                layer.close(openIndex)
            })
        });

        form.on('submit(doResetMenu)', function () {
            renderTree(doResetMenuData)
        });
    });
}

