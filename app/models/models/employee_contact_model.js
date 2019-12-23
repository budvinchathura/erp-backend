const model = require('../model')
const mysql = require('mysql');


const attrs = ['employee_id','contact_no']

function employee_contact_model(data={}){
    model.call(this,'employee_contact_no',employee_contact_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



employee_contact_model.prototype = Object.create(model.prototype);

employee_contact_model.prototype.find_by_employee_id = function (employee_id){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(employee_id)));
    // console.log(params);
    return this.find_all(params);
}

employee_contact_model.prototype._delete = function(){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    params.push(mysql.escapeId('contact_no').concat(' = ').concat(mysql.escape(this.contact_no)));
    return this.delete(params);
}

module.exports = employee_contact_model;