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



module.exports = job_title_model;