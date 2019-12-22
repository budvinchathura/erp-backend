const procedure_model = require('../procedure_model')
const mysql = require('mysql');

const attrs = ['leave_type', 'limit', 'leaves_taken'];

function employee_leave_taken_procedure_model(data={}){
    procedure_model.call(this, 'employee_leave_taken', employee_leave_taken_procedure_model, data, attrs);
}

employee_leave_taken_procedure_model.prototype = Object.create(procedure_model.prototype);

employee_leave_taken_procedure_model.prototype._view = function(emp_id){
    var params = [];
    params.push(emp_id);
    return this.view(params);
}

module.exports = employee_leave_taken_procedure_model;