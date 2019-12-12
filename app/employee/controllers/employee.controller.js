var _employee_model = require('../../models/models/employee_model');
var _employee_contact_model = require('../../models/models/employee_contact_model');
var _employee_email_model = require('../../models/models/employee_email_model');
var _employee_custom_model = require('../../models/models/employee_custom_model');
var _dependent_model = require('../../models/models/dependent_model');
var _emergency_contact_model = require('../../models/models/emergency_contact_model');
var _job_title_model = require('../../models/models/job_title_model');
var _emp_leave_taken_procedure_model = require ('../../models/models/employee_leave_taken_procedure_model');
const { employee_search_by_id_validation } = require('../validation');
const { clean_object } = require("../../helpers/h");

module.exports.search_other_by_id = (req, res) => {
    const { error } = employee_search_by_id_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        return search_by_id(req, res, req.body.employee_id);
    }
}

module.exports.search_self = (req, res) => {
    return search_by_id(req, res, req.user.employee_id);
}

const search_by_id = (req, res, emp_id) => {
    var employee_model = new _employee_model();
    employee_model.find_by_id(emp_id)
        .then((employee) => {
            if (employee) {
                employee = clean_object(employee);
                return employee;
            } else {
                return res.status(400).json({ error: 'could not find employee' });
            }
        })
        .then(async (employee) => {
            var employee_contact_model = new _employee_contact_model();
            var contacts = await employee_contact_model.find_by_employee_id(employee.employee_id)
            if (contacts) {
                for (let index = 0; index < contacts.length; index++) {
                    contacts[index] = contacts[index].contact_no;
                   

                }
                employee.contact_no = contacts;
            } else {
                employee.contact_no = [];
            }
            return employee;

        })
        .then(async (employee) => {
            var employee_email_model = new _employee_email_model();
            var emails = await employee_email_model.find_by_employee_id(employee.employee_id)

            if (emails) {
                for (let index = 0; index < emails.length; index++) {
                    emails[index] = emails[index].email;

                }
                employee.email = emails;
            } else {
                employee.email = [];
            }
            return employee;

        })
        .then(async (employee) => {
            var employee_custom_model = new _employee_custom_model();
            var custom = await employee_custom_model.find_by_employee_id(employee.employee_id)

            if (custom) {
                for (let index = 0; index < custom.length; index++) {
                    custom[index] = (({ attribute, value }) => ({ attribute, value }))(custom[index]);

                }
                employee.custom = custom;
            } else {
                employee.custom = [];
            }
            return employee;

        })
        .then(async (employee) => {
            var dependent_model = new _dependent_model();
            var dependents = await dependent_model.find_by_employee_id(employee.employee_id)

            if (dependents) {
                for (let index = 0; index < dependents.length; index++) {
                    dependents[index] = clean_object(dependents[index]);
                    delete dependents[index].employee_id

                }
                employee.dependents = dependents;
            } else {
                employee.dependents = [];
            }
            return employee;

        })
        .then(async (employee) => {
            var emergency_contact_model = new _emergency_contact_model();
            var emergency_contacts = await emergency_contact_model.find_by_employee_id(employee.employee_id)

            if (emergency_contacts) {
                for (let index = 0; index < emergency_contacts.length; index++) {
                    emergency_contacts[index] = clean_object(emergency_contacts[index]);
                    delete emergency_contacts[index].employee_id

                }
                employee.emergency_contacts = emergency_contacts;
            } else {
                employee.emergency_contacts = [];
            }
            return res.status(200).json(employee);

        })
        .catch((err) => {
            return res.status(500).json({ error: err.message });
        });
}

module.exports.view_hr = (req, res) => {
    var job_title_model = new _job_title_model();
    job_title_model.find_by_access_level('L3')
    .then((job_titles) => {
        if(job_titles){
            return job_titles[0];

        }else{
            res.status(400).json({ error: 'Job Title with access level L3 is not in database'});
        }
    })
    .then(async (job_title)=>{
        if(job_title){
            var employee_model = new _employee_model();
            var hr_employee = await employee_model.find_by_job_title(job_title.job_title);
            if(hr_employee){
                res.status(200).json({data:clean_object(hr_employee[0])});
            }else{
                res.status(400).json({error : 'No employee with L3 access level'})
            }
        }
        // hr_employee = clean_object(hr_employee);

    })
    .catch((err) => {
        return res.status(500).json({ error: err.message });
    });
}
module.exports.view_employee_leave = (req, res) => {
    var employee_leave_taken_procedure_model = new _emp_leave_taken_procedure_model();
    employee_leave_taken_procedure_model._view(req.user.employee_id)
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
