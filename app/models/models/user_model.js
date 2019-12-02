const model = require('../model')
const mysql = require('mysql');


const attrs = ['username','password','emp_id']

function user_model(data={}){
    model.call(this,'user',user_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



user_model.prototype = Object.create(model.prototype);

user_model.prototype.find_by_username = function (username){
    var params = [];
    params.push(mysql.escapeId('username').concat(' = ').concat(mysql.escape(username)));
    // console.log(params);
    return this.find_first(params);
}

user_model.prototype.find_by_username_or_emp_id = function(username,emp_id){
    var params = [];
    var param = mysql.escapeId('username').concat(' = ').concat(mysql.escape(username));
    param = param.concat(' OR ',mysql.escapeId('emp_id'),' = ',mysql.escape(emp_id));
    params.push(param)
    return this.find_first(params);
}

module.exports = user_model;