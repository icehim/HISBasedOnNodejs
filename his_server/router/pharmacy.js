//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');

let checkPharmacyNameStatus

//1.获取药房的所有信息
router.get('/getAllPharmacyInfo', (req, res) => {

    //定义sql
    let sql = `select DISTINCT p.pharmacyId,p.pharmacyName,un.unitName,p.sellingPrice, ar.areaName,ty.typeName,p.produceDate,p.validDate,p.skullBatch,p.drugstoreNum from pharmacy p,unit un,area ar,type ty where p.unit=un.unitId and p.area=ar.areaId and p.type=ty.typeId ORDER BY p.pharmacyId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取所有药房信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.检查药瓶药品名称
router.get('/checkPharmacyName', (req, res) => {
    //定义sql
    let pharmacyName = req.query.pharmacyName;

    pharmacyName = pharmacyName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(pharmacyName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    let check = `SELECT COUNT(*) as count from pharmacy where pharmacyName ='${pharmacyName}'`;
    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) {
            checkPharmacyNameStatus = 1
            return res.send({status: 1, message: '药品已存在,请重新输入!'});
        }
        checkPharmacyNameStatus = 0;
        return res.send({status: 0, message: '名称校验正确,可以添加!'})
    })
})

//添加药品
router.post('/addPharmacy', (req, res) => {
    if (checkPharmacyNameStatus!==0) return res.send({status: 1, message: '添加失败,请检查药品名称!'})
    //定义sql
    let {pharmacyName,unitId,areaId,sellingPrice,produceDate,typeId,validDate,drugstoreNum,skullBatch} = req.body

    if (sellingPrice < 0) return res.send({status: 1, message: '价格不能为负数,请重新输入!'});

    let sql = `INSERT INTO pharmacy(pharmacyId, pharmacyName,unit, sellingPrice, area, type, produceDate, validDate, drugstoreNum, skullBatch) VALUES (null,'${pharmacyName}', ${unitId},  ${sellingPrice}, ${areaId}, ${typeId}, '${produceDate}', '${validDate}',${drugstoreNum}, '${skullBatch}')`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '添加成功!'})
    })
})

//更新药品信息
router.post('/updatePharmacy', (req, res) => {
    //定义sql
    let {sellingPrice,drugstoreNum,pharmacyId} = req.body

    if (sellingPrice < 0) return res.send({status: 1, message: '价格不能为负数,请重新输入!'});

    let sql = `UPDATE pharmacy SET sellingPrice = ${sellingPrice}, drugstoreNum = ${drugstoreNum} WHERE pharmacyId = ${pharmacyId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '修改成功!'})
    })
})

//删除药品
router.post('/deletePharmacy', (req, res) => {
    //定义sql
    let sql = `DELETE FROM pharmacy WHERE pharmacyId = ${req.body.pharmacyId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//1.查询药房的信息
router.get('/selectPharmacyInfo', (req, res) => {
    //定义sql
    let sql = `select DISTINCT p.pharmacyId,p.pharmacyName,un.unitName,p.sellingPrice, ar.areaName,ty.typeName,p.produceDate,p.validDate,p.skullBatch,p.drugstoreNum from pharmacy p,unit un,area ar,type ty where p.unit=un.unitId and p.area=ar.areaId and p.type=ty.typeId and p.pharmacyName like concat('%' ,concat('${req.query.pharmacyName}','%')) ORDER BY p.pharmacyId`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.查询病人未取药品的信息
router.get('/getRegisterNotTakeDrugInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=0 and registerId=${req.query.registerId} order by htime`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取患者未取药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.查询病人已取药品的信息
router.get('/getRegisterTakeDrugInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=2 and registerId=${req.query.registerId} order by htime`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取患者已取药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//3.病人取药
router.post('/registerTakeDrug', (req, res) => {
    //定义sql
    let sql = `update hospitalprice set state=2,htime=NOW() where state=0 and registerId=${req.body.registerId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '取药成功!'})
    })
})

//4.结算判断药品是否全部取出
router.get('/getRegisterTakeDrugCountInfo', (req, res) => {
    //定义sql
    let sql = `select count(*) as count from hospitalprice where registerId=${req.query.registerId} and state=0`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '当前还有尚未取出的药品，请先去取药!'})
        return res.send({status: 0, message: '已经全部取出'})
    })
})


module.exports = router;