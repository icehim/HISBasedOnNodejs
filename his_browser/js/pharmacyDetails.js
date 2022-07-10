let valueInPage = {
    pharmacyName: ""
}

//初始化所有住院病人信息
getAllPharmacyInfo()

//发送ajax请求
function getAllPharmacyInfo() {
    axios({
        method: 'GET',
        url: '/pharmacy/getAllPharmacyInfo',
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
$("#searchPharmacyBtn").on('click', function () {
    valueInPage.pharmacyName = $("#searchPharmacyInp").val()
    axios({
        method: 'GET',
        url: '/pharmacy/selectPharmacyInfo',
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

/*所有药品信息表格渲染*/
function renderTable(pharmacyInfo) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: pharmacyInfo,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'pharmacyId', title: '序号', sort: true, align: "center"},
                {field: 'pharmacyName', title: '药品名称', width: 150, align: "center"},
                {field: 'unitName', title: '单位', align: "center"},
                {field: 'sellingPrice', title: '售价', align: "center"},
                {field: 'areaName', title: '供货单位', width: 150, align: "center"},
                {
                    field: 'produceDate',
                    title: '生产日期',
                    templet: "<div>{{layui.util.toDateString(d.produceDate, 'yyyy年MM月dd日')}}</div>",
                    width: 140
                    , align: "center"
                },
                {
                    field: 'validDate',
                    title: '有效日期',
                    templet: "<div>{{layui.util.toDateString(d.validDate, 'yyyy年MM月dd日')}}</div>",
                    width: 140
                    , align: "center"
                },
                {field: 'typeName', title: '类型', align: "center"},
                {field: 'skullBatch', title: '批号', width: 95, align: "center"},
                {field: 'drugstoreNum', title: '数量', align: "center"},
                {title: '操作', toolbar: '#currentTableBar', width: 135, align: "center"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                openIndex = layer.open({
                    title: '添加新药品',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['710px', '420px'],
                    content: $("#addDrug"),
                    success: function () {
                        getTypeInfo()
                        getUnitInfo()
                        getAreaInfo()
                        renderSkullBatch()
                    },
                    end: function () {
                        $('#dataFrm')[0].reset();
                        $('#checkFalse').hide();
                        $('#checkTrue').hide();
                    }
                });
            }
        });

        //监听提交
        form.on('submit(saveBtn)', function (data) {

            let date = new Date().toLocaleDateString();
            layui.use(['jquery'], function () {
                date = layui.util.toDateString(date, 'yyyy-MM-dd')
            })
            let produceDate = $('#produceDate').val()
            let validDate = $('#validDate').val()
            if (produceDate > date || produceDate === date) {
                return layer.msg('生产日期不能大于或等于今天');
            } else if (validDate < date || validDate === date) {
                return layer.msg('有效日期不能小于或等于今天');
            }

            axios({
                method: 'POST',
                url: '/pharmacy/addPharmacy',
                data: data.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg('添加成功')
                getAllPharmacyInfo()
                layer.close(openIndex)
            })
            return false;
        });

        table.on('tool(currentTableFilter)', function (obj) {
            obj.data.produceDate = layui.util.toDateString(obj.data.produceDate, 'yyyy-MM-dd')
            obj.data.validDate = layui.util.toDateString(obj.data.validDate, 'yyyy-MM-dd')
            if (obj.event === 'edit') {  // 监听添加操作
                openIndex = layer.open({
                    title: '编辑药品',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['710px', '420px'],
                    content: $("#editDrug"),
                    success: function () {
                        form.val("dataFrm1",obj.data);
                    },
                    end: function () {
                        $('#dataFrm')[0].reset();
                        $('#checkFalse').hide();
                        $('#checkTrue').hide();
                    }
                });
            }
            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【'+obj.data.pharmacyName+'】这个药品吗', function(index){
                    axios({
                        method: 'POST',
                        url: '/pharmacy/deletePharmacy',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getAllPharmacyInfo()
                    })
                });
            }
        });

        //监听提交
        form.on('submit(saveBtn1)', function (obj) {
            if (obj.field.sellingPrice < 0 || obj.field.drugstoreNum <0){
                return layer.msg('输入不能为负数!')
            }
            axios({
                method: 'POST',
                url: '/pharmacy/updatePharmacy',
                data: obj.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getAllPharmacyInfo()
                layer.close(openIndex)
            })
            return false;
        });
    });
}

/*药品名称校验*/
$('#pharmacyName').on('blur', function () {
    valueInPage.pharmacyName = $('#pharmacyName').val();
    axios({
        method: 'GET',
        url: '/pharmacy/checkPharmacyName',
        params: valueInPage
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            $('#checkTrue').hide();
            $('#falseTips').text(res.data.message)
            $('#checkFalse').show();
            return false;
        }
        $('#checkFalse').hide();
        $('#trueTips').text(res.data.message)
        $('#checkTrue').show();
    });
})

function getTypeInfo() {
    axios({
        url: '/cate/typeInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $("#typeId").empty()
        $("#typeId").append(new Option('请选择药品类型', ''))
        $.each(res.data.data, function (index, item) {
            $("#typeId").append(new Option(item.typeName, item.typeId))
        })
        layui.form.render("select");
    });
}

function editTypeInfo() {
    axios({
        url: '/cate/typeInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $("#typeId").empty()
        $("#typeId").append(new Option('请选择药品类型', ''))
        $.each(res.data.data, function (index, item) {
            $("#typeId").append(new Option(item.typeName, item.typeId))
        })
        layui.form.render("select");
    });
}

function getUnitInfo() {
    axios({
        url: '/cate/unitInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $("#unitId").empty()
        $("#unitId").append(new Option('请选择药品单位', ''))
        $.each(res.data.data, function (index, item) {
            $("#unitId").append(new Option(item.unitName, item.unitId))
        })
        layui.form.render("select");
    });
}

function getAreaInfo() {
    axios({
        url: '/cate/areaInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        $("#areaId").empty()
        $("#areaId").append(new Option('请选择药品供货单位', ''))
        $.each(res.data.data, function (index, item) {
            $("#areaId").append(new Option(item.areaName, item.areaId))
        })
        layui.form.render("select");
    });
}

function renderSkullBatch() {
    let date = new Date().toLocaleDateString();
    layui.use(['jquery'], function () {
        date = layui.util.toDateString(date, 'yyyyMMdd')
        $("#skullBatch").val(date);//批号
    })
}


