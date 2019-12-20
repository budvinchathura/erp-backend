const model = require('../model')
const mysql = require('mysql');


const attrs = [	
'employee_id',
'first_name',
'last_name',
'nic',
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

employee_model.prototype.find_by_job_title = function (job_title){
    var params = [];
    params.push(mysql.escapeId('job_title').concat(' = ').concat(mysql.escape(job_title)));
    return this.find_all(params);
}



module.exports = employee_model;