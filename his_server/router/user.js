//导入
const express = require('express');
//创建路由实例对象
const router = express.Router();
//导入数据库操作模块
const db = require('../database/index');
const utility = require('utility')
//绑定路由
//1.获取用户信息
router.get('/userinfo', (req, res) => {
    //定义sql
    let sql = `select * from sys_user where userId=${req.user.id} and available=1`

    db(sql, (err, results) => {
        if (err) throw err;//这种报错方式能够看出哪一行错误
        //获取到以后，响应给客户端,然后删除密码和头像
        if (results.length!==1)return res.send({status:1,message:'用户不存在'})
        res.send({
            status: 0, message: '获取用户信息成功', data: results[0]//对象放在数组中，所以要[0]
        })
    })
})

//初始化用户菜单
router.get('/initUserMenu', (req, res) => {
    //定义sql
    let sql = `select distinct t1.* from sys_menu t1 inner join sys_role_menu t2 inner join sys_role_user t3 inner join sys_role t4 on(t1.id=t2.mid and t2.rid=t3.rid and t2.rid=t4.roleid) where t3.uid=${req.user.id} and t1.available=1 and t4.available=1;select * from sys_menu`
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;
        let tempArray = []
        for (let i in results[0]) {
            tempArray.push(results[0][i].id)
        }
        let userMenu = SearchTreeById(tempArray, results[1])
        res.send(transMenu(userMenu))
    })
})


function SearchTreeById(name, data) {
    let wgObj = {
        dwtreeDateAll: []
    }
    wgObj.dwtreeDateAll = data
    //先获取与输入框匹配的节点数组
    let titleArr = [];
    wgObj.dwtreeDateAll.forEach(function (o) {
        for (let k in name) {
            if (o.id === name[k]) {
                titleArr.push(o);
            }
        }
    });
    // 递归检索节点(子节点符合父节点不符合也需要带上父节点)
    let arrTarget = [];
    for (let i = 0; i < titleArr.length; i++) {
        let forFn = function (id, name) {
            for (let j = 0; j < wgObj.dwtreeDateAll.length; j++) {
                if (id === wgObj.dwtreeDateAll[j].id) {
                    arrTarget.push(wgObj.dwtreeDateAll[j]);
                    forFn(wgObj.dwtreeDateAll[j].pid, name);
                    break
                }
            }
        };
        forFn(titleArr[i].id, titleArr[i].title);
    }
    //递归完之后去重取目标树数据
    wgObj.dwtreeDate = [];
    for (let i = 0; i < arrTarget.length; i++) {
        let flag = 1;
        for (let j = 0; j < wgObj.dwtreeDate.length; j++) {
            if (wgObj.dwtreeDate[j].id === arrTarget[i].id && wgObj.dwtreeDate[j].pid === arrTarget[i].pid) {
                flag = 0;
            }
        }
        flag === 1 ? wgObj.dwtreeDate.push(arrTarget[i]) : false;
    }
    return wgObj.dwtreeDate;
}


function transMenu(data) {

    let formatdata = [];
    let tempObject = {
        homeInfo: {},
        logoInfo: {},
        menuInfo: []
    };

    tempObject.homeInfo.title = "首页"
    tempObject.homeInfo.href = "page/welcome.html"
    tempObject.logoInfo.title = "住院信息系统"
    tempObject.logoInfo.image = "images/logo.png"
    tempObject.logoInfo.href = ""


    for (let i in data) {     // pId为0时表示为根节点
        if (data[i].pid === 0) {
            tempObject.menuInfo = getChildren(data[i].id);
            formatdata.push(tempObject);
        }
    }

    function getChildren(id) {    //递归体  即对每条data逐条递归找children
        let tempArray = [];
        for (let i in data) {
            if (data[i].pid === id) {
                let tempChild = {};
                tempChild.title = data[i].title;
                tempChild.href = data[i].href;
                tempChild.target = data[i].target;
                tempChild.icon = data[i].icon;
                if (selectChildren(data[i].id)) {   //若存在子节点，继续递归；否则为叶节点，停止递归
                    tempChild.child = getChildren(data[i].id);
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

    return tempObject
}


//3.修改u用户密码

//4.修改用户头像
router.post('/update/avatar', (req, res) => {
    //拼接sql - 头像的字段是user_pic 但是通过前端的req.body.avatar属性传递过来的。
    //  前端没有传递id，所以id要通过req.user.id获取
    let sql = `update user set user_pic="${req.body.avatar}" where id=${req.user.id}`;
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;
        //判断结果
        if (results.affectedRows !== 1) return res.send({status: 1, message: '修改头像失败'})
        //成功提示
        res.send({status: 0, message: '修改头像成功'})
    })
})

//4.修改用户信息
router.post('/updateUserInfo', (req, res) => {
    let {realName, sex, phone, address, identity,} = req.body
    let userId = req.user.id

    let sql = `UPDATE sys_user SET identity='${identity}',realName='${realName}', sex=${sex}, address='${address}', phone='${phone}' WHERE userId=${userId}`;
    //执行sql
    db(sql, (err, results) => {
        if (err) throw err;
        //成功提示
        res.send({status: 0, message: '修改成功'})
    })
})

//5.修改用户密码
router.post('/updateUserPassword', (req, res) => {
    let {old_password, new_password, again_password} = req.body
    let userId = req.user.id

    if (!/^[a-zA-Z]\w{5,9}$/.test(new_password)) {
        return res.send({status: 1, message: '新密码格式有误,请重新输入!'});
    }
    if (new_password !== again_password) return res.send({status: 1, message: '两次密码不一致!'})

    old_password = utility.md5(old_password);
    new_password = utility.md5(new_password);
    if (old_password === new_password)return res.send({status: 1, message: '新旧密码不能相同!'})

    let sql = `select password from sys_user where userId=${userId}`

    db(sql, (err, results) => {
        if (err) throw err;
        if (old_password !== results[0].password) return res.send({status: 1, message: '旧密码输入错误,请重新输入!'});

        let sql1 = `update sys_user set password='${new_password}' where userId=${userId}`
        db(sql1, (err, results) => {
            if (err) throw err;
            //成功提示
            res.send({status: 0, message: '修改成功,请重新登录'})
        })
    })

})


//导出
module.exports = router;

