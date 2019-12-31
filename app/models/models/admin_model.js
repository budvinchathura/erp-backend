const model = require('../model')
const mysql = require('mysql');


const attrs = ['username','password','email','access_level']

function admin_model(data={}){
    model.call(this,'admin',admin_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



admin_model.prototype = Object.create(model.prototype);

admin_model.prototype.find_by_username = function (username){
    var params = [];
    params.push(mysql.escapeId('username').concat(' = ').concat(mysql.escape(username)));
    // console.log(params);
    return this.find_first(params);
}



module.exports = admin_model;