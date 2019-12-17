const model = require('../model')
const mysql = require('mysql');


const attrs = ['pay_grade','leave_type','limit']

function leave_limit_model(data={}){
    model.call(this,'pay_grade_leave',leave_limit_model,data,attrs)
}



leave_limit_model.prototype = Object.create(model.prototype);



leave_limit_model.prototype._find_all = function(){
    return this.find_all([]);
}

leave_limit_model.prototype.find_by_pay_grade_leave = function(pay_grade,leave_type){
    var params = [];
    params.push(mysql.escapeId('pay_grade').concat(' = ').concat(mysql.escape(pay_grade)));
    params.push(mysql.escapeId('leave_type').concat(' = ').concat(mysql.escape(leave_type)));
    return this.find_all(params);
}

leave_limit_model.prototype._update = function(){
    var params = [];
    params.push(mysql.escapeId('pay_grade').concat(' = ').concat(mysql.escape(this.pay_grade)));
    params.push(mysql.escapeId('leave_type').concat(' = ').concat(mysql.escape(this.leave_type)));

    return this.update(params);
}



module.exports = leave_limit_model;