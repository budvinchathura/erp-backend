var _employee_model = require('../../models/models/employee_model');
const {employee_search_by_id_validation}  = require('../validation');

module.exports.search_by_id = (req,res)=>{
    const { error } = employee_search_by_id_validation(req.body);
    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }
    var employee_model = new _employee_model();
    employee_model.find_by_id(req.body.employee_id)
    .then((employee) => {
        if (employee){
            delete employee.table;
            delete employee.attrs;
            return res.status(200).json(employee);
        }else{
            return res.status(400).json({error:'could not find employee'});
        }
    }).catch((err) => {
        return res.status(500).json({error:err});
    });
}