var _leave_limit_model = require('../../models/models/leave_limit_model');
const { clean_object } = require("../../helpers/h");
const {leave_limit_add_update_validation} = require("../validation");


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
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });

    }    

}