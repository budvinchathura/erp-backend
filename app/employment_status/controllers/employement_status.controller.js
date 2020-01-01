var _employment_status_model = require('../../models/models/employment_status_model');
const { clean_object } = require("../../helpers/h");
const {e_status_add_validation,e_status_update_validation} = require("../validation")



module.exports.view = (req, res) => {
    var employment_status_model = new _employment_status_model();
    employment_status_model._find_all()
        .then((e_statuses) => {
            if(e_statuses){
                for (let index = 0; index < e_statuses.length; index++) {
                    e_statuses[index] = clean_object(e_statuses[index]);
                    
                }
                res.status(200).json(e_statuses);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}

module.exports.add = (req,res)=>{
    const { error } = e_status_add_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var employment_status_model = new _employment_status_model(req.body);
        employment_status_model.insert()
        .then((result) => {
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });
    }
}

module.exports.update = (req,res)=>{
    // expected input
    // {
    //      "new":{
    //         "employment_status":"dep1"
    //     },
    //     "old":{
    //         "employment_status":"dep2" 
    //     }
    // }
    const { error } = e_status_update_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var employment_status_model = new _employment_status_model(req.body.new);
        employment_status_model._update(req.body.old.employment_status)
        .then((result) => {
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });
    }
}
