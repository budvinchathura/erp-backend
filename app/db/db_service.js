var mysql = require('mysql');
var db = require('./db');
var sql="";

module.exports.transaction_insert = function transaction_insert(models){
    sql = "";
    models.forEach((model) => {
        var sub_sql = 'INSERT INTO ';
        sub_sql = sub_sql.concat(mysql.escapeId(model.table));
        sub_sql = sub_sql.concat(' SET ? ');
        sub_sql = mysql.format(sub_sql,model.get_db_object());
        sub_sql = sub_sql.concat(' ; ');
        sql = sql.concat(sub_sql);
    });

    return new Promise((resolve, reject) => {
        const cb = function(error,results,fields){
            
            if(error){
                reject(error);
            } 
            else{
                resolve(true) 
            }            
        }

        db.exec_transaction_query(sql,cb);
    });

}