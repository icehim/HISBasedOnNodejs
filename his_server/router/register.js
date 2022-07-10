//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');

//1.获取用户信息
router.get('/getALLRegisterInfo', (req, res) => {

    //定义sql
    let sql = `select r.registerId,r.userName,r.age,r.sex,d.department department,r.money,r.departmentId departmentId,r.doctorId doctorId,r.bedId bedId,c.doctorName doctorName,r.address,r.phone,r.idcard,r.registerDate,b.bedName bedName,r.operator,r.medicarePercent from register r,departments d,doctor c,bed b WHERE r.state=0 and r.departmentId=d.departmentId and r.doctorId=c.doctorId and r.bedId=b.bedId order by r.registerDate desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

router.get('/selectRegisterInfo', (req, res) => {
    //定义sql
    let sql = `select r.registerId,r.userName,r.age,r.sex,d.department department,r.money,r.departmentId departmentId,r.doctorId doctorId,r.bedId bedId,c.doctorName doctorName,r.address,r.phone,r.idcard,r.registerDate,b.bedName bedName,r.operator,r.medicarePercent from register r,departments d,doctor c,bed b WHERE r.state=0 and r.departmentId=d.departmentId and r.doctorId=c.doctorId and r.bedId=b.bedId and r.userName like "%${req.query.userName}%" order by r.registerDate desc`
    // console.log(sql)
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
    // res.send('获取用户信息成功')
    // console.log(req.user) //{ id: 60, iat: 1645358448, exp: 1645444848 }
    // console.log(req.body) //{ username: 'admin', password: '123123' }
    // console.log(req.headers) //{authorization,content-type}
})

router.post('/addRegister', (req, res) => {
    //准备各个字段值
    let {
        userName,
        diagnose,
        sex,
        departmentId,
        age,
        doctorId,
        address,
        bedId,
        phone,
        money,
        idcard,
        medicarePercent,
        operator
    } = req.body;
    //生成sql语句
    let sql = `insert into register(userName,age,sex,departmentId,doctorId,diagnose,address,phone,idcard,registerDate,bedId,operator,money,state,medicarePercent) values ('${userName}',${age},'${sex}',${departmentId},${doctorId},'${diagnose}','${address}','${phone}','${idcard}',NOW(),${bedId},'${operator}',${money},0,'${medicarePercent}');update bed set state=1 where bedId=${bedId}`

    // 执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        //判断结果
        if (results[0].affectedRows !== 1) return res.send({status: 1, message: '添加失败!'})
        //成功提示
        return res.send({status: 0, message: '添加成功!'})
    })
})

router.post('/updateRegister', (req, res) => {
    //准备各个字段值
    let {
        registerId,
        newDepartmentId,
        newDoctorId,
        newBedId,
    } = req.body;
    //生成sql语句
    let sql = `update bed set state=1 where bedId=${newBedId};update bed set state=0 where bedId=(select bedId from register where registerId=${registerId});update register set price=(select (1-(cast(replace(b.medicarePercent,'%','') as decimal(18,2))/100))*a.price*(TO_DAYS(NOW())-TO_DAYS(ifnull(b.zhuan,b.registerDate)))+IFNULL(b.price,0) price from (select price from bed where bedId=(select bedId from register where registerid=${registerId}))a,(select * from register where registerid=${registerId}) b),zhuan=NOW(),departmentId=${newDepartmentId},doctorId=${newDoctorId},bedId=${newBedId} where registerid=${registerId}`

    // 执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        //判断结果
        if (results[2].affectedRows !== 1) return res.send({status: 1, message: '更新失败!'})
        //成功提示
        return res.send({status: 0, message: '更新成功!'})
    })
})

router.get('/selectRegisterMoney', (req, res) => {
    if (!/^[0-9]*$/.test(req.query.registerId) || req.query.registerId ==='') {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入数字!'});
    }
    //定义sql
    let sql = `select (((TO_DAYS(NOW())-TO_DAYS(ifnull(r.zhuan,r.registerDate)))*p.price)+ifnull(sum(h.inHospitalPriceTotal),0))*(1-(cast(replace(r.medicarePercent,'%','') as decimal(18,2))/100))+IFNULL(r.price,0) inHospitalPriceTotal from (select price from bed where bedId=(select bedId from register where registerId=${req.query.registerId})) p,register r left join hospitalprice h on h.registerId=r.registerId where r.registerId=${req.query.registerId};select r.registerId,r.userName,r.age,r.sex,d.department department,r.money,r.departmentId departmentId,r.doctorId doctorId,r.bedId bedId,c.doctorName doctorName,r.address,r.phone,r.idcard,r.registerDate,b.bedName bedName,r.operator,r.medicarePercent from register r,departments d,doctor c,bed b WHERE r.state=0 and r.departmentId=d.departmentId and r.doctorId=c.doctorId and r.bedId=b.bedId and r.registerId=${req.query.registerId} order by r.registerDate desc`

    db(sql, (err, results) => {
        if (results[1].length===0) return res.send({status: 1, message: '住院号未找到!'})
        //把消费信息和住院信息合并
        results[1][0].inHospitalPriceTotal=results[0][0].inHospitalPriceTotal
        res.send({
            status: 0, message: '获取病人信息成功', data: results[1]//对象放在数组中，所以要[0]
        })
    })
})

//获取患者缴费信息
router.get('/getRegisterPayList', (req, res) => {
    //定义sql
    let sql = `select p.payId,p.registerId,r.userName,p.money,p.payDate from pay p,register r where p.registerId=${req.query.registerId} and r.registerId=p.registerId order by p.payDate desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//缴费信息
router.post('/addMoney', (req, res) => {
    //准备各个字段值
    let {
        registerId,
        money
    } = req.body;
    //生成sql语句
    let sql = `update register set money=money+${money} where registerid=${registerId};insert into pay(registerId,money,payDate) values(${registerId},${money},NOW())`

    // 执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        //成功提示
        return res.send({status: 0, message: '更新成功!'})
    })
})

//所有出院患者信息
router.get('/AllOutHospitalInfo', (req, res) => {
    //生成sql语句
    let sql = `select r.registerId,TO_DAYS(r.endDate)-TO_DAYS(registerDate) day,r.diagnose,r.medicarePercent,r.userName,r.age,r.sex,d.department department,r.money,c.doctorName doctorName,r.address,r.phone,r.idcard,r.registerDate,b.bedname bedName,r.operator,r.endDate,r.price,(r.money-r.price) prices from register r,departments d,doctor c,bed b WHERE r.state=1 and r.departmentId=d.departmentId and r.doctorId=c.doctorId and r.bedId=b.bedId order by r.endDate desc`
    // 执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        //成功提示
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取所有出院患者信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//患者出院
router.post('/outHospital', (req, res) => {
    //生成sql语句
    let sql = `update register set state=1,endDate=NOW(),price=${req.body.price} where registerId=${req.body.registerId};update bed set state=0 where bedId=(select bedId from register where registerId=${req.body.registerId})`
    // 执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        //成功提示
        return res.send({status: 0, message: '出院成功!'})
    })
})


//获取某患者出院信息
router.get('/getRegisterOutInfo', (req, res) => {
    //定义sql
    let sql = `select r.registerId,TO_DAYS(r.endDate)-TO_DAYS(registerDate) day,r.diagnose,r.medicarePercent,r.userName,r.age,r.sex,d.department department,r.money,c.doctorName doctorName,r.address,r.phone,r.idcard,r.registerDate,b.bedname bedName,r.operator,r.endDate,r.price,(r.money-r.price) prices from register r,departments d,doctor c,bed b WHERE r.state=1 and r.departmentId=d.departmentId and r.doctorId=c.doctorId and r.bedId=b.bedId and r.userName like concat('%',concat('${req.query.userName}','%')) order by r.endDate desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人出院信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

router.get('/getRegisterOutInfo', (req, res) => {
    //定义sql
    let sql = `select r.registerId,TO_DAYS(r.endDate)-TO_DAYS(registerDate) day,r.diagnose,r.medicarePercent,r.userName,r.age,r.sex,d.department department,r.money,c.doctorName doctorName,r.address,r.phone,r.idcard,r.registerDate,b.bedname bedName,r.operator,r.endDate,r.price,(r.money-r.price) prices from register r,departments d,doctor c,bed b WHERE r.state=1 and r.departmentId=d.departmentId and r.doctorId=c.doctorId and r.bedId=b.bedId and r.userName like concat('%',concat('${req.query.userName}','%')) order by r.endDate desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人出院信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

router.get('/getOutRegisterDrugInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=2 and registerId=${req.query.registerId} order by htime desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人出院药品信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})
router.get('/getOutRegisterTechInfo', (req, res) => {
    //定义sql
    let sql = `select hospitalPriceListId,registerId registerId,drugName,drugNum,inHospitalPrice,inHospitalPriceTotal,htime,state from hospitalprice where state=1 and registerId=${req.query.registerId} order by htime desc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取病人出院项目信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//导出
module.exports = router;

