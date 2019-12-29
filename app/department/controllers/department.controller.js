var _department_model = require('../../models/models/department_model');
const { clean_object } = require("../../helpers/h");
const {department_add_validation} = require("../validation")



module.exports.view = (req, res) => {
    var department_model = new _department_model();
    department_model._find_all()
        .then((departments) => {
            if(departments){
                for (let index = 0; index < departments.length; index++) {
                    departments[index] = clean_object(departments[index])
                    
                }
                res.status(200).json(departments);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}

module.exports.add = (req,res)=>{
    const { error } = department_add_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var department_model = new _department_model(req.body);
        department_model.insert()
        .then((result) => {
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });
    }
}