var mysql = require('mysql');
var sql="";

const db_options = {
    host:'localhost',
    user:'root',
    password:'',
    database:'erp'
}

// const db_options = {
//     host:process.env.DB_HOST,
//     user:process.env.DB_USERNAME,
//     password:process.env.DB_PASSWORD,
//     database:process.env.DB_NAME
// }

var con = mysql.createConnection(db_options);


module.exports.find = function find(tables,params,cb){
    sql = 'SELECT ';
    if(params.columns && params.columns.length>0){
        sql = sql.concat(' ?? ');
        var columns = params.columns && params.columns.length >0 ? [params.columns]:[[]];
        sql = mysql.format(sql,columns);
    }else{
        sql = sql.concat(' * ');
    }
    
    sql = sql.concat(' FROM ?? ');
    sql = mysql.format(sql,[tables]);
    var conditions = '';
    if(params.conditions && params.conditions.length>0){
        conditions = conditions.concat(' WHERE ')
        params.conditions.forEach(condition => {
            conditions = conditions.concat(condition,' AND ')
        });
        conditions = conditions.endsWith('AND ')?conditions.slice(0,-4):conditions
    }
    sql = sql.concat(conditions);
    console.log(sql);
    con.query(sql,cb);
}

module.exports.insert = function insert(table,data,cb){
    sql = 'INSERT INTO ';
    sql = sql.concat(mysql.escapeId(table));
    sql = sql.concat(' SET ? ');
    sql = mysql.format(sql,data);
    console.log(sql);
    con.query(sql,cb);
}

module.exports.update = function update(table,params,data,cb){
    sql = 'UPDATE ';
    sql = sql.concat(mysql.escapeId(table));
    sql = sql.concat(' SET ? ');
    sql = mysql.format(sql,data);
    var conditions='';
    if(params.conditions && params.conditions.length>0){
        conditions = ' WHERE ';
        params.conditions.forEach(condition=>{
            conditions = conditions.concat(condition,' AND ');
        });
        conditions = conditions.slice(0,-4);
    }
    sql = sql.concat(conditions);
    console.log(sql);
    con.query(sql,cb);
    
}