let valueInPage = {
    unitName: ""
}

getUnitInfo()

//搜索功能
$("#searchUnitBtn").on('click', function () {
    valueInPage.unitName = $("#searchUnitInp").val()
    axios({
        method: 'GET',
        url: '/cate/selectUnit',
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

function getUnitInfo() {
    axios({
        url: '/cate/unitInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        renderTable(res.data.data);
    });
}

function renderTable(area) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: area,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'unitId', title: 'ID', sort: true, align: "center"},
                {field: 'unitName', title: '供货单位名称', align: "center"},
                {title: '操作', toolbar: '#currentTableBar', align: "center"}
            ]],
        });
        /**
         * toolbar监听事件
         */
        // let openIndex
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                openIndex = layer.open({
                    title: '添加新计量单位',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['350px', '200px'],
                    content: $("#addArea"),
                    end: function () {
                        $('#dataFrm')[0].reset();
                    }
                });
            }
        });
        //
        //监听提交
        form.on('submit(doSubmit)', function (obj) {
            axios({
                method: 'POST',
                url: '/cate/addUnit',
                data: obj.field
            }).then(res => {
                if (res.data.status !== 0) {
                    return layer.msg(res.data.message)
                }
                //成功：提示初始化文章分类
                layer.msg(res.data.message)
                getUnitInfo()
                layer.close(openIndex)
            })
            return false;
        });

        table.on('tool(currentTableFilter)', function (obj) {
            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('真的删除【' + obj.data.unitName + '】这个单位吗', function (index) {
                    axios({
                        method: 'POST',
                        url: '/cate/deleteUnit',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getUnitInfo()
                    })
                });
            }
        });
    });
}