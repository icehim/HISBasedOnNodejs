let valueInPage = {
    registerId: '',
}
let check = 1
let balance
//搜索功能
$("#searchRegisterBalanceBtn").on('click', function () {
    valueInPage.registerId = $("#searchRegisterBalanceInp").val()
    axios({
        method: 'GET',
        url: '/register/selectRegisterMoney',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染患者缴费信息
        renderRegisterMoney(res.data.data[0])
        //渲染患者缴费清单
        getRegisterProjectList(res.data.data[0].registerId)
    });
})

//获取患者消费项目清单
function getRegisterProjectList(registerId) {
    valueInPage.registerId = registerId
    axios({
        method: 'GET',
        url: '/project/getRegisterProjectInfo',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderRegisterProject(res.data.data);
    });
}

//渲染患者缴费信息
function renderRegisterMoney(registerMoney) {
    $('.arrows').css('display', 'block')
    $('#userName').val(registerMoney.userName);
    $('#sex').val(registerMoney.sex);
    $('#age').val(registerMoney.age);
    $('#departmentId').val(registerMoney.department);
    $('#doctorId').val(registerMoney.doctorName);
    $('#bedId').val(registerMoney.bedName);
    $('#money').val(registerMoney.money + ' 元');
    $('#inHospitalPriceTotal').val(registerMoney.inHospitalPriceTotal + ' 元');
    $('#balance').val(registerMoney.money - registerMoney.inHospitalPriceTotal + ' 元');
    balance = registerMoney.money - registerMoney.inHospitalPriceTotal;
}

/*获取所有住院收费项目*/
getAllProjectInfo()

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
        renderProjectInfo(res.data.data);
    });
}


//渲染住院收费项目表格
function renderProjectInfo(projectList) {
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: projectList,
            toolbar: '#ToolBar',
            height: 'full-224',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 5,
                limits: [5, 10, 20, 30, 40],
            },
            cols: [[
                {field: 'inoutpatientId', title: '项目序号', align: "center"},
                {field: 'projectName', title: '项目名称', width: 160, align: "center"},
                {field: 'unitName', title: '计量单位', align: "center"},
                {field: 'price', title: '售价', align: "center"},
                {field: 'projectNames', title: '分类', align: "center"},
                {title: '操作', toolbar: '#currentTableBar', align: "center"}
            ]],
        });

        // 监听搜索操作
        form.on('submit(data-search-btn1)', function (data) {
            //执行搜索重载
            axios({
                method: 'GET',
                url: '/project/selectProjectInfo',
                params: data.field
            }).then(res => {
                //判断是否获取到数据
                if (res.data.status !== 0) {
                    return layui.layer.msg(res.data.message);
                }
                renderProjectInfo(res.data.data)
            });

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('tool(currentTableFilter1)', function (obj) {
            if (check !== 0) return layer.msg('请先查询患者信息');
            if (balance < -500) return layer.msg('您已欠费太多，请先缴费!');
            obj.data.registerId = valueInPage.registerId;
            if (obj.event === "edit1") {
                layer.confirm('确认要添加该收费项目吗？', {
                    btn: ['确定', '取消']//按钮
                }, function (index) {
                    axios({
                        method: 'POST',
                        url: '/project/addProjectToRegister',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        $("#searchRegisterBalanceBtn").click()
                        getAllProjectInfo();
                        layer.msg(res.data.message)
                    })
                    layer.close(index);
                });
            }
        });
    });
}


function renderRegisterProject(drugList) {
    check = 0
    layui.use(['form', 'table'], function () {
        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId1',
            data: drugList,
            toolbar: '#ToolBar1',
            height: 'full-224',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 5,
                limits: [5, 10, 20, 30, 40],
            },
            cols: [[
                {field: 'hospitalPriceListId', title: '序号', align: "center"},
                {field: 'drugName', title: '项目名称', width: 160, align: "center"},
                {field: 'inHospitalPrice', title: '售价', align: "center"},
                {
                    field: 'htime',
                    title: '时间',
                    templet: "<div>{{layui.util.toDateString(d.htime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>",
                    width: 200
                    , align: "center"
                },
            ]],
        });

        form.on('submit(data-search-btn2)', function (data) {
            data.field.registerId = valueInPage.registerId
            axios({
                method: 'GET',
                url: '/project/selectRegisterProjectInfo',
                params: data.field
            }).then(res => {
                //判断是否获取到数据
                if (res.data.status !== 0) {
                    return layui.layer.msg(res.data.message);
                }
                renderRegisterProject(res.data.data)
            });
            return false;
        });

        /**
         * toolbar监听事件
         */
        //
        // //转院
        // table.on('tool(currentTableFilter2)', function (obj) {
        //     if (obj.event === "edit2") {
        //         layer.confirm('确认要删除吗？', {
        //             btn: ['确定', '取消']//按钮
        //         }, function (index) {
        //             axios({
        //                 method: 'POST',
        //                 url: '/drug/deleteDrugToRegister',
        //                 data: obj.data
        //             }).then(res => {
        //                 if (res.data.status !== 0) {
        //                     return layer.msg(res.data.message)
        //                 }
        //                 $("#searchRegisterBalanceBtn").click()
        //                 getALLDrugInfo();
        //                 layer.msg(res.data.message)
        //             })
        //             layer.close(index);
        //         });
        //     }
        // });
    });
}

