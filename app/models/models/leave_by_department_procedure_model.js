const procedure_model = require('../procedure_model')
const mysql = require('mysql');

const attrs = [	
    'employee_id',
    'first_name',
    'last_name',
    'job_title',
    'date',
    'leave_type',
    'reason',
    'state',
    'dept_name',
    ];

function leave_by_department_procedure_model(data={}){
    procedure_model.call(this, 'department_leave', leave_by_department_procedure_model, data, attrs);
}

leave_by_department_procedure_model.prototype = Object.create(procedure_model.prototype);

leave_by_department_procedure_model.prototype._view = function(department,start_date,end_date){
    var params = [department,start_date,end_date];
    return this.view(params);
}

module.exports = leave_by_department_procedure_model;