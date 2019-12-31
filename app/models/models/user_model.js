const model = require('../model')
const mysql = require('mysql');


const attrs = ['username','password','employee_id']

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

user_model.prototype.find_by_username_or_employee_id = function(username,employee_id){
    var params = [];
    var param = mysql.escapeId('username').concat(' = ').concat(mysql.escape(username));
    param = param.concat(' OR ',mysql.escapeId('employee_id'),' = ',mysql.escape(employee_id));
    params.push(param)
    return this.find_first(params);
}

user_model.prototype._update = function () {
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    return this.update(params);
}

module.exports = user_model;