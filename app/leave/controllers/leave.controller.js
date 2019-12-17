var _leave_limit_model = require('../../models/models/leave_limit_model');
var _leave_model = require('../../models/models/leave_model');
var _emp_leave_taken_procedure_model = require ('../../models/models/employee_leave_taken_procedure_model');

const { clean_object } = require("../../helpers/h");
const {leave_limit_add_update_validation,leave_add_validation} = require("../validation");


module.exports.view_limits = (req, res) => {
    var leave_limit_model = new _leave_limit_model();
    leave_limit_model._find_all()
        .then((limits) => {
            if(limits){
                for (let index = 0; index < limits.length; index++) {
                    limits[index] = clean_object(limits[index])
                    
                }
                res.status(200).json(limits);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}


module.exports.add_limit = (req,res)=>{

    const { error } = leave_limit_add_update_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var leave_limit_model = new _leave_limit_model(req.body);
        leave_limit_model.insert()
        .then((result) => {
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });

    }    

}

module.exports.update_limit = (req,res)=>{

    const { error } = leave_limit_add_update_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var leave_limit_model = new _leave_limit_model(req.body);
        leave_limit_model._update()
        .then((result) => {
            if(result.affectedRows > 0){
                return res.status(200).json({});
            }else{
                return res.status(400).json({error:"invalid content"});
            }
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });

    }    

}



module.exports.remaining = (req, res) => {
    var employee_leave_taken_procedure_model = new _emp_leave_taken_procedure_model();
    employee_leave_taken_procedure_model._view(req.user.employee_id)
        .then((results) => {
            if (results) {
                results.forEach(element => {
                    delete element.procedure;
                    delete element.attrs;
                });
                res.status(200).json({ result: results });
            }
        })
        .catch((error) => {
            return res.status(500).json({ error: error.message });
        })
}

module.exports.apply_leave = (req,res)=>{
    const { error } = leave_add_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var leave_model = new _leave_model(req.body);
        leave_model.employee_id = req.user.employee_id;
        leave_model.apply_leave()
        .then((result) => {
            return res.status(200).json({});
        }).catch((error) => {
            return res.status(500).json({ error: error.message });
        });
    }
}