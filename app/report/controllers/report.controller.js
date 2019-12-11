var _emp_leave_taken_procedure_model = require ('../../models/models/employee_leave_taken_procedure_model');

module.exports.view_employee_leave = (req, res) => {
    var employee_leave_taken_procedure_model = new _emp_leave_taken_procedure_model();
    employee_leave_taken_procedure_model._view(req.body.employee_id)
        .then((results) => {
            if(results){
                results.forEach(element => {
                    delete element.procedure;
                    delete element.attrs;
                });
                res.status(200).json({result : results});
            }
        })
        .catch((error) => {
            return res.status(500).json({error : error.message});
        })
}