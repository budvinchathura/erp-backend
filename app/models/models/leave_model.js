const model = require('../model')
const mysql = require('mysql');


const attrs = ['employee_id','date','leave_type','reason','state']

function leave_model(data={}){
    model.call(this,'leave',leave_model,data,attrs);
    
}



leave_model.prototype = Object.create(model.prototype);



leave_model.prototype._find_all = function(){
    return this.find_all([]);
}

leave_model.prototype.apply_leave = function(){
    this.state = 'pending';
    return this.insert();
}





module.exports = leave_model;