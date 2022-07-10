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
        getRegisterDrugList(res.data.data[0].registerId)
    });
})

getALLDrugInfo()

//渲染所有药品信息
function getALLDrugInfo() {
    axios({
        method: 'GET',
        url: '/drug/getALLDrugInfo',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderPharmacyDrug(res.data.data);
    });
}

//获取患者药品清单
function getRegisterDrugList(registerId) {
    valueInPage.registerId = registerId
    axios({
        method: 'GET',
        url: '/drug/getRegisterDrugInfo',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderRegisterDrug(res.data.data);
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

//渲染药房表格
function renderPharmacyDrug(PharmacyList) {
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: PharmacyList,
            height: 'full-224',
            toolbar: '#ToolBar',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 5,
                limits: [5, 10, 20, 30, 40],
            },
            cols: [[
                {field: 'pharmacyId', title: '药品序号', align: "center"},
                {field: 'pharmacyName', title: '药品名称', width: 200, align: "center"},
                {field: 'unitName', title: '计量单位', align: "center"},
                {field: 'sellingPrice', title: '售价', align: "center"},
                {field: 'drugstoreNum', title: '数量', align: "center"},
                {title: '操作', toolbar: '#currentTableBar', align: "center"}
            ]],
        });

        // 监听搜索操作
        form.on('submit(data-search-btn1)', function (data) {
            //执行搜索重载
            axios({
                method: 'GET',
                url: '/drug/selectDrugInfo',
                params: data.field
            }).then(res => {
                //判断是否获取到数据
                if (res.data.status !== 0) {
                    return layui.layer.msg(res.data.message);
                }
                renderPharmacyDrug(res.data.data)
            });

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('tool(currentTableFilter1)', function (obj) {
            if (check !== 0) return layer.msg('请先查询患者信息');
            if (balance < -500) return layer.msg('您已欠费太多，请先缴费!');
            let subData = obj.data;
            mainIndex1 = layer.open({
                type: 1,
                title: '选择数量',
                content: $("#drugNumPage"),
                area: ['300px', '180px']
            });

            form.on('submit(saveBtn)', function (data) {
                subData.registerId = valueInPage.registerId;
                subData.drugNum = +data.field.drugNum;//
                axios({
                    method: 'POST',
                    url: '/drug/addDrugToRegister',
                    data: subData
                }).then(res => {
                    if (res.data.status !== 0) {
                        return layer.msg(res.data.message)
                    }
                    $('#drugNum').val('')
                    $('#searchRegisterBalanceBtn').click()
                    getALLDrugInfo();
                    layer.close(mainIndex1);
                    layer.msg(res.data.message)
                })
            })

            $('#close1').on('click', function () {
                //关闭弹出的页面
                layer.close(mainIndex1)
                $("#drugNum").val("");
            })
        });
    });
}


function renderRegisterDrug(drugList) {
    check = 0
    layui.use(['form', 'table'], function () {
        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId1',
            data: drugList,
            height: 'full-224',
            toolbar: '#ToolBar1',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 5,
                limits: [5, 10, 20, 30, 40],
            },
            cols: [[
                {field: 'hospitalPriceListId', title: '序号', align: "center"},
                {field: 'drugName', title: '药品名称', width: 200, align: "center"},
                {field: 'drugNum', title: '数量', align: "center"},
                {field: 'inHospitalPrice', title: '售价', align: "center"},
                {field: 'inHospitalPriceTotal', title: '总价', align: "center"},
                {title: '操作', toolbar: '#currentTableBar1', align: "center"}
            ]],
        });

        form.on('submit(data-search-btn2)', function (data) {
            data.field.registerId = valueInPage.registerId
            axios({
                method: 'GET',
                url: '/drug/selectRegisterDrugInfo',
                params: data.field
            }).then(res => {
                //判断是否获取到数据
                if (res.data.status !== 0) {
                    return layui.layer.msg(res.data.message);
                }
                renderRegisterDrug(res.data.data)
            });

            return false;
        });

        /**
         * toolbar监听事件
         */

        //转院
        table.on('tool(currentTableFilter2)', function (obj) {
            if (obj.event === "edit2") {
                layer.confirm('确认要删除吗？', {
                    btn: ['确定', '取消']//按钮
                }, function (index) {
                    axios({
                        method: 'POST',
                        url: '/drug/deleteDrugToRegister',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        $("#searchRegisterBalanceBtn").click()
                        getALLDrugInfo();
                        layer.msg(res.data.message)
                    })
                    layer.close(index);
                });
            }
        });
    });
}

