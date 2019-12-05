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



module.exports = employee_email_model;