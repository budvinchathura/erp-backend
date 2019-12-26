var _employee_by_department_procedure_model = require('../../models/models/employee_by_department_procedure_model');

const { clean_object } = require("../../helpers/h");
const { emp_by_dept_validation } = require("../validation");

module.exports.emp_by_department = (req, res) => {

    const { error } = emp_by_dept_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        var employee_by_department_procedure_model = new _employee_by_department_procedure_model();
        employee_by_department_procedure_model._view(req.body.department)
            .then((emps) => {
                if (emps) {
                    for (let index = 0; index < emps.length; index++) {
                        emps[index] = clean_object(emps[index]);

                    }
                    res.status(200).json(emps);
                } else {
                    res.status(200).json([]);
                }
            })
            .catch((error) => {
                return res.status(500).json({ error: error.message });
            })
    }
}