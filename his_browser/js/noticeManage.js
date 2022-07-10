let valueInPage = {
    noticeTitle: ""
}

getNotice()

//搜索功能
$("#searchNoticeBtn").on('click', function () {
    valueInPage.noticeTitle = $("#searchNoticeInp").val()
    axios({
        method: 'GET',
        url: '/noticeManage/selectNoticeInfo',
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

function getNotice() {
    axios({
        url: '/noticeManage/getAllNoticeInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        renderTable(res.data.data);
    });
}

function renderTable(doctor) {
    layui.use(['jquery', 'form', 'table'], function () {

        let $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            data: doctor,
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print'],
            page: {
                limit: 10,
                limits: [10, 20, 30, 40, 50],
            },
            cols: [[
                {field: 'id', title: 'ID', width:60,align: "center"},
                {field: 'noticeTitle', title: '公告标题', align: "center"},
                {field: 'noticeContent', title: '公告内容', align: "center"},
                {field: 'enableTop', title: '是否置顶', align: "center",width:100,templet:function (d) {
                        if (d.enableTop){
                            return '是'
                        }else return '否'
                    }},
                {field: 'date', title: '发布日期', align: "center",width:150,templet: "<div>{{layui.util.toDateString(d.date, 'yyyy年MM月dd日')}}</div>"},
                {field: 'publisher', title: '发布人', width:100,align: "center"},
                {title: '操作', toolbar: '#currentTableBar', align: "center",width:200}
            ]],
        });
        /**
         * toolbar监听事件
         */
        let openIndex
        let url
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                url = '/noticeManage/addNotice'
                openIndex = layer.open({
                    title: '添加公告',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['600px', '350px'],
                    content: $("#addOrUpdateNotice"),
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
            if (obj.event === 'look') {  // 监听添加操作
                openIndex = layer.open({
                    type: 1
                    ,title: obj.data.noticeTitle
                    ,area: '300px;'
                    ,shade: 0.2
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: `<div style="height:300px;overflow:auto;padding: 20px;text-indent:2em; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;"><p>${obj.data.noticeContent}</p></div>`
                });
            }

            if (obj.event === 'edit') {  // 监听添加操作
                url = '/noticeManage/updateNotice'
                openIndex = layer.open({
                    title: '编辑公告',
                    type: 1,
                    shade: 0.2,
                    maxmin: true,
                    shadeClose: true,
                    area: ['800px', '350px'],
                    content: $("#addOrUpdateNotice"),
                    success: function () {
                        form.val("dataFrm", obj.data);
                    },
                    end: function () {
                        $('#dataFrm')[0].reset();
                    }
                });
            }

            if (obj.event === 'delete') {  // 监听添加操作
                layer.confirm('确定删除此公告吗？', function (index) {
                    axios({
                        method: 'POST',
                        url: '/noticeManage/deleteNotice',
                        data: obj.data
                    }).then(res => {
                        if (res.data.status !== 0) {
                            return layer.msg(res.data.message)
                        }
                        //成功：提示初始化文章分类
                        layer.msg(res.data.message)
                        getNotice()
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
                getNotice()
                layer.close(openIndex)
            })
            return false;
        });
    });
}