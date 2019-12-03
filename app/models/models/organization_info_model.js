const model = require('../model');
const mysql = require('mysql');

const attrs = ['key', 'value'];

function organization_info_model(data = {}){
    model.call(this,'organization_info', organization_info_model, data, attrs)
}

organization_info_model.prototype = Object.create(model.prototype);

//not tested

organization_info_model.prototype._find_all = function(){
    return this.find_all([]);
}

organization_info_model.prototype.find_by_key = function(key){
    var params = [];
    var param = mysql.escapeId('key').concat(' = ').concat(mysql.escape(key));
    params.push(param);
    return this.find_first(params);
}

module.exports = organization_info_model;
