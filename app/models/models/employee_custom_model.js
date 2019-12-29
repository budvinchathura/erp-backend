const model = require('../model')
const mysql = require('mysql');


const attrs = ['employee_id','attribute','value']

function employee_custom_model(data={}){
    model.call(this,'employee_custom_attributes',employee_custom_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



employee_custom_model.prototype = Object.create(model.prototype);

employee_custom_model.prototype.find_by_employee_id = function (employee_id){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(employee_id)));
    // console.log(params);
    return this.find_all(params);
}

employee_custom_model.prototype._update = function(){
    var params = [];
    params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(this.employee_id)));
    params.push(mysql.escapeId('attribute').concat(' = ').concat(mysql.escape(this.attribute)));
    return this.update(params);
}

employee_custom_model.prototype._bulk_update = function(models){
    var param_array = [];
    models.forEach(model => {
        var params = [];
        params.push(mysql.escapeId('employee_id').concat(' = ').concat(mysql.escape(model.employee_id)));
        params.push(mysql.escapeId('attribute').concat(' = ').concat(mysql.escape(model.attribute)));
        param_array.push(params)
    });
    console.log(param_array);
    return this.bulk_update(models,param_array);
}

module.exports = employee_custom_model;