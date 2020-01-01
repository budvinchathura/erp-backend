const model = require('../model')
const mysql = require('mysql');


const attrs = ['employee_id',
    'date',
    'leave_type',
    'reason',
    'state',
    'first_name',
    'last_name',
    'dob',
    'marital_status',
    'employment_status',
    'active_status',
    'job_title',
    'dept_name',
    'pay_grade']

function detailed_leave_model(data = {}) {
    model.call(this, 'leave_full_details', detailed_leave_model, data, attrs);

}



detailed_leave_model.prototype = Object.create(model.prototype);



detailed_leave_model.prototype.find_by_supervisor_id = function (supervisor_id,state = 'ALL') {
    var params = [];
    params.push(mysql.escapeId('supervisor_id').concat(' = ').concat(mysql.escape(supervisor_id)));
    if(state !=='ALL'){
        params.push(mysql.escapeId('state').concat(' = ').concat(mysql.escape(state)));
    }
    return this.find_all(params);
}





module.exports = detailed_leave_model;