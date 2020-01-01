const model = require('../model')
const mysql = require('mysql');


const attrs = ['leave_type']

function leave_type_model(data={}){
    model.call(this,'leave_type',leave_type_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



leave_type_model.prototype = Object.create(model.prototype);



leave_type_model.prototype._find_all = function(){
    return this.find_all([]);
}

leave_type_model.prototype._update = function (old_leave_type){
    var params = [];
    params.push(mysql.escapeId('leave_type').concat(' = ').concat(mysql.escape(old_leave_type)));
    return this.update(params);
}



module.exports = leave_type_model;