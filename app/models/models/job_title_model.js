const model = require('../model')
const mysql = require('mysql');


const attrs = ['job_title','access_level']

function job_title_model(data={}){
    model.call(this,'job_title',job_title_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



job_title_model.prototype = Object.create(model.prototype);



job_title_model.prototype._find_all = function(){
    return this.find_all([]);
}

job_title_model.prototype.find_by_access_level = function(access_level){
    var params = [];
    var param = mysql.escapeId('access_level').concat(' = ').concat(mysql.escape(access_level));
    params.push(param);
    return this.find_all(params);
}

job_title_model.prototype._update = function(){
    var params = [];
    params.push(mysql.escapeId('job_title').concat(' = ').concat(mysql.escape(this.job_title)));

    return this.update(params);
}



module.exports = job_title_model;