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



module.exports = custom_attribute_model;