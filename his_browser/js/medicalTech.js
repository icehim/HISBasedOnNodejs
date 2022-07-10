let valueInPage = {
    projectName: ""
}

/*项目大类start*/

getProjectTag()

layui.use(['element'],function () {
    let element = layui.element;
});

//搜索功能
$("#searchProjectTag").on('click', function () {
    valueInPage.projectName = $("#searchProjectTagInp").val()
    axios({
        method: 'GET',
        url: '/project/selectProjectTag',
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

function getProjectTag() {
    axios({
        url: '/project/getProjectTag',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $.each(res.data.data, function (index, item) {
            $("#projectId").append(new Option(item.projectName, item.projectId))
        })
        layui.form.render("select");
        renderTable(res.data.data);
    });
}

function renderTable(projectTag) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: projectTag,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'projectId', title: 'ID', sort: true, align: "center"},
                {field: 'projectName', title: '项目大类', align: "center"},
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
                openIndex = layer.open({
                    title: '添加项目大类',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['370px', '190px'],
                    content: $("#addProjectTag"),
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
            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.projectName + '】这个项目吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/project/deleteProjectTag',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getProjectTag()
                    })
                });
            }
        });
        //监听提交
        form.on('submit(doSubmit)', function (obj) {
            axios({
                method: 'POST',
                url: '/project/addProjectTag',
                data: obj.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getProjectTag()
                layer.close(openIndex)
            })
            return false;
        });
    });
}

/*项目大类end*/


/*收费项目start*/

/*获取所有住院收费项目*/
getUnitInfo()

function getUnitInfo() {
    axios({
        url: '/cate/unitInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $.each(res.data.data, function (index, item) {
            $("#unitId").append(new Option(item.unitName, item.unitId))
        })
        layui.form.render("select");
    });
}

getAllProjectInfo()

//搜索功能
$("#searchProjectNameBtn").on('click', function () {
    valueInPage.projectName = $("#searchProjectNameInp").val()
    axios({
        method: 'GET',
        url: '/project/selectProjectInfo',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderTable1(res.data.data);
    });
})

//渲染所有药品信息
function getAllProjectInfo() {
    axios({
        method: 'GET',
        url: '/project/getAllProjectInfo',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderTable1(res.data.data);
    });
}

function renderTable1(project) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId1',
            data: project,
            toolbar: '#toolbarDemo1',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'inoutpatientId', title: 'ID', align: "center",width:"10%"},
                {field: 'projectName', title: '项目名称',align: "center",width:"25%"},
                {field: 'projectNames', title: '项目大类', align: "center",width:"25%"},
                {field: 'price', title: '价格', align: "center",width:"15%"},
                {field: 'unitName', title: '单位', align: "center",width:"10%"},
                {title: '操作', toolbar: '#currentTableBar1', align: "center",width:"14.8%"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        let url
        let reset1
        table.on('toolbar(currentTableFilter1)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                reset1 = obj;
                url = '/project/addProject'
                openIndex = layer.open({
                    title: '添加住院收费项目',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['370px', '360px'],
                    content: $("#addOrUpdateProject"),
                    success: function () {
                        $("#dataFrm1")[0].reset();
                    },
                    end: function () {
                        $('#dataFrm1')[0].reset();
                    }
                });
            }
        });
        table.on('tool(currentTableFilter1)', function (obj) {

            if (obj.event === 'edit') {  // 监听添加操作
                reset1 = obj;
                url = '/project/updateProject'
                openIndex = layer.open({
                    title: '修改住院收费项目',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['370px', '360px'],
                    content: $("#addOrUpdateProject"),
                    success: function () {
                        form.val("dataFrm1", obj.data);
                    },
                    end: function () {
                        $('#dataFrm1')[0].reset();
                    }
                });
            }

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.projectName + '】这个项目吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/project/deleteProject',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getAllProjectInfo()
                    })
                });
            }
        });
        //监听提交
        form.on('submit(doSubmit1)', function (obj) {
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
                getAllProjectInfo()
                layer.close(openIndex)
            })
            return false;
        });
    });
}

/*收费项目end*/


/*住院床位start*/

/*获取科室信息*/
getDepartments()


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

getAllBedInfo()

//搜索功能
$("#searchBedBtn").on('click', function () {
    valueInPage.bedName = $("#searchBedInp").val()
    axios({
        method: 'GET',
        url: '/project/selectBed',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderTable2(res.data.data);
    });
})

//渲染所有床位信息
function getAllBedInfo() {
    axios({
        method: 'GET',
        url: '/project/getAllBed',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderTable2(res.data.data);
    });
}

function renderTable2(bed) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId2',
            data: bed,
            toolbar: '#toolbarDemo2',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'bedId', title: 'ID', align: "center",width:"20%"},
                {field: 'bedName', title: '床位',align: "center",width:"20%"},
                {field: 'department', title: '所属科室', align: "center",width:"20%"},
                {field: 'Price', title: '价格', align: "center",width:"20%",templet:function(d){return d.Price+'元 / 天'}},
                {title: '操作', toolbar: '#currentTableBar2', align: "center",width:"19.8%"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        let url
        let reset2

        table.on('toolbar(currentTableFilter2)', function (obj) {

            if (obj.event === 'add') {  // 监听添加操作
                reset2 = obj
                url = '/project/addBed'
                openIndex = layer.open({
                    title: '添加床位',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['380px', '300px'],
                    content: $("#addOrUpdateBed"),
                    success: function () {
                        $("#dataFrm2")[0].reset();
                    },
                    end: function () {
                        $('#dataFrm2')[0].reset();
                    }
                });
            }
        });

        table.on('tool(currentTableFilter2)', function (obj) {
            if (obj.event === 'edit') {  // 监听添加操作
                reset2 = obj
                url = '/project/updateBed'
                openIndex = layer.open({
                    title: '修改床位信息',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['380px', '300px'],
                    content: $("#addOrUpdateBed"),
                    success: function () {
                        form.val("dataFrm2", obj.data);
                    },
                    end: function () {
                        $('#dataFrm2')[0].reset();
                    }
                });
            }

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.bedName + '】这个床位吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/project/deleteBed',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        layer.msg(res.data.message)
                        getAllBedInfo()
                    })
                });
            }
        });
        // //监听提交
        form.on('submit(doSubmit2)', function (obj) {
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
                getAllBedInfo()
                layer.close(openIndex)
            })
            return false;
        });
    });
}

/*住院床位end*/


/*报销类型start*/

getAllMedicareInfo()

//搜索功能
$("#searchMedicareBtn").on('click', function () {
    valueInPage.medicareType = $("#searchMedicareInp").val()
    axios({
        method: 'GET',
        url: '/project/selectMedicare',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderTable3(res.data.data);
    });
})

//渲染所有报销信息
function getAllMedicareInfo() {
    axios({
        method: 'GET',
        url: '/project/getAllMedicare',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderTable3(res.data.data);
    });
}

function renderTable3(medicare) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId3',
            data: medicare,
            toolbar: '#toolbarDemo3',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'medicareId', title: 'ID', align: "center",width:"25%"},
                {field: 'medicareType', title: '报销类型',align: "center",width:"25%"},
                {field: 'medicarePercent', title: '报销百分比', align: "center",width:"25%"},
                {title: '操作', toolbar: '#currentTableBar3', align: "center",width:"24.8%"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        let url
        table.on('toolbar(currentTableFilter3)', function (obj) {

            if (obj.event === 'add') {  // 监听添加操作
                url = '/project/addMedicare'
                openIndex = layer.open({
                    title: '添加报销类型',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['360px', '250px'],
                    content: $("#addOrUpdateMedicare"),
                    success: function () {
                        $("#dataFrm3")[0].reset();
                    },
                    end: function () {
                        $('#dataFrm3')[0].reset();
                    }
                });
            }
        });

        table.on('tool(currentTableFilter3)', function (obj) {

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.medicareType + '】这个类型吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/project/deleteMedicare',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        layer.msg(res.data.message)
                        getAllMedicareInfo()
                    })
                });
            }
        });
        //监听提交
        form.on('submit(doSubmit3)', function (obj) {
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
                getAllMedicareInfo()
                layer.close(openIndex)
            })
            return false;
        });
    });
}

/*报销类型end*/

/*今日bug:重置按钮*/