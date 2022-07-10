//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');


//1.获取所有药品信息
router.get('/getALLDrugInfo', (req, res) => {

    //定义sql
    let sql = `select p.pharmacyId,p.pharmacyName,p.unit unitId,p.sellingPrice, p.area areaId,p.type typeId,p.produceDate,p.validDate,p.drugstoreNum,p.skullbatch,u.unitName,a.areaName,t.typeName from pharmacy p,unit u,area a,type t WHERE p.unit=u.unitId and p.area=a.areaId and p.type=t.typeId`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.获取患者的所有药品信息
router.get('/getRegisterDrugInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=0 and registerId=${req.query.registerId} order by htime desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//3.获取某个药品信息
router.get('/selectDrugInfo', (req, res) => {
    //定义sql
    let sql = `select p.pharmacyId,p.pharmacyName,p.unit unitId,p.sellingPrice, p.area areaId,p.type typeId,p.produceDate,p.validDate,p.drugstoreNum,p.skullbatch,u.unitName,a.areaName,t.typeName from pharmacy p,unit u,area a,type t WHERE p.unit=u.unitId and p.area=a.areaId and p.type=t.typeId and p.pharmacyName like concat('%',concat('${req.query.pharmacyName}','%'))`
    //执行sql

    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

router.get('/selectRegisterDrugInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=0 and registerId=${req.query.registerId} AND drugName LIKE '%${req.query.drugName}%' order by htime desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取患者药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//提交药品信息
router.post('/addDrugToRegister', (req, res) => {
    let {registerId, pharmacyName, pharmacyId, drugNum, drugstoreNum,sellingPrice} = req.body;

    if (!/^[0-9]*$/.test(drugNum) || registerId ==='') {
        return res.send({status: 1, message: '输入错误,请重新输入!'});
    }else if (drugNum > drugstoreNum){
        return res.send({status: 1, message: '对不起,药品数量不足'});
    }
    let check = `SELECT drugName FROM hospitalprice WHERE registerId='${registerId}' AND drugName='${pharmacyName}'`
    db(check, (err, results) => {
        if (results.length){
            let sql = `update hospitalprice set drugNum=drugNum+${drugNum},inHospitalPriceTotal=drugNum*inHospitalPrice,htime=NOW() where registerId=${registerId} and state=0 and drugName='${pharmacyName}';update pharmacy set drugstoreNum=drugstoreNum-${drugNum} where pharmacyId=${pharmacyId}`
            db(sql, (err, results) => {
                //判断sql
                if (err) throw err;
                //成功提示
                return res.send({status: 0, message: '添加成功!'})
            })
        }else {
            let sql = `insert into hospitalprice(registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state) values(${registerId},'${pharmacyName}',${drugNum},${sellingPrice},${sellingPrice * drugNum},NOW(),0);update pharmacy set drugstoreNum=drugstoreNum-${drugNum} where pharmacyId=${pharmacyId}`
            // 执行sql
            db(sql, (err, results) => {
                //判断sql
                if (err) throw err;
                //成功提示
                return res.send({status: 0, message: '添加成功!'})
            })
        }
    })
})

router.post('/deleteDrugToRegister', (req, res) => {
    //准备各个字段值
    let {hospitalPriceListId,drugName,drugNum} = req.body;
    // 生成sql语句
    let sql = `delete from hospitalprice where hospitalpriceListId=${hospitalPriceListId};update pharmacy set drugstoreNum=drugstoreNum+${drugNum} where pharmacyName='${drugName}'`
    // 执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        //成功提示
        return res.send({status: 0, message: '删除成功!'})
    })
})

//导出
module.exports = router;

