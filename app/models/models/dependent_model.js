const model = require('../model')
const mysql = require('mysql');


const attrs = [

    'nic',
    'employee_id',
    'first_name',
    'last_name',
    'relationship',
    'addr_house_no',
    'addr_line_1',
    'addr_line_2',
    'addr_city',
    'contact_no',
    'email'
]

function dependent_model(data = {}) {
    model.call(this, 'dependent', dependent_model, data, attrs)


    // this.table = 'document';
    // this.constructor = document;
}



dependent_model.prototype = Object.create(model.prototype);

dependent_model.prototype.find_by_employee_id = function (employee_id) {
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(employee_id)));
    // console.log(params);
    return this.find_all(params);
}



module.exports = dependent_model;