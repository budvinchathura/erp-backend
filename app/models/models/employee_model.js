const model = require('../model')
const mysql = require('mysql');


const attrs = [	
'employee_id',
'first_name',
'last_name',
'NIC',
'addr_house_no',
'addr_line_1',
'addr_line_2',
'addr_city',
'dob',
'marital_status',
'employment_status',
'active_status',
'job_title',
'dept_name',
'pay_grade',
'supervisor_id']

function employee_model(data={}){
    model.call(this,'employee',employee_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



employee_model.prototype = Object.create(model.prototype);

employee_model.prototype.find_by_id = function (id){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(id)));
    // console.log(params);
    return this.find_first(params);
}



module.exports = employee_model;