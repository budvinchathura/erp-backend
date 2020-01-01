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

employment_status_model.prototype._update = function (old_employment_status){
    var params = [];
    params.push(mysql.escapeId('employment_status').concat(' = ').concat(mysql.escape(old_employment_status)));
    return this.update(params);
}


module.exports = employment_status_model;