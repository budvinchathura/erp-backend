const model = require('../model')
const mysql = require('mysql');


const attrs = ['pay_grade']

function pay_grade_model(data={}){
    model.call(this,'pay_grade',pay_grade_model,data,attrs)
    
    
    // this.table = 'document';
    // this.constructor = document;
}



pay_grade_model.prototype = Object.create(model.prototype);



pay_grade_model.prototype._find_all = function(){
    return this.find_all([]);
}



module.exports = pay_grade_model;