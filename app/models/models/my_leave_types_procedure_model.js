const procedure_model = require('../procedure_model')

const attrs = ['leave_type'];

function my_leave_types_procedure_model(data={}){
    procedure_model.call(this, 'my_leave_types', my_leave_types_procedure_model, data, attrs);
}

my_leave_types_procedure_model.prototype = Object.create(procedure_model.prototype);

my_leave_types_procedure_model.prototype._view = function(emp_id){
    var params = [];
    params.push(emp_id);
    return this.view(params);
}

module.exports = my_leave_types_procedure_model;