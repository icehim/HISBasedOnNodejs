/*系统公告start*/
getNotice()

function getNotice() {
    axios({
        url: '/noticeManage/getAllNoticeInfo',
    }).then(res => {
        if (res.data.status !== 0) {
            return layer.msg(res.data.message)
        }
        renderNotice(res.data.data);
    });
}

function renderNotice(data) {
    for (let i in data) {
        if (data[i].enableTop) {
            $('#noticeCard').append(`<div class="layuimini-notice">
                            <div class="layuimini-notice-title" style="margin-right: 50px"><span style="color: red;">[ 置顶 ]</span> ${data[i].noticeTitle}</div>
                            <div class="layuimini-notice-extra">${layui.util.toDateString(data[i].date, 'yyyy年MM月dd日')}</div>
                            <div class="layuimini-notice-content layui-hide">${data[i].noticeContent}<br>
                            </div>
                        </div>`)
        } else {
            $('#noticeCard').append(`<div class="layuimini-notice">
                            <div class="layuimini-notice-title" style="margin-right: 50px">${data[i].noticeTitle}</div>
                            <div class="layuimini-notice-extra">${layui.util.toDateString(data[i].date, 'yyyy年MM月dd日')}</div>
                            <div class="layuimini-notice-content layui-hide">${data[i].noticeContent}<br>
                            </div>
                        </div>`)
        }
    }
}

/*系统公告end*/


/*快捷入口start*/
getUserMenu()

function getUserMenu() {
    axios({
        //请求方式是get可以省略
        // method:'GET',
        url: '/cate/userMenu', //通过请求头设置token身份认证
        // }
    }).then(res => {
        renderQuickMenu(res.data.data)
    });
}

function renderQuickMenu(data) {
    let count = 2
    for (let i in data) {
        if (data[i].id > 6) {
            count++
            $('#userQuickMenu').append(`<div class="layui-col-xs3 layuimini-qiuck-module">
                                            <a href="javascript:;" layuimini-content-href="${data[i].href}"
                                               data-title="${data[i].title}">
                                                <i class="${data[i].icon}"></i>
                                                <cite>${data[i].title}</cite>
                                            </a>
                                        </div>`)
        }
        if (count === 8) break
    }
}

/*快捷入口end*/

/*药品预警start*/
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

function renderPharmacyDrug(data) {
    let warnCount = 0
    for (let i in data) {
        if (data[i].drugstoreNum < 100) warnCount++
    }
    $('#warnDrugCount').text(`${warnCount} 种`)
}

/*药品预警end*/

/*床位预警start*/
getWarnBedInfo()

//渲染所有药品信息
function getWarnBedInfo() {
    axios({
        method: 'GET',
        url: '/cate/warnBed',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderWarnBed(res.data.data);
    });
}

function renderWarnBed(data) {
    let warnCount = 0
    for (let i in data) {
        if (data[i].bedCount < 20) warnCount++
    }
    $('#warnBedCount').text(`${warnCount} 个`)
}

/*床位预警end*/

/*当天住院人数start*/
getTodayRegister()

//渲染所有药品信息
function getTodayRegister() {
    axios({
        method: 'GET',
        url: '/cate/todayRegister',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        $('#todayRegister').text(`${res.data.data[0].count} 个`)
    });
}

/*当天住院人数end*/


/*当天出院人数start*/
getTodayOutRegister()

//渲染所有药品信息
function getTodayOutRegister() {
    axios({
        method: 'GET',
        url: '/cate/todayOutRegister',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        $('#todayOutRegister').text(`${res.data.data[0].count} 个`)
    });
}

/*当天出院人数end*/

/*本周主院人数start*/
getWeekIn()
function getWeekIn() {
    let data
    axios({
        method: 'GET',
        url: '/cate/weekInOut',
    }).then(res => {
        //判断是否获取到数据
        if (res.data.status !== 0) {
            return layui.layer.msg(res.data.message);
        }
        renderEcharts(res.data.data[0],res.data.data[1])
    });
}
/*本周主院人数end*/

layui.use(['layer', 'miniTab', 'echarts'], function () {
    let $ = layui.jquery,
        layer = layui.layer,
        miniTab = layui.miniTab,
        echarts = layui.echarts;

    miniTab.listen();

    /**
     * 查看公告信息
     **/
    $('body').on('click', '.layuimini-notice', function () {
        let title = $(this).children('.layuimini-notice-title').html(),
            noticeTime = $(this).children('.layuimini-notice-extra').text(),
            content = $(this).children('.layuimini-notice-content').html();

        let html = '<div style="padding:10px 20px; text-align:justify; text-indent:2em;line-height: 22px;border-bottom:1px solid #e2e2e2;background-color: #2f4056;color: #ffffff">\n' +
            '<div style="text-align: center;margin-bottom: 10px;font-weight: bold;border-bottom:1px solid #718fb5;padding-bottom: 5px"><h4 class="text-danger">' + title + '</h4></div>\n' +
            '<div style="font-size: 12px">' + content + '</div></div>';
        parent.layer.open({
            type: 1,
            title: '系统公告' + '<span style="float: right;right: 1px;font-size: 12px;color: #b1b3b9;margin-top: 1px">' + noticeTime + '</span>',
            area: '300px;',
            shade: 0.3,
            moveType: 1,
            content: html,
        });
    });
    /**
     * 报表功能
     */


});

function renderEcharts(weekIn,weekOut) {
    layui.use(['echarts'], function () {
        let echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');
        let optionRecords = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['住院人数', '出院人数',]
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: weekIn.date
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name: '住院人数',
                    type: 'line',
                    data: weekIn.count
                },
                {
                    name: '出院人数',
                    type: 'line',
                    data: weekOut.count
                }
            ]
        };
        echartsRecords.setOption(optionRecords);

        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords.resize();
        }
    })
}



/*间隔2秒获取数据start*/

setInterval(function () {
    getALLDrugInfo()
    getWarnBedInfo()
    getTodayRegister()
    getTodayOutRegister()
}, 2000)

/*间隔2秒获取数据end*/