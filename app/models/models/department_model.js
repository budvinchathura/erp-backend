const model = require('../model')
const mysql = require('mysql');


const attrs = ['dept_name']

function department_model(data={}){
    model.call(this,'department',department_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



department_model.prototype = Object.create(model.prototype);



department_model.prototype._find_all = function(){
    return this.find_all([]);
}

department_model.prototype._update = function (old_dept_name){
    var params = [];
    params.push(mysql.escapeId('dept_name').concat(' = ').concat(mysql.escape(old_dept_name)));
    return this.update(params);
}

module.exports = department_model;