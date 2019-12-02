const db = require('../db/db')

function model(table,sub_model,data={},attrs){
    this.table = table;
    this.constructor = sub_model;

    attrs.forEach((element) => {
        this[element] = data[element];
    });
    this.attrs = attrs;

}

model.prototype.find_first = function findFirst(params){
    const _params = {
        conditions :params
    }
    const table = this.table;
    const constructor = this.constructor;
    
    return new Promise((resolve, reject) => {


        const cb = function(error,results,fields){
            
            if(error){
                reject(error);
            } 
            else{
                if(results.length>0){
                    const obj = new constructor(results[0])
                    resolve(obj);
                }else{
                    resolve(false)
                } 
            }            
        }
        
        db.find([table],_params,cb)
    });

}


model.prototype.insert = function insert(){
    const table = this.table;
    const attrs = this.attrs;
    var obj = {};
    for(const attr of attrs){
        obj[attr] = this[attr]
        if(obj[attr]===undefined || obj[attr]===null){
            obj[attr] = 'DEFAULT'
        }
    }

    return new Promise((resolve, reject) => {
        const cb = function(error,results,fields){
            
            if(error){
                reject(error);
            } 
            else{
                resolve(true) 
            }            
        }

        db.insert(table,obj,cb)
    });
}

module.exports = model;