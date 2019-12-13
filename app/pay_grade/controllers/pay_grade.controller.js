var _pay_grade_model = require('../../models/models/pay_grade_model');
const { clean_object } = require("../../helpers/h");
const {pay_grade_add_validation} = require("../vaidation")



module.exports.view = (req, res) => {
    var pay_grade_model = new _pay_grade_model();
    pay_grade_model._find_all()
        .then((pay_grades) => {
            if(pay_grades){
                for (let index = 0; index < pay_grades.length; index++) {
                    pay_grades[index] = pay_grades[index].pay_grade
                    
                }
                res.status(200).json(pay_grades);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}

module.exports.add = (req,res)=>{
    const { error } = pay_grade_add_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }else{
        var pay_grade_model = new _pay_grade_model(req.body);
        pay_grade_model.insert()
        .then((result) => {
            return res.status(200).json({});
        }).catch((err) => {
            return res.status(500).json({ error: err.message });
        });
    }
}