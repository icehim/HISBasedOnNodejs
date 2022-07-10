//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');

//1.获取科室信息
router.get('/getDepartments', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM departments`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取科室信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.查询某个科室信息
router.get('/selectDepartments', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM departments where department LIKE '%${req.query.department}%'`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取科室信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//新增科室
router.post('/addDepartments', (req, res) => {

    let department = req.body.department;

    department = department.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(department)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from departments where department ='${department}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '该科室已存在请重新输入!'})

        let sql = `INSERT INTO departments(departmentId,department) VALUES (null, '${department}')`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//删除科室
router.post('/deleteDepartments', (req, res) => {
    //定义sql
    let sql = `DELETE FROM departments WHERE departmentId = ${req.body.departmentId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})


//1.获取医生信息
router.get('/getDoctor', (req, res) => {
    //定义sql
    let sql = `select * from doctor d,departments de where d.departmentId=de.departmentId ORDER BY doctorId asc`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取医生信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.查询某个医生信息
router.get('/selectDoctor', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM doctor d,departments de where d.departmentId=de.departmentId AND doctorName LIKE '%${req.query.doctorName}%'`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取医生信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//新增医生
router.post('/addDoctor', (req, res) => {

    let {doctorName,departmentId} = req.body;

    doctorName = doctorName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(doctorName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let sql = `INSERT INTO doctor(doctorId,doctorName,departmentId) VALUES (null, '${doctorName}',${departmentId})`
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '添加成功!'})
    })
})

//修改医生
router.post('/updateDoctor', (req, res) => {

    let {doctorId,doctorName,departmentId} = req.body;

    doctorName = doctorName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(doctorName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let sql = `UPDATE doctor SET doctorName = '${doctorName}', departmentId = ${departmentId} WHERE doctorId = ${doctorId}`
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '修改成功!'})
    })
})

//删除科室
router.post('/deleteDoctor', (req, res) => {
    //定义sql
    let sql = `DELETE FROM doctor WHERE doctorId = ${req.body.doctorId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//根据科室id获取医生信息
router.get('/getDoctors', (req, res) => {
    //定义sql
    let sql = `SELECT doctorId,doctorName FROM doctor WHERE departmentId = ${req.query.departmentId}`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取医生信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})
//根据科室id获取床位信息
router.get('/getBed', (req, res) => {
    //定义sql
    let sql = `SELECT bedId,bedName FROM bed where state=0 and departmentId = ${req.query.departmentId}`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取床位信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//获取医保信息
router.get('/getMedicare', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM medicare`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取医保信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//获取药品类型
router.get('/typeInfo', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM type`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取药品类型信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//获取药品单位
router.get('/unitInfo', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM unit`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取药品单位信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//获取药品供货单位
router.get('/areaInfo', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM area`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取药品供货单位信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//2.查询某个供货单位信息
router.get('/selectArea', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM area where areaName LIKE '%${req.query.areaName}%'`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length,status: 0, message: '搜索供货单位信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})


//新增供货单位
router.post('/addArea', (req, res) => {
    let {areaName} = req.body;

    areaName = areaName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(areaName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from area where areaName ='${areaName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此单位已存在,请重新输入!'})

        let sql = `INSERT INTO area (areaName) VALUES ('${areaName}')`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//删除科室
router.post('/deleteArea', (req, res) => {
    //定义sql
    let sql = `DELETE FROM area WHERE areaId = ${req.body.areaId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//2.查询某个药品类型信息
router.get('/selectType', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM type where typeName LIKE '%${req.query.typeName}%'`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length,status: 0, message: '搜索药品类型信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})


//新增药品类型
router.post('/addType', (req, res) => {
    let {typeName} = req.body;

    typeName = typeName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(typeName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from type where typeName ='${typeName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此类型已存在,请重新输入!'})

        let sql = `INSERT INTO type (typeName) VALUES ('${typeName}')`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//删除药品类型
router.post('/deleteType', (req, res) => {
    //定义sql
    let sql = `DELETE FROM type WHERE typeId = ${req.body.typeId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//2.查询计量单位
router.get('/selectUnit', (req, res) => {
    //定义sql
    let sql = `SELECT * FROM unit where unitName LIKE '%${req.query.unitName}%'`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        // if (err) return next(err)
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        // if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            code: 0, msg: '成功', count: results.length,status: 0, message: '搜索计量单位成功', data: results//对象放在数组中，所以要[0]
        })
    })
})


//新增计量单位
router.post('/addUnit', (req, res) => {
    let {unitName} = req.body;

    unitName = unitName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(unitName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from unit where unitName ='${unitName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此单位已存在,请重新输入!'})

        let sql = `INSERT INTO unit (unitName) VALUES ('${unitName}')`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

//删除药品类型
router.post('/deleteUnit', (req, res) => {
    //定义sql
    let sql = `DELETE FROM unit WHERE unitId = ${req.body.unitId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//2.床位报警
router.get('/warnBed', (req, res) => {
    //定义sql
    let sql = `select departmentId,count(*) bedCount from bed WHERE state=0 GROUP BY departmentId`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            status: 0, message: '搜索计量单位成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//3.当天住院人数
router.get('/todayRegister', (req, res) => {
    //定义sql
    let sql = `select COUNT(*) count from register where year(registerDate)=year(now()) and month(registerDate)=month(now()) and day(registerDate)=day(now())`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            status: 0, message: '获取当天住院人数成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//3.当天出院人数
router.get('/todayOutRegister', (req, res) => {
    //定义sql
    let sql = `select COUNT(*) count from register where year(endDate)=year(now()) and month(endDate)=month(now()) and day(endDate)=day(now())`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            status: 0, message: '获取当天出院人数成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//4.获取当前用户菜单
router.get('/userMenu', (req, res) => {
    //定义sql
    let sql = `select distinct t1.* from sys_menu t1 inner join sys_role_menu t2 inner join sys_role_user t3 inner join sys_role t4 on(t1.id=t2.mid and t2.rid=t3.rid and t2.rid=t4.roleid) where t3.uid=${req.user.id} and t1.available=1 and t4.available=1`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            status: 0, message: '获取用户菜单成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//.获取本周住院出院人数
router.get('/weekInOut', (req, res) => {
    //定义sql
    let sql = `SELECT DATE_FORMAT(registerDate,'%Y-%m-%d') date,COUNT(*) count FROM register WHERE YEARWEEK(DATE_FORMAT(registerDate,'%Y-%m-%d'),1)=YEARWEEK(now(),1) group by DATE_FORMAT(registerDate,'%Y-%m-%d');SELECT DATE_FORMAT(endDate,'%Y-%m-%d') date,COUNT(*) count FROM register WHERE YEARWEEK(DATE_FORMAT(endDate,'%Y-%m-%d'),1)=YEARWEEK(now(),1) AND state = 1 group by endDate`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        let weekIn = {
            date:[],
            count:[]
        }
        let weekOut = {
            date:[],
            count:[]
        }
        let arr = []
        for (let i in results[0]) {
            weekIn.date.push(results[0][i].date)
            weekIn.count.push(results[0][i].count)
        }
        for (let i in results[1]) {
            weekOut.date.push(results[1][i].date)
            weekOut.count.push(results[1][i].count)
        }
        // console.log(weekIn)
        arr.push(weekIn)
        arr.push(weekOut)
        res.send({
            status: 0, message: '获取本周住院出院人数成功', data: arr//对象放在数组中，所以要[0]
        })
    })
})

//导出
module.exports = router;

