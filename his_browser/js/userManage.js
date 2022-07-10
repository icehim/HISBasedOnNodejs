let valueInPage = {
    userId: '',
    userRoleMenuArr: [],
}

getUserInfo()

//搜索功能
$("#searchUserBtn").on('click', function () {
    let data1 = $("#formSelectUser").serialize()
    axios({
        method: 'POST',
        url: '/sysManage/selectUserInfo',
        data: data1
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderTable(res.data.data);
    });
})

function getUserInfo() {
    axios({
        url: '/sysManage/getAllUserInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        renderTable(res.data.data);
    });
}

let openIndex

function renderTable(user) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: user,
            toolbar: '#toolbarDemo',
            // cellMinWidth:150,
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'userId', title: 'ID', sort: true, align: "center", width: 60},
                {field: 'loginName', title: '登陆账号', align: "center", width: 100,},
                {field: 'realName', title: '用户姓名', align: "center", width: 90,},
                {
                    field: 'sex', title: '性别', align: "center", width: 60, templet: function (d) {
                        return d.sex === 1 ? '男' : '女';
                    }
                },
                {field: 'phone', title: '用户电话', align: "center"},
                {field: 'address', title: '用户地址', align: "center"},
                {field: 'identity', title: '身份证号', align: "center"},
                {
                    field: 'password', title: '密码', align: 'center', width: 65, templet: function (d) {
                        return "******";
                    }
                },
                {field: 'position', title: '备注', align: "center"},
                {
                    field: 'available', title: '是否可用', align: 'center', width: 95, templet: function (d) {
                        return d.available === 1 ? '<div style="color: #52C41A;font-weight: 700">可用</div>' : '<div style="color: red;font-weight: 700">不可用</div>';
                    }
                },
                {fixed: 'right', title: '操作', toolbar: '#currentTableBar', align: "center", width: 310}
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
                url = '/sysManage/addUser'
                openIndex = layer.open({
                    title: '添加用户',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['700px', '370px'],
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
                url = '/sysManage/updateUser'
                openIndex = layer.open({
                    title: '编辑用户',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['700px', '370px'],
                    content: $("#saveOrUpdateDiv"),
                    success: function () {
                        if (obj.data.userId === 1) {
                            $('#adminAvailable').attr('disabled',true)
                            form.val("dataFrm", obj.data);
                        }else {
                            $('#adminAvailable').attr('disabled',false)
                            form.val("dataFrm", obj.data);
                        }
                    },
                    end: function () {
                        $('#dataFrm')[0].reset();
                    }
                });
            }

            if (obj.event === 'selectUserRole') {
                openIndex = layer.open({
                    title: '分配用户的角色',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['700px', '400px'],
                    content: $("#selectUserRole"),
                    success: function () {
                        getUserRoleInfo(obj.data)
                    },
                    end: function () {
                    }
                });
            }

            if (obj.event === 'resetPwd') {
                layer.confirm('真的重置【' + obj.data.realName + '】这个用户的密码吗?', function (index) {
                    axios({
                        method: 'POST',
                        url: '/sysManage/resetUserPwd',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        layer.msg(res.data.message)
                        getUserInfo()
                    })
                });
            }

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.realName + '】这名用户吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/sysManage/deleteUser',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getUserInfo()
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
                getUserInfo()
                layer.close(openIndex)
            })
            return false;
        });
    });
}

function getUserRoleInfo(data) {
    axios({
        url: '/sysManage/getUserRoleInfo',
        params: data
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        res.data.data.userId = data.userId
        renderTable1(res.data.data);
    });
}

function renderTable1(role) {
    valueInPage.userId = role.userId
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#roleTable',
            data: role,
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 5,
                limits: [5, 20, 30, 40, 50],
            },
            cols: [[
                {type: 'checkbox', fixed: 'left'},
                {field: 'roleId', title: 'ID', sort: true, align: "center", width: 80},
                {field: 'roleName', title: '角色名称', align: "center"},
                {field: 'roleDesc', title: '角色备注', align: "center"},
            ]],
        });

        form.on('submit(updateRoleMenuInfo)', function () {
            let checkStatus = table.checkStatus('roleTable');
            test(checkStatus)

            function test(checkStatus) {
                valueInPage.userRoleMenuArr = []
                for (let i in checkStatus.data) {
                    valueInPage.userRoleMenuArr.push(checkStatus.data[i].roleId)
                }
            }

            axios({
                method: 'POST',
                url: '/sysManage/updateUserRoleInfo',
                data: valueInPage
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getUserInfo()
                layer.close(openIndex)
            })
            return false;
        });
    })
}
