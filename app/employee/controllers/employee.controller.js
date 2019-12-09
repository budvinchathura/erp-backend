var _employee_model = require('../../models/models/employee_model');
var _employee_contact_model = require('../../models/models/employee_contact_model');
var _employee_email_model = require('../../models/models/employee_email_model');
var _employee_custom_model = require('../../models/models/employee_custom_model');
var _dependent_model = require('../../models/models/dependent_model');
var _emergency_contact_model = require('../../models/models/emergency_contact_model');
const { employee_search_by_id_validation } = require('../validation');
const { clean_object } = require("../../helpers/h");

module.exports.search_by_id = (req, res) => {
    const { error } = employee_search_by_id_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    var employee_model = new _employee_model();
    employee_model.find_by_id(req.body.employee_id)
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