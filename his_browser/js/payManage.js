let valueInPage = {
    registerId:'',
    userName:'',
    balance:'',
}


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
        valueInPage.userName=res.data.data[0].userName;
        //渲染患者缴费信息
        renderRegisterMoney(res.data.data[0])
        //渲染患者缴费清单
        getRegisterPayList(res.data.data[0].registerId)
    });
})

//获取患者缴费清单
function getRegisterPayList(registerId) {
    valueInPage.registerId = registerId
    axios({
        method: 'GET',
        url: '/register/getRegisterPayList',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //处理日期格式
        //渲染
        renderTable(res.data.data);
    });
}

//渲染患者缴费信息
function renderRegisterMoney(registerMoney) {
    $('#userName').val(registerMoney.userName);
    $('#sex').val(registerMoney.sex);
    $('#age').val(registerMoney.age);
    $('#departmentId').val(registerMoney.department);
    $('#doctorId').val(registerMoney.doctorName);
    $('#bedId').val(registerMoney.bedName);
    $('#money').val(registerMoney.money + ' 元');
    $('#inHospitalPriceTotal').val(registerMoney.inHospitalPriceTotal + ' 元');
    $('#balance').val(registerMoney.money - registerMoney.inHospitalPriceTotal + ' 元');
    valueInPage.balance = registerMoney.money - registerMoney.inHospitalPriceTotal;
}

//渲染缴费表格
function renderTable(payList) {
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: payList,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 5,
                limits: [5, 10, 20, 30, 40],
            },
            cols: [[
                {field: 'registerId', title: '住院号', sort: true, align: "center"},
                {field: 'userName', title: '姓名', align: "center"},
                {field: 'money', title: '预交金额(元)', align: "center"},
                {field: 'payDate', title: '交款时间', align: "center",templet: "<div>{{layui.util.toDateString(d.payDate, 'yyyy年MM月dd日 HH:mm:ss')}}</div>"},
            ]],
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            let iframe
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加缴费',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['850px', '500px'],
                    content: '../page/table/addMoney.html',
                    success:function (layero,index) {
                        iframe = window['layui-layer-iframe'+index];
                        iframe.renderRegisterInfo(valueInPage)
                    },
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            }
        });
    });
}

