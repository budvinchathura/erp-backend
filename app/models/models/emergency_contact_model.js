const model = require('../model')
const mysql = require('mysql');


const attrs = [

    'nic',
    'employee_id',
    'name',    
    'contact_no'
]

function emergency_contact_model(data = {}) {
    model.call(this, 'emergency_contact', emergency_contact_model, data, attrs)


    // this.table = 'document';
    // this.constructor = document;
}



emergency_contact_model.prototype = Object.create(model.prototype);

emergency_contact_model.prototype.find_by_employee_id = function (employee_id) {
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(employee_id)));
    // console.log(params);
    return this.find_all(params);
}

emergency_contact_model.prototype._delete = function(){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    params.push(mysql.escapeId('nic').concat(' = ').concat(mysql.escape(this.nic)));
    return this.delete(params);
}

dependent_model.prototype._update = function (previous_nic){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    params.push(mysql.escapeId('nic').concat(' = ').concat(mysql.escape(previous_nic)));
    return this.update(params);
}


module.exports = emergency_contact_model;