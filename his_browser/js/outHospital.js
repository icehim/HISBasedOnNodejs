let valueInPage = {
    registerId: '',
    userName: '',
    balance: '',
    price: ''
}
let check = 1
let balance
let price
//初始化所有住院病人信息
getAllOutRegisterInfo()

//发送ajax请求
function getAllOutRegisterInfo() {
    axios({
        method: 'GET',
        url: '/register/AllOutHospitalInfo',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        //渲染
        renderTable(res.data.data);
    });
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
        //渲染患者缴费信息
        renderRegisterMoney(res.data.data[0])
        //渲染患者缴费清单
        $("#searchRegisterBalanceBtn").hide();
        $("#doSub").show();
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
    price = registerMoney.inHospitalPriceTotal
    valueInPage.price = price;
}

//结算事件
$("#doSub").on('click', function () {
    $('#searchRegisterBalanceBtn').click()
    //判断是否还有尚未取出的药品
    setTimeout(()=>{
        doSub()
    },0)
});

function doSub() {
    axios({
        url: '/pharmacy/getRegisterTakeDrugCountInfo',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        let notice = '';
        if (balance < 0) {
            notice = "需要补缴 " + balance.toString().substring(1) + " 元！是否确认出院？";
        } else if (balance > 0) {
            notice = "需要退回 " + balance + " 元！是否确认出院？";
        } else {
            notice = "当前没有剩余余款！是否确认出院？";
        }
        layer.confirm(notice, {
            btn: ['确定', '取消']//按钮
        }, function (index) {
            axios({
                method: 'POST',
                url: '/register/outHospital',
                data: valueInPage
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getAllOutRegisterInfo();
                //关闭对话框
                layer.close(index);
                //渲染患者缴费清单
                $("#searchRegisterBalanceBtn").show();
                $("#doSub").hide();
                $("#registerInfoForm")[0].reset();
                $("#searchIdForm")[0].reset();
            })
        })
    });
}

/*住院病人信息表格渲染*/
function renderTable(userInfo) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: userInfo,
            toolbar: '#ToolBar',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'userName', title: '姓名', align: "center"},
                {field: 'sex', title: '性别', width: 60, align: 'center'},
                {field: 'age', title: '年龄', width: 60, align: 'center'},
                {field: 'idcard', title: '身份证号', width: 175, align: "center"},
                {field: 'department', title: '科室', align: "center", width: 90},
                {field: 'doctorName', title: '医生', align: "center"},
                {field: 'bedName', title: '床位', align: "center"},
                {
                    field: 'registerDate',
                    title: '住院日期',
                    templet: "<div>{{layui.util.toDateString(d.registerDate, 'yyyy年MM月dd日')}}</div>",
                    width: 135
                    , align: "center"
                },
                {
                    field: 'endDate',
                    title: '出院日期',
                    templet: "<div>{{layui.util.toDateString(d.endDate, 'yyyy年MM月dd日')}}</div>",
                    width: 135
                    , align: "center"
                },
                {field: 'money', title: '预交款', align: 'center'},
                {field: 'price', title: '已用', align: 'center'},
                {
                    field: 'prices', title: '退款', align: 'center', templet: function (d) {
                        if (d.prices > 0) {
                            return d.prices
                        } else {
                            return 0;
                        }
                    }
                },
                {
                    field: 'prices', title: '补缴', align: 'center', templet: function (d) {
                        if (d.prices < 0) {
                            return 0 - d.prices
                        } else {
                            return 0;
                        }
                    }
                },
                {title: '操作', toolbar: '#currentTableBar', width: 80, align: "center"}
            ]],
        });

        //文本框的点击事件
        $("#searchRegisterBalanceInp").on('click', function () {
            $("#searchRegisterBalanceBtn").show();
            $("#doSub").hide();
        });
        // 失焦事件
        $("#searchRegisterBalanceInp").on('blur', function () {
            $("#registerInfoForm")[0].reset();
            // $("#searchIdForm").val($(this).val());
            $("#searchRegisterBalanceBtn").show();
            $("#doSub").hide();
        });

        function renderOutRegisterDrugList(data) {
            //药品显示
            table.render({
                elem: '#outRegisterDrugList',
                title: '用户数据表',
                data: data,
                page: {
                    limit: 10,
                    limits: [10, 20, 30, 40, 50],
                },
                cols: [[   //列表数据
                    {field: 'hospitalPriceListId', title: '序号', align: 'center', width: 100},
                    {field: 'drugName', title: '药品名称', align: 'center', width: 203},
                    {field: 'drugNum', title: '数量', align: 'center', width: 150},
                    {field: 'inHospitalPrice', title: '售价', align: 'center', width: 150},
                    {field: 'inHospitalPriceTotal', title: '总价', align: 'center', width: 150}
                ]]
            })
        }

        function renderOutRegisterTechList(data) {
            //项目显示
            table.render({
                elem: '#outRegisterTechList',
                title: '用户数据表',
                data: data,
                page: {
                    limit: 10,
                    limits: [10, 20, 30, 40, 50],
                },
                cols: [[   //列表数据
                    {field: 'hospitalPriceListId', title: '序号', align: 'center', width:104},
                    {field: 'drugName', title: '项目名称', align: 'center', width:250},
                    {field: 'inHospitalPrice', title: '售价', align: 'center', width: 150},
                    {
                        field: 'htime',
                        title: '项目时间',
                        templet: "<div>{{layui.util.toDateString(d.htime, 'yyyy年MM月dd日 HH:mm:ss')}}</div>",
                        align: 'center',
                        width: 250
                    }
                ]]
            })
        }

        // 监听搜索操作
        form.on('submit(data-search-btn1)', function (data) {
            //执行搜索重载
            axios({
                method: 'GET',
                url: '/register/getRegisterOutInfo',
                params: data.field
            }).then(res => {
                //判断是否获取到数据
                if (res.data.status !== 0) {
                    return layui.layer.msg(res.data.message);
                }
                renderTable(res.data.data)
            });
            return false;
        });

        table.on('tool(currentTableFilter1)', function (obj) {
            obj.data.registerDate = layui.util.toDateString(obj.data.registerDate, 'yyyy年MM月dd日')
            obj.data.endDate = layui.util.toDateString(obj.data.endDate, 'yyyy年MM月dd日')
            layer.open({
                type: 1,
                title: '费用详情',
                content: $("#details"),
                area: ['800px', '470px'],
                success: function (index) {
                    $.each(obj.data, function (index, item) {
                        $("#" + index + "1").html(item);
                    });

                    axios({
                        method: 'GET',
                        url: '/register/getOutRegisterDrugInfo',
                        params: obj.data
                    }).then(res => {
                        //判断是否获取到数据
                        if (res.data.status !== 0) {
                            return layui.layer.msg(res.data.message);
                        }
                        renderOutRegisterDrugList(res.data.data)
                    });

                    axios({
                        method: 'GET',
                        url: '/register/getOutRegisterTechInfo',
                        params: obj.data
                    }).then(res => {
                        //判断是否获取到数据
                        if (res.data.status !== 0) {
                            return layui.layer.msg(res.data.message);
                        }
                        renderOutRegisterTechList(res.data.data)
                    });

                }
            });
        })
    });
}
