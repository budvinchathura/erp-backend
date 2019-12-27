var _employee_model = require('../../models/models/employee_model');
var _employee_contact_model = require('../../models/models/employee_contact_model');
var _employee_email_model = require('../../models/models/employee_email_model');
var _employee_custom_model = require('../../models/models/employee_custom_model');
var _dependent_model = require('../../models/models/dependent_model');
var _emergency_contact_model = require('../../models/models/emergency_contact_model');
var _job_title_model = require('../../models/models/job_title_model');
var _employment_status_model = require('../../models/models/employment_status_model');
var _pay_grade_model = require('../../models/models/pay_grade_model');
var _department_model = require('../../models/models/department_model');
const db_service = require('../../db/db_service');
const { employee_search_by_id_validation } = require('../validation');
const { clean_object } = require("../../helpers/h");

module.exports.search_by_id = (req, res) => {
    const { error } = employee_search_by_id_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        return search_by_id(req, res, req.body.employee_id);
    }
}

module.exports.profile = (req, res) => {
    return search_by_id(req, res, req.user.employee_id);
}

const search_by_id = (req, res, emp_id) => {
    var employee_model = new _employee_model();
    employee_model.find_by_id(emp_id)
        .then((employee) => {
            if (employee) {
                employee = clean_object(employee);
                return {employee : employee};
            } else {
                return res.status(400).json({ error: 'could not find employee' });
            }
        })
        .then(async (employee) => {
            var employee_contact_model = new _employee_contact_model();
            var contacts = await employee_contact_model.find_by_employee_id(employee.employee.employee_id)
            if (contacts) {
                for (let index = 0; index < contacts.length; index++) {
                    contacts[index] = clean_object(contacts[index]);
                    delete contacts[index].employee_id;
                }
                employee.contact_no = contacts;
            } else {
                employee.contact_no = [];
            }
            return employee;

        })
        .then(async (employee) => {
            var employee_email_model = new _employee_email_model();
            var emails = await employee_email_model.find_by_employee_id(employee.employee.employee_id)

            if (emails) {
                for (let index = 0; index < emails.length; index++) {
                    emails[index] = clean_object(emails[index]);
                    delete emails[index].employee_id;
                }
                employee.email = emails;
            } else {
                employee.email = [];
            }
            return employee;

        })
        .then(async (employee) => {
            var employee_custom_model = new _employee_custom_model();
            var custom = await employee_custom_model.find_by_employee_id(employee.employee.employee_id)

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
            var dependents = await dependent_model.find_by_employee_id(employee.employee.employee_id)

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
            var emergency_contacts = await emergency_contact_model.find_by_employee_id(employee.employee.employee_id)

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

module.exports.form_attributes = (req,res)=>{
    var form_attributes = {};
    var employment_status_model = new _employment_status_model();
    employment_status_model._find_all()
    .then((statuses) => {
        form_attributes.employment_status = [];
        statuses.forEach((status) => {
            form_attributes.employment_status.push(status.employment_status)
        });
        return form_attributes;
        
    })
    .then(async (form_attributes)=>{
        var job_title_model = new _job_title_model();
        const job_titles = await job_title_model._find_all();
        
        for (let index = 0; index < job_titles.length; index++) {
            job_titles[index] = clean_object(job_titles[index]);            
        }
        form_attributes.job_title = job_titles;
        
        return form_attributes;
    })
    .then(async (form_attributes)=>{
        form_attributes.dept_name=[];
        var department_model = new _department_model();
        const department_names = await department_model._find_all();
        department_names.forEach((department) => {
            form_attributes.dept_name.push(department.dept_name);
        });
        return form_attributes;
    })
    .then(async (form_attributes)=>{
        form_attributes.pay_grade = [];
        var pay_grade_model = new _pay_grade_model();
        const pay_grades = await pay_grade_model._find_all();
        pay_grades.forEach((pay_grade) => {
            form_attributes.pay_grade.push(pay_grade.pay_grade);
        });
        return form_attributes;
        
    })
    .then((form_attributes)=>{
        return res.status(200).json(form_attributes);
    })
    .catch((err) => {
        return res.status(500).json({ error: err.message });
    });
}


//TODO validate everything beyond this

module.exports.add = (req,res) => {
    //set employee_id
    emp_id = req.body.employee.employee_id;

    var models = [];

    req.body.employee.employee_id = emp_id
    models.push(new _employee_model(req.body.employee));

    req.body.contact_no.forEach((contact_no) => {
        contact_no.employee_id = emp_id;
        models.push(new _employee_contact_model(contact_no));
    });

    req.body.email.forEach((email) => {
        email.employee_id = emp_id;
        models.push(new _employee_email_model(email));
    });

    req.body.custom.forEach((custom) => {
        custom.employee_id = emp_id;
        models.push(new _employee_custom_model(custom));
    });

    req.body.dependents.forEach((dependent) => {
        dependent.employee_id = emp_id;
        models.push(new _dependent_model(dependent));
    });

    req.body.emergency_contacts.forEach((emergency_contact) => {
        emergency_contact.employee_id = emp_id;
        models.push(new _emergency_contact_model(emergency_contact));
    });

    db_service.transaction_insert(models)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        res.status(500).json({error : err.message})
    });
}

module.exports.update_basic_details = (req, res) => {
    //expected body
    // {
    //     "employee_id": "09929",
    //     "first_name": "Dwain",
    //     "last_name": "Costa",
    //     "nic": "114182682743",
    //     "addr_house_no": "PO Box 5434",
    //     "addr_line_1": "78th Floor",
    //     "addr_line_2": "Whitmire",
    //     "addr_city": "Reese",
    //     "dob": "1951-06-03T18:30:00.000Z",
    //     "marital_status": "Married",
    //     "employment_status": "Contract-FT",
    //     "active_status": 1,
    //     "job_title": "Communication Analyst",
    //     "dept_name": "Information Technology",
    //     "pay_grade": "Grade-1",
    //     "supervisor_id": "74078"
    // }

    var employee_model = new _employee_model(req.body);
    employee_model._update(req.body.employee_id)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.insert_contact_details = (req,res) => {
    //expected body
    // {
    //     "contact_no": [{"employee_id": "09929", "contact_no" : "1984038134"},{"employee_id": "09929","contact_no" : "17167461"}]
    // }

    var models = []

    req.body.contact_no.forEach((contact_no) => {
        models.push(new _employee_contact_model(contact_no));
    });

    db_service.transaction_insert(models)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        res.status(500).json({error : err.message})
    });
}

module.exports.update_contact_details = (req,res) => {
    //expected body
    // {
    //     "old" : {"employee_id" : "00001","contact_no" : "12418218"}
    //     "new" : {"employee_id" : "00001","contact_no" : "12413453"}
    // }

    //TODO handle duplicate entries
    var employee_contact_model = new _employee_contact_model(req.body.new);
    employee_contact_model._update(req.body.old.contact_no)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.delete_contact_details = (req,res) => {
    //expected body
    // {
    //     "employee_id": "09929",
    //     "contact_no": "0112224448"
    // }
    var employee_contact_model = new _employee_contact_model(req.body);
    employee_contact_model._delete()
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.insert_email = (req,res) => {
      //expected body
    // {
    //     "email": [{"employee_id": "09929", "email" : "1984038134"},{"employee_id": "09929","email" : "17167461"}]
    // }
    var models = []

    req.body.email.forEach((email) => {
        models.push(new _employee_email_model(email));
    });

    db_service.transaction_insert(models)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        res.status(500).json({error : err.message})
    });
}

module.exports.update_email = (req,res) => {
    //expected body
    // {
    //     "old" : {"employee_id" : "00001","email" : "foo@gmail.com"}
    //     "new" : {"employee_id" : "00001","email" : "bar@gmail.com"}
    // }

    //TODO handle duplicate entries
    var employee_email_model = new _employee_email_model(req.body.new);
    employee_email_model._update(req.body.old.email)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.delete_email = (req,res) => {
    //expected body
    // {
    //     "employee_id": "09929",
    //     "email": "th@fagad.com"
    // }
    var employee_email_model = new _employee_email_model(req.body);
    employee_email_model._delete()
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.insert_dependent = (req,res) => {
    // expected body
    // {
    //     "nic" : "",
    //     "employee_id" : "",
    //     "first_name" : "",
    //     "last_name" : "",
    //     "relationship" : "",
    //     "addr_house_no" : "",
    //     "addr_line_1" : "",
    //     "addr_line_2" : "",
    //     "addr_city" : "",
    //     "contact_no" : "",
    //     "email" : ""
    // }
    new _department_model(req.body).insert()
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.update_dependent = (req,res) => {
    // expected body
    // {
    //     "old" : {
    //         "nic" : "",
    //         "employee_id" : "",
    //         "first_name" : "",
    //         "last_name" : "",
    //         "relationship" : "",
    //         "addr_house_no" : "",
    //         "addr_line_1" : "",
    //         "addr_line_2" : "",
    //         "addr_city" : "",
    //         "contact_no" : "",
    //         "email" : ""
    //     }
    //     "new" : {
    //         "nic" : "",
    //         "employee_id" : "",
    //         "first_name" : "",
    //         "last_name" : "",
    //         "relationship" : "",
    //         "addr_house_no" : "",
    //         "addr_line_1" : "",
    //         "addr_line_2" : "",
    //         "addr_city" : "",
    //         "contact_no" : "",
    //         "email" : ""
    //     }
    // }
    var dependent_model = new _dependent_model(req.body.new);
    dependent_model._update(req.body.old.nic)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })

}

module.exports.delete_dependent = (req,res) => {
    // expected body
    // {
    //     "nic" : "",
    //     "employee_id" : "",
    //     "first_name" : "",
    //     "last_name" : "",
    //     "relationship" : "",
    //     "addr_house_no" : "",
    //     "addr_line_1" : "",
    //     "addr_line_2" : "",
    //     "addr_city" : "",
    //     "contact_no" : "",
    //     "email" : ""
    // }
    var dependent_model = new _dependent_model(req.body);
    dependent_model._delete()
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.insert_emergency_contact = (req,res) => {
    // expected body
    // {
    //     "nic" : "",
    //     "employee_id" : "",
    //     "name" : "",    
    //     "contact_no" : ""
    // }
    new _emergency_contact_model(req.body).insert()
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.update_emergency_contact = (req,res) => {
    // expected body
    // {
    //     "old" : {
    //         "nic" : "",
    //         "employee_id" : "",
    //         "name" : "",    
    //         "contact_no" : ""
    //         }
    //     "new" : {
    //         "nic" : "",
    //         "employee_id" : "",
    //         "name" : "",    
    //         "contact_no" : ""
    //         }
    // }
    var emergency_contact_model = new _emergency_contact_model(req.body.new);
    emergency_contact_model._update(req.body.old.nic)
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

module.exports.delete_emergency_contact = (req,res) => {
    // expected body
    // {
    //     "nic" : "",
    //     "employee_id" : "",
    //     "name" : "",    
    //     "contact_no" : ""
    // }
    var emergency_contact_model = new _emergency_contact_model(req.body);
    emergency_contact_model._delete()
    .then((result) => {
        if(result){
            return res.status(200).json(result);
        }
    })
    .catch((err) => {
        return res.status(500).json({error : err.message});
    })
}

