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
        if (check ===0){
            //渲染患者药品信息
            getRegisterNotTakeDrugList(res.data.data[0].registerId)
            getRegisterTakeDrugList(res.data.data[0].registerId)
        }
    });
})

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
    check = 0;
}

function getRegisterNotTakeDrugList(registerId) {
    valueInPage.registerId = registerId
    axios({
        method: 'GET',
        url: '/pharmacy/getRegisterNotTakeDrugInfo',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderRegisterNotTakeDrug(res.data.data);
    });
}


function renderRegisterNotTakeDrug(drugList) {
    layui.use(['form', 'table'], function () {
        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: drugList,
            height: 'full-224',
            toolbar: '#ToolBar',
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
            ]],
        });

        table.on('toolbar(currentTableFilter1)', function (obj) {
            if (obj.config.data.length===0) return layer.msg('已全部取出!')
            if (obj.event === "add") {
                layer.confirm('确认要取出此药品订单吗？', {
                    btn: ['确定', '取消']//按钮
                }, function (index) {
                    axios({
                        method: 'POST',
                        url: '/pharmacy/registerTakeDrug',
                        data: valueInPage
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        $("#searchRegisterBalanceBtn").click()
                        layer.msg(res.data.message)
                    })
                    layer.close(index);
                });
            }
        });
    });
}


function getRegisterTakeDrugList(registerId) {
    valueInPage.registerId = registerId
    axios({
        method: 'GET',
        url: '/pharmacy/getRegisterTakeDrugInfo',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderRegisterTakeDrug(res.data.data);
    });
}


function renderRegisterTakeDrug(drugList) {
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
                {field: 'drugName', title: '药品名称', width: 130, align: "center"},
                {field: 'drugNum', title: '数量', align: "center"},
                {field: 'inHospitalPrice', title: '售价', align: "center"},
                {field: 'inHospitalPriceTotal', title: '总价', align: "center"},
                {field: 'htime', title: '取药时间',templet: "<div>{{layui.util.toDateString(d.htime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>",width: 200, align: "center"},
            ]],
        });
    });
}