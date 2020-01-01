const model = require('../model')
const mysql = require('mysql');


const attrs = ['attribute']

function custom_attribute_model(data={}){
    model.call(this,'custom_attribute',custom_attribute_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



custom_attribute_model.prototype = Object.create(model.prototype);



custom_attribute_model.prototype._find_all = function(){
    return this.find_all([]);
}

custom_attribute_model.prototype._update = function (old_attribute){
    var params = [];
    params.push(mysql.escapeId('attribute').concat(' = ').concat(mysql.escape(old_attribute)));
    return this.update(params);
}



module.exports = custom_attribute_model;