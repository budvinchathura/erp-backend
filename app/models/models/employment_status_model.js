const model = require('../model')
const mysql = require('mysql');


const attrs = ['employment_status']

function employment_status_model(data={}){
    model.call(this,'employment_status',employment_status_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



employment_status_model.prototype = Object.create(model.prototype);



employment_status_model.prototype._find_all = function(){
    return this.find_all([]);
}



module.exports = employment_status_model;