var _custom_attribute_model = require('../../models/models/custom_attribute_model');
const { clean_object } = require("../../helpers/h");
const {attribute_add_validation,attribute_update_validation} = require("../validation")



module.exports.view = (req, res) => {
    var custom_attribute_model = new _custom_attribute_model();
    custom_attribute_model._find_all()
        .then((custom_attributes) => {
            if(custom_attributes){
                for (let index = 0; index < custom_attributes.length; index++) {
                    custom_attributes[index] = clean_object(custom_attributes[index]);
                    
                }
                res.status(200).json(custom_attributes);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}

module.exports.add = (req,res)=>{
    const { error } = attribute_add_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var custom_attribute_model = new _custom_attribute_model(req.body);
        custom_attribute_model.insert()
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
    //         "attribute":"dep1"
    //     },
    //     "old":{
    //         "attribute":"dep2" 
    //     }
    // }
    const { error } = attribute_update_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var custom_attribute_model = new _custom_attribute_model(req.body.new);
        custom_attribute_model._update(req.body.old.attribute)
        .then((result) => {
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });
    }
}