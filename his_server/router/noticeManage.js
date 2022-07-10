// 导入
const express = require('express');
// 创建路由对象
const router = express.Router();
// 导入数据库模块，根据用户名查询，判断是否查到具体的数据;
const db = require('../database/index');

//1.获取公告所有信息
router.get('/getAllNoticeInfo', (req, res) => {

    //定义sql
    let sql = `select id,noticeTitle,noticeContent,enableTop,date,realName publisher from notice n,sys_user u WHERE n.publisherId=u.userId order by enableTop DESC,date desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取所有公告信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.搜索公告所有信息
router.get('/selectNoticeInfo', (req, res) => {

    //定义sql
    let sql = `select id,noticeTitle,noticeContent,enableTop,date,realName publisher from notice n,sys_user u WHERE n.publisherId=u.userId and noticeTitle LIKE '%${req.query.noticeTitle}%' order by enableTop DESC,date desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '查询公告信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//3.添加公告信息
router.post('/addNotice', (req, res) => {
    //定义sql
    let {noticeTitle,noticeContent,enableTop,} = req.body
    let userId = req.user.id

    noticeTitle = noticeTitle.replace(/\s*/g, "");
    noticeContent = noticeContent.replace(/\s*/g, "");

    let sql =`insert into notice (noticeTitle,noticeContent,enableTop,date,publisherId) values ('${noticeTitle}','${noticeContent}',${enableTop},now(),${userId})`
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '添加成功!'})
    })
})

//4.编辑公告信息
router.post('/updateNotice', (req, res) => {
    //定义sql
    let {id,noticeTitle,noticeContent,enableTop,} = req.body

    noticeTitle = noticeTitle.replace(/\s*/g, "");
    noticeContent = noticeContent.replace(/\s*/g, "");
    let userId = req.user.id

    let sql =`update notice set noticeTitle='${noticeTitle}',noticeContent='${noticeContent}',enableTop=${enableTop},date=now(),publisherId=${userId} where id=${id}`
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '更新成功!'})
    })
})

//5.删除公告信息
router.post('/deleteNotice', (req, res) => {
    //定义sql
    let sql = `DELETE FROM notice WHERE id = ${req.body.id}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})
// 导出
module.exports = router;