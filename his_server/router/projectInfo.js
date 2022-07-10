//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');

 /*操作用户的住院项目项目*/
//1.获取所有药品信息
router.get('/getAllProjectInfo', (req, res) => {

    //定义sql
    let sql = `select i.inoutpatientId,i.projectName,i.unit unitId,i.bigProjectId projectId,i.price,u.unitName,p.projectName projectNames from inoutpatienttype i,unit u,projecttype p WHERE i.unit=u.unitId and i.bigProjectId=p.projectId order by inoutpatientId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取住院项目信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.获取患者的所有消费项目信息
router.get('/getRegisterProjectInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=1 and registerId=${req.query.registerId} order by htime desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取或者消费项目信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//3.获取某个项目信息
router.get('/selectProjectInfo', (req, res) => {
    //定义sql
    let sql = `select i.inoutpatientId,i.projectName,i.unit unitId,i.bigProjectId projectId,i.price,u.unitName,p.projectName projectNames from inoutpatienttype i,unit u,projecttype p WHERE i.unit=u.unitId and i.bigProjectId=p.projectId and i.projectName like concat('%',concat('${req.query.projectName}','%'))`
    //执行sql

    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取项目信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})
//4.获取患者的某个消费项目
router.get('/selectRegisterProjectInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=1 and registerId=${req.query.registerId} AND drugName LIKE '%${req.query.drugName}%' order by htime desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取患者项目信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//提交项目信息
router.post('/addProjectToRegister', (req, res) => {
    let {registerId, projectName, price} = req.body;

    let sql = `insert into hospitalprice(registerid,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state) values(${registerId},'${projectName}',1,${price},${price},NOW(),1); `
    db(sql, (err, results) => {
        if (err) throw err;
        //成功提示
        return res.send({status: 0, message: '添加成功!'})

    })
})



//1.获取项目大类信息
router.get('/getProjectTag', (req, res) => {

    //定义sql
    let sql = `select *from projecttype order by projectId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取项目大类信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.查询某个项目大类信息
router.get('/selectProjectTag', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM projecttype where projectName LIKE '%${req.query.projectName}%'`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取项目大类信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//新增项目大类
router.post('/addProjectTag', (req, res) => {

    let projectName = req.body.projectName;

    projectName = projectName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(projectName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from projecttype where projectName ='${projectName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '该类别已存在,请重新输入!'})

        let sql = `INSERT INTO projecttype (projectId,projectName) VALUES (null, '${projectName}')`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//删除项目大类
router.post('/deleteProjectTag', (req, res) => {
    //定义sql
    let sql = `DELETE FROM projecttype WHERE projectId = ${req.body.projectId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//新增住院收费项目
router.post('/addProject', (req, res) => {

    let {projectName,price,unitId,projectId} = req.body;

    projectName = projectName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(projectName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    if (price < 0) return res.send({status: 1, message: '价格不能为负数,请重新输入!'});

    let check = `SELECT COUNT(*) as count from inoutpatienttype where projectName ='${projectName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此项目已存在,请重新输入!'})

        let sql = `INSERT INTO inoutpatienttype (projectName,price,unit,bigProjectId) VALUES ('${projectName}',${price},${unitId},${projectId})`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//修改收费项目
router.post('/updateProject', (req, res) => {
    let {inoutpatientId,projectName,price,unitId,projectId} = req.body;

    projectName = projectName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(projectName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    if (price < 0) return res.send({status: 1, message: '价格不能为负数,请重新输入!'});
    let check = `SELECT COUNT(*) as count from inoutpatienttype where projectName ='${projectName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此项目已存在,请重新输入!'})

        let sql = `UPDATE inoutpatienttype SET projectName = '${projectName}', unit = ${unitId}, bigProjectId = ${projectId}, price = ${price} WHERE inoutpatientId = ${inoutpatientId}`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '修改成功!'})
        })
    })
})

//删除收费项目
router.post('/deleteProject', (req, res) => {
    //定义sql
    let sql = `DELETE FROM inoutpatienttype WHERE inoutpatientId = ${req.body.inoutpatientId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})


//1.获取床位信息
router.get('/getAllBed', (req, res) => {

    //定义sql
    let sql = `select * from bed b,departments d where b.departmentId=d.departmentId order by b.bedId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取床位信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.搜索床位信息
router.get('/selectBed', (req, res) => {
    //定义sql
    let sql = `select * from bed b,departments d where b.departmentId=d.departmentId and bedName like '%${req.query.bedName}%' order by b.bedId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length,status: 0, message: '搜索床位信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})
//新增床位
router.post('/addBed', (req, res) => {
    let {bedName,Price,departmentId} = req.body;

    bedName = bedName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(bedName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    if (Price < 0) return res.send({status: 1, message: '价格不能为负数,请重新输入!'});

    let check = `SELECT COUNT(*) as count from bed where bedName ='${bedName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此床位已存在,请重新输入!'})

        let sql = `INSERT INTO bed (bedName,Price,state,departmentId) VALUES ('${bedName}',${Price},0,${departmentId})`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//修改床位信息
router.post('/updateBed', (req, res) => {
    let {bedId,bedName,Price,departmentId} = req.body;

    bedName = bedName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(bedName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    if (Price < 0) return res.send({status: 1, message: '价格不能为负数,请重新输入!'});
    let check = `SELECT COUNT(*) as count from bed where bedName ='${bedName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此床位已存在,请重新输入!'})

        let sql = `UPDATE bed SET bedName = '${bedName}', departmentId= ${departmentId}, Price = ${Price} WHERE bedId = ${bedId}`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '修改成功!'})
        })
    })
})

//删除收费项目
router.post('/deleteBed', (req, res) => {
    if (req.body.state === 1) return res.send({status: 1, message: '此床位正在被使用,无法删除!'});
    //定义sql
    let sql = `DELETE FROM bed WHERE bedId = ${req.body.bedId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//1.获取报销类型信息
router.get('/getAllMedicare', (req, res) => {

    //定义sql
    let sql = `select * from medicare order by medicareId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取报销类型信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.搜索报销类型信息
router.get('/selectMedicare', (req, res) => {
    //定义sql
    let sql = `select * from medicare where medicareType like '%${req.query.medicareType}%' order by medicareId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length,status: 0, message: '搜索报销类型信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//新增报销类型
router.post('/addMedicare', (req, res) => {
    let {medicareType,medicarePercent} = req.body;

    medicareType = medicareType.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(medicareType)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    if (medicarePercent < 0 || medicarePercent > 1) {
        return res.send({status: 1, message: '报销比例输入有误,请重新输入!'});
    }

    medicarePercent = Number(medicarePercent*100).toFixed(0)+'%';

    let check = `SELECT COUNT(*) as count from medicare where medicareType ='${medicareType}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此类型已存在,请重新输入!'})

        let sql = `INSERT INTO medicare (medicareType,medicarePercent) VALUES ('${medicareType}','${medicarePercent}')`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//删除报销类型
router.post('/deleteMedicare', (req, res) => {
    //定义sql
    let sql = `DELETE FROM medicare WHERE medicareId = ${req.body.medicareId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})
//导出
module.exports = router;

