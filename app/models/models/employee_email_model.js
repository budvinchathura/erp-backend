const model = require('../model')
const mysql = require('mysql');


const attrs = ['employee_id','email']

function employee_email_model(data={}){
    model.call(this,'employee_email',employee_email_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



employee_email_model.prototype = Object.create(model.prototype);

employee_email_model.prototype.find_by_employee_id = function (employee_id){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(employee_id)));
    // console.log(params);
    return this.find_all(params);
}

employee_email_model.prototype._delete = function(){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    params.push(mysql.escapeId('email').concat(' = ').concat(mysql.escape(this.email)));
    return this.delete(params);
}

employee_email_model.prototype._update = function (previous_email){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    params.push(mysql.escapeId('email').concat(' = ').concat(mysql.escape(previous_email)));
    return this.update(params);
}

module.exports = employee_email_model;