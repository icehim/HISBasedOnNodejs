let valueInPage = {
    userName: ""
}

//初始化所有住院病人信息
getALLRegisterInfo()

//发送ajax请求
function getALLRegisterInfo() {
    axios({
        method: 'GET',
        url: '/register/getALLRegisterInfo',
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
$("#searchRegisterBtn").on('click', function () {
    valueInPage.userName = $("#searchRegisterInp").val()
    axios({
        method: 'GET',
        url: '/register/selectRegisterInfo',
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

/*住院病人信息表格渲染*/
function renderTable(userInfo) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: userInfo,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'registerId', title: '住院号', sort: true, align: "center",width:90},
                {field: 'userName', title: '姓名', align: "center",width:75},
                {field: 'sex', title: '性别', align: "center",width:60},
                {field: 'age', title: '年龄', align: "center",width:60},
                {field: 'address', title: '住址',align: "center"},
                {field: 'phone', title: '电话',align: "center",width:120},
                {field: 'idcard', title: '身份证号',align: "center", width: 180},
                {field: 'registerDate', title: '住院日期', align: "center",templet: "<div>{{layui.util.toDateString(d.registerDate, 'yyyy年MM月dd日 HH:mm:ss')}}</div>",width: 200},
                {field: 'department', title: '科室', align: "center",width: 90},
                {field: 'doctorName', title: '医生', align: "center",width:80},
                {field: 'bedName', title: '床位', align: "center",width: 110},
                {title: '操作', toolbar: '#currentTableBar', align: "center",width: 75}
            ]],
        });
        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                let index = layer.open({
                    title: '住院登记',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['700px', '470px'],
                    content: '../page/table/addRegister.html',
                });
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
        });


        //转院
        table.on('tool(currentTableFilter)', function (obj) {
            let data = obj.data;
            let iframe
            if (obj.event === 'edit') {
                let index = layer.open({
                    title: '转科',
                    type: 2,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['680px', '330px'],
                    content: '../page/table/moveDepartment.html',
                    success:function (layero,index) {
                        iframe = window['layui-layer-iframe'+index];
                        iframe.renderOldDepartment(data)
                    },
                });
                return false;
            }
        });
    });
}



