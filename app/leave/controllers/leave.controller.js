var _leave_limit_model = require('../../models/models/leave_limit_model');
const { clean_object } = require("../../helpers/h");


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