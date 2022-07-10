//定义一个数据库操作的方法，封装为函数
function fn(sql, callback) {
    const mysql = require('mysql');
    const conn = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: '123456',
        database: 'hisdatabase',
        multipleStatements: true
    })
    //链接
    conn.connect();
    //操作
    conn.query(sql, callback);
    //断开
    conn.end();
}

module.exports = fn;

//导出方法1
// module.exports.fn = fn;
//导出方法2:
// module.exports = fn;

