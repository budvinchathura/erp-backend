const model = require('../model')
const mysql = require('mysql');


const attrs = ['username','password','employee_id','access_level']

function user_access_model(data={}){
    model.call(this,'user_access',user_access_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



user_access_model.prototype = Object.create(model.prototype);

user_access_model.prototype.find_by_username = function (username){
    var params = [];
    params.push(mysql.escapeId('username').concat(' = ').concat(mysql.escape(username)));
    return this.find_first(params);
}



module.exports = user_access_model;