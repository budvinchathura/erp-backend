const db = require('../db/db');

function procedure_model(procedure, sub_model, data={}, attrs){
    this.procedure = procedure;
    this.constructor = sub_model;
    attrs.forEach((element) => {
        this[element] = data[element];
    });
    this.attrs = attrs;
}

procedure_model.prototype.view = function view(params){
    const procedure = this.procedure;
    const constructor = this.constructor;

    return new Promise((resolve, reject) => {
        const cb = function(error, results, fields){
            if (error){
                reject (error);
            } else {
                if (results[0].length > 0){
                    var res_array = [];
                    results[0].forEach((result) => {
                        res_array.push(new constructor(result))
                    })
                    resolve(res_array);
                } else {
                    resolve(false);
                }
            }
        }
        db.call_proc(procedure, params, cb);
    });
}

module.exports = procedure_model;