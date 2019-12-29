var _employee_by_department_procedure_model = require('../../models/models/employee_by_department_procedure_model');
var _employee_model = require('../../models/models/employee_model');
var _leave_by_department_procedure_model = require('../../models/models/leave_by_department_procedure_model');

const { clean_object } = require("../../helpers/h");
const { emp_by_dept_validation, leave_by_dept_validation,employee_filter_validation} = require("../validation");

module.exports.emp_by_department = (req, res) => {

    const { error } = emp_by_dept_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        var employee_model = new _employee_model();
        employee_model.find_by_department(req.body.department)
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


module.exports.leave_by_department = (req, res) => {

    const { error } = leave_by_dept_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        var leave_by_department_procedure_model = new _leave_by_department_procedure_model();
        leave_by_department_procedure_model._view(req.body.department,req.body.start_date,req.body.end_date)
            .then((leaves) => {
                if (leaves) {
                    for (let index = 0; index < leaves.length; index++) {
                        leaves[index] = clean_object(leaves[index]);
                    }
                    res.status(200).json(leaves);
                } else {
                    res.status(200).json([]);
                }
            })
            .catch((error) => {
                return res.status(500).json({ error: error.message });
            })
    }
}


module.exports.employee_filter = (req, res) => {

    const { error } = employee_filter_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        var employee_model = new _employee_model();
        employee_model.filter_all(req.body)
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