//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');

const utility = require('utility');

//1.获取科室信息
router.get('/getSysMenu', (req, res) => {
    let sql = `select * from sys_menu`
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取菜单信息成功', data: transMenu(results)
        })
    })
})

function transMenu(data) {
    let formatdata = [];
    let tempObject = {};

    for (let i in data) {     // pId为0时表示为根节点
        if (data[i].pid === 0) {
            tempObject.id = data[i].id;
            tempObject.title = data[i].title;
            tempObject.spread = true
            tempObject.children = getChildren(tempObject.id);
            formatdata.push(tempObject);
        }
    }

    function getChildren(id) {    //递归体  即对每条data逐条递归找children
        let tempArray = [];
        for (let i in data) {
            if (data[i].pid === id) {
                let tempChild = {};
                tempChild.id = data[i].id;
                tempChild.pid = data[i].pid;
                tempChild.title = data[i].title;
                tempChild.href = data[i].href;
                if (data[i].spread) {
                    tempChild.spread = true
                } else {
                    tempChild.spread = false
                }
                tempChild.checked = data[i].checked
                tempChild.target = data[i].target;
                tempChild.icon = data[i].icon;
                if (data[i].available) {
                    tempChild.disabled = false
                } else {
                    tempChild.disabled = true
                }
                if (selectChildren(data[i].id)) {   //若存在子节点，继续递归；否则为叶节点，停止递归
                    tempChild.children = getChildren(data[i].id);
                }
                tempArray.push(tempChild);
            }
        }
        return tempArray;
    }

    function selectChildren(id) {   // 是否存在子节点
        for (let i in data) {
            if (data[i].pid === id) {
                return true;
            }
        }
        return false;
    }

    return formatdata
}

//1.获取所有药品信息
router.get('/getAllRoleInfo', (req, res) => {

    //定义sql
    let sql = `select * from sys_role`
    //执行sql
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;

        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取角色信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

router.get('/selectRole', (req, res) => {
    //定义sql
    let sql = `select * from sys_role where roleName like '%${req.query.roleName}%'`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '搜索角色信息成功', data: results//对象放在数组中，所以要[0]
        })
    })
})


router.post('/addRole', (req, res) => {
    let {roleName, roleDesc, available} = req.body;

    roleName = roleName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(roleName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from sys_role where roleName ='${roleName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此角色已存在,请重新输入!'})

        let sql = `INSERT INTO sys_role (roleName,roleDesc,available) VALUES ('${roleName}','${roleDesc}',${available})`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})


router.post('/updateRole', (req, res) => {
    let {roleId, roleName, roleDesc, available} = req.body;

    roleName = roleName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(roleName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    let sql = `UPDATE sys_role SET roleName = '${roleName}', roleDesc= '${roleDesc}', available = ${available} WHERE roleId = ${roleId}`
    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '修改成功!'})
    })

})

//删除收费项目
router.post('/deleteRole', (req, res) => {
    if (req.body.roleId === 1 )return res.send({status: 1, message: '超级管理员角色不可删除!'})
    //定义sql
    let sql = `DELETE FROM sys_role WHERE roleId = ${req.body.roleId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//2.搜索角色菜单信息信息
router.get('/selectRoleMenu', (req, res) => {

    let sql = `select t1.* from sys_menu t1 INNER JOIN sys_role_menu t2 on t1.id=t2.mid where available=1 and t2.rid=${req.query.rid}`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;
        let tempArray0 = []
        for (let i in results) {
            let tempChild0 = {}
            tempChild0.id = results[i].id
            tempArray0.push(tempChild0);
        }
        let sql1 = `select * from sys_menu`
        let data1
        db(sql1, (err, results) => {
            if (err) throw err;//这种报错方式能够看出哪一行错误
            data1 = results
            for (let i in data1) {
                for (let j in tempArray0) {
                    if (data1[i].id === tempArray0[j].id) {
                        data1[i].checked = true
                    }
                }
            }
            res.send({
                code: 0, msg: '成功', count: results.length, status: 0, message: '获取该角色菜单信息成功', data: transMenu(data1)
            })
        })
    })
})

//更新角色菜单
router.post('/updateRoleMenu', (req, res) => {
    let {rid, list} = req.body
    if (rid=== 1 )return res.send({status: 1, message: '超级管理员角色默认拥有所有菜单!'})

    let delRoleMenuSql = `delete from sys_role_menu where rid = ${rid}`
    let dataStrArr = list.split(",");  //分割成字符串数组
    let dataIntArr = [];//保存转换后的整型字符串
    //方法一
    dataStrArr.forEach(item => {
        dataIntArr.push(+item);
    });
    db(delRoleMenuSql, (err, results) => {
        if (err) throw err;
        for (let i in dataIntArr) {
            if (dataIntArr[i] > 6) {
                let sql = `INSERT INTO sys_role_menu (rid,mid) VALUES (${rid},${dataIntArr[i]})`
                db(sql, (err, results) => {
                    if (err) throw err;
                })
            }
        }
        res.send({
            status: 0, message: '分配成功'
        })
    })

})

//获取用户信息
router.get('/getAllUserInfo', (req, res) => {
    //定义sql
    let sql = `select * from sys_user`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取所有用户成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

//获取用户信息
router.post('/selectUserInfo', (req, res) => {
    let {loginName, realName, phone} = req.body

    loginName = loginName.replace(/\s*/g, "");
    realName = realName.replace(/\s*/g, "");
    phone = phone.replace(/\s*/g, "");

    //定义sql
    let sql = `SELECT * FROM sys_user WHERE loginName LIKE concat('%', concat('${loginName}', '%')) AND realName LIKE concat('%', concat('${realName}', '%')) AND phone LIKE concat('%', concat('${phone}', '%'))`

    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '查询用户成功', data: results//对象放在数组中，所以要[0]
        })
    })
})

router.post('/addUser', (req, res) => {
    let {realName, loginName, identity, address, phone, position, sex, available} = req.body;

    loginName = loginName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(realName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(loginName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check = `SELECT COUNT(*) as count from sys_user where loginName ='${loginName}'`

    db(check, (err, results) => {
        //判断sql
        if (err) throw err;
        if (results[0].count !== 0) return res.send({status: 1, message: '此账号已存在,请重新输入!'})

        let sql = `INSERT INTO sys_user (realName, loginName, identity,address,phone,password,position,sex,available) VALUES ('${realName}','${loginName}','${identity}','${address}','${phone}','e10adc3949ba59abbe56e057f20f883e','${position}',${sex},${available})`
        db(sql, (err, results) => {
            //判断sql
            if (err) throw err;
            return res.send({status: 0, message: '添加成功!'})
        })
    })
})

router.post('/updateUser', (req, res) => {
    let {realName, loginName, identity, address, phone, position, sex, available, userId} = req.body;

    loginName = loginName.replace(/\s*/g, "");

    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(realName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }
    if (!/^[A-Za-z0-9\u4e00-\u9fa5]+$/.test(loginName)) {
        // return res.send({status: 1, message: '用户名不符合规则，1~10位非空白字符！'});
        return res.send({status: 1, message: '只能输入汉字、字母、数字,请重新输入!'});
    }

    let check1 = `SELECT loginName from sys_user where userId =${userId}`

    let sql = `update sys_user set realName='${realName}', loginName='${loginName}', identity='${identity}',address='${address}',phone='${phone}',position='${position}',sex=${sex},available = ${available} where userId=${userId}`

    let check = `SELECT COUNT(*) as count from sys_user where loginName ='${loginName}'`

    db(check1, (err, results) => {
        if (err) throw err;
        if (results[0].loginName === loginName){
            let sql = `update sys_user set realName='${realName}', loginName='${loginName}', identity='${identity}',address='${address}',phone='${phone}',position='${position}',sex=${sex},available = ${available} where userId=${userId}`
            if (err) throw err;
            db(sql, (err, results) => {
                //判断sql
                if (err) throw err;
                return res.send({status: 0, message: '更新成功!'})
            })
        }else {
            let check = `SELECT COUNT(*) as count from sys_user where loginName ='${loginName}'`
            db(check, (err, results) => {
                if (err) throw err;
                if (results[0].count !== 0) return res.send({status: 1, message: '此账号已存在,请重新输入!'})
                let sql = `update sys_user set realName='${realName}', loginName='${loginName}', identity='${identity}',address='${address}',phone='${phone}',position='${position}',sex=${sex},available = ${available} where userId=${userId}`
                db(sql, (err, results) => {
                    //判断sql
                    if (err) throw err;
                    return res.send({status: 0, message: '更新成功!'})
                })
            })
        }
    })
})

//删除用户
router.post('/deleteUser', (req, res) => {
    //定义sql
    if (req.body.userId === 1 )return res.send({status: 1, message: '超级管理员账户唯一,不可删除!'})
    let sql = `DELETE FROM sys_user WHERE userId = ${req.body.userId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '删除成功!'})
    })
})

//重置用户密码"LAY_CHECKED":true
router.post('/resetUserPwd', (req, res) => {
    //定义sql
    let sql = `update sys_user set password='${utility.md5('123456')}' WHERE userId = ${req.body.userId}`

    db(sql, (err, results) => {
        //判断sql
        if (err) throw err;
        return res.send({status: 0, message: '重置密码成功!'})
    })
})
//获取用户角色信息
router.get('/getUserRoleInfo', (req, res) => {

    //定义sql
    let sql = `select t1.* from sys_role t1 inner join sys_role_user t2 on t1.roleId=t2.rid where t2.uid=${req.query.userId} and t1.available=1;select * from sys_role where available=1`

    db(sql, (err, results) => {
        if (err) throw err;
        // let array = []
        // for (let i  in results) {
        //     array.push(results[i].roleId)
        // }
        for (let i in results[1]) {
            for (let j in results[0]) {
                if (results[1][i].roleId === results[0][j].roleId) {
                    results[1][i].LAY_CHECKED = true
                }
            }
        }
        return res.send({
            code: 0, msg: '成功', count: results.length, status: 0, message: '获取用户角色成功', data: results[1]//对象放在数组中，所以要[0]
        })
    })
})

//更新用户角色信息
router.post('/updateUserRoleInfo', (req, res) => {

    let {userId, userRoleMenuArr} = req.body
    if (userId === 1 )return res.send({status: 1, message: '超级管理员账户唯一,不可进行权限操作!'})

    let delRoleMenuSql = `delete from sys_role_user where uid = ${userId}`
    db(delRoleMenuSql, (err, results) => {
        if (err) throw err;
        for (let i in userRoleMenuArr) {
            let sql = `INSERT INTO sys_role_user (uid,rid) VALUES (${userId},${userRoleMenuArr[i]})`
            db(sql, (err, results) => {
                if (err) throw err;
            })
        }
        res.send({
            status: 0, message: '分配成功'
        })
    })
})
//导出
module.exports = router;

