const procedure_model = require('../procedure_model')
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
    'supervisor_id'];

function employee_by_department_procedure_model(data={}){
    procedure_model.call(this, 'employee_by_department', employee_by_department_procedure_model, data, attrs);
}

employee_by_department_procedure_model.prototype = Object.create(procedure_model.prototype);

employee_by_department_procedure_model.prototype._view = function(department){
    var params = [];
    params.push(department);
    return this.view(params);
}

module.exports = employee_by_department_procedure_model;