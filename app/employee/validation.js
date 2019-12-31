const joi = require('@hapi/joi');

const employee_id_size = 50;
const first_name_size = 20;
const last_name_size = 20;
const nic_size = 15;
const addr_house_no_size = 20;
const addr_line_1_size = 20;
const addr_line_2_size = 20;
const addr_city_size = 20;
const employment_status_size = 20;
const job_title_size = 50;
const dept_name_size = 50;
const pay_grade_size = 20;
const contact_no_size = 20;
const email_size = 50;
const relationship_size = 20;
const attribute_size = 50;
const value_size = 50;

module.exports.employee_search_by_id_validation = (data)=>{
    const schema = joi.object({
        employee_id: joi.string().required(),
    })
    return schema.validate(data);
}

module.exports.employee_add_validation = (data) => {
    // {
    //     "employee": {
    //         "employee_id": "09929",
    //         "first_name": "Dwain",
    //         "last_name": "Costa",
    //         "nic": "114182682743",
    //         "addr_house_no": "PO Box 5434",
    //         "addr_line_1": "78th Floor",
    //         "addr_line_2": "Whitmire",
    //         "addr_city": "Reese",
    //         "dob": "1951-06-03T18:30:00.000Z",
    //         "marital_status": "Married",
    //         "employment_status": "Contract-FT",
    //         "active_status": 1,
    //         "job_title": "Communication Analyst",
    //         "dept_name": "Information Technology",
    //         "pay_grade": "Grade-1",
    //         "supervisor_id": "74078"
    //     },
    //     "contact_no": [
    //         {
    //             "contact_no": "0162731579"
    //         }
    //     ],
    //     "email": [
    //         {
    //             "email": "HolderV@nowhere.com"
    //         }
    //     ],
    //     "custom": [],
    //     "dependents": [],
    //     "emergency_contacts": [
    //         {
    //             "nic": "236753403057",
    //             "name": "Perez",
    //             "contact_no": "0241844969"
    //         }
    //     ]
    // }
    const schema = joi.object({
        employee:joi.object({
            first_name: joi.string().max(first_name_size).required(),
            last_name: joi.string().max(last_name_size).required(),
            nic: joi.string().max(nic_size).required(),
            addr_house_no: joi.string().max(addr_house_no_size).required(),
            addr_line_1: joi.string().max(addr_line_1_size).required(),
            addr_line_2: joi.string().max(addr_line_2_size),
            addr_city: joi.string().max(addr_city_size).required(),
            dob: joi.date().required(),
            marital_status: joi.string().required().valid('Married','Single','Divorced'),
            employment_status: joi.string().max(employment_status_size).required(),
            job_title: joi.string().max(job_title_size).required(),
            dept_name: joi.string().max(dept_name_size).required(),
            pay_grade: joi.string().max(pay_grade_size).required(),
            supervisor_id: joi.string().max(employee_id_size).required(),
        }).required(),
        contact_no:joi.array().items(joi.object({
            contact_no: joi.string().max(contact_no_size).required(),
        })),
        email:joi.array().items(joi.object({
            email: joi.string().email().max(email_size).required(),
        })),
        custom:joi.array().items(joi.object({
            attribute: joi.string().max(attribute_size).required(),
            value: joi.string().max(value_size).required(),
        })),
        dependents:joi.array().items(joi.object({
            nic: joi.string().max(nic_size).required(),
            first_name: joi.string().max(first_name_size).required(),
            last_name: joi.string().max(last_name_size).required(),
            relationship: joi.string().max(relationship_size).required(),
            addr_house_no: joi.string().max(addr_house_no_size).required(),
            addr_line_1: joi.string().max(addr_line_1_size).required(),
            addr_line_2: joi.string().max(addr_line_2_size),
            addr_city: joi.string().max(addr_city_size).required(),
            contact_no: joi.string().max(contact_no_size).required(),
            email: joi.string().max(email_size).required(),
        })),
        emergency_contacts:joi.array().items(joi.object({
            nic: joi.string().max(nic_size).required(),
            name: joi.string().max(first_name_size).required(),
            contact_no: joi.string().max(contact_no_size).required(),
        })),
    })
    return schema.validate(data);
}

module.exports.employee_insert_basic_validation = (data)=>{
    const schema = joi.object({
        first_name: joi.string().max(first_name_size).required(),
        last_name: joi.string().max(last_name_size).required(),
        nic: joi.string().max(nic_size).required(),
        addr_house_no: joi.string().max(addr_house_no_size).required(),
        addr_line_1: joi.string().max(addr_line_1_size).required(),
        addr_line_2: joi.string().max(addr_line_2_size),
        addr_city: joi.string().max(addr_city_size).required(),
        dob: joi.date().required(),
        marital_status: joi.string().required().valid('Married','Single','Divorced'),
        employment_status: joi.string().max(employment_status_size).required(),
        job_title: joi.string().max(job_title_size).required(),
        dept_name: joi.string().max(dept_name_size).required(),
        pay_grade: joi.string().max(pay_grade_size).required(),
    })
    return schema.validate(data);
}

module.exports.employee_update_basic_validation = (data)=>{
    const schema = joi.object({
        new:joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            first_name: joi.string().max(first_name_size),
            last_name: joi.string().max(last_name_size),
            nic: joi.string().max(nic_size),
            addr_house_no: joi.string().max(addr_house_no_size),
            addr_line_1: joi.string().max(addr_line_1_size),
            addr_line_2: joi.string().max(addr_line_2_size),
            addr_city: joi.string().max(addr_city_size),
            dob: joi.date(),
            marital_status: joi.string().valid('Married','Single','Divorced'),
            employment_status: joi.string().max(employment_status_size),
            active_status: joi.number().valid(1,0),
            job_title: joi.string().max(job_title_size),
            dept_name: joi.string().max(dept_name_size),
            pay_grade: joi.string().max(pay_grade_size),
            supervisor_id: joi.string().max(employee_id_size),
        }).required(),
    })
    return schema.validate(data);
}

module.exports.employee_insert_contact_details_validation = (data)=>{
    // {
    //     "contact_no": [{"employee_id": "09929", "contact_no" : "1984038134"},{"employee_id": "09929","contact_no" : "17167461"}]
    // }

    const schema = joi.object({
        contact_no:joi.array().items(joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            contact_no: joi.string().max(contact_no_size).required(),
         }).required()).required(),
    })
    return schema.validate(data);
}

module.exports.employee_update_contact_details_validation = (data)=>{
    //expected body
    // {
    //     "old" : {"employee_id" : "00001","contact_no" : "12418218"}
    //     "new" : {"employee_id" : "00001","contact_no" : "12413453"}
    // }
    const schema = joi.object({
        old:joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            contact_no: joi.string().max(contact_no_size).required(),
        }).required(),
        new:joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            contact_no: joi.string().max(contact_no_size).required(),
        }).required(),
    })
    return schema.validate(data);
}

module.exports.employee_delete_contact_details_validation = (data)=>{
    //expected body
    // {
    //     "employee_id": "09929",
    //     "contact_no": "0112224448"
    // }
    const schema = joi.object({
        employee_id: joi.string().max(employee_id_size).required(),
        contact_no: joi.string().max(contact_no_size).required(),
    })
    return schema.validate(data);
}

module.exports.employee_insert_emails_validation = (data)=>{
     //expected body
    // {
    //     "email": [{"employee_id": "09929", "email" : "1984038134"},{"employee_id": "09929","email" : "17167461"}]
    // }

    const schema = joi.object({
        email:joi.array().items(joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            email: joi.string().email().max(email_size).required(),
         }).required()).required(),
    })
    return schema.validate(data);
}

module.exports.employee_update_email_validation = (data)=>{
    //expected body
    // {
    //     "old" : {"employee_id" : "00001","email" : "foo@gmail.com"}
    //     "new" : {"employee_id" : "00001","email" : "bar@gmail.com"}
    // }
    const schema = joi.object({
        old:joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            email: joi.string().email().max(email_size).required(),
        }).required(),
        new:joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            email: joi.string().email().max(email_size).required(),
        }).required(),
    })
    return schema.validate(data);
}

module.exports.employee_delete_email_validation = (data)=>{
    //expected body
    // {
    //     "employee_id": "09929",
    //     "email": "th@fagad.com"
    // }
    const schema = joi.object({
        employee_id: joi.string().max(employee_id_size).required(),
        email: joi.string().email().max(email_size).required(),
    })
    return schema.validate(data);
}

module.exports.employee_insert_dependent_validation = (data)=>{
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
    const schema = joi.object({
        nic: joi.string().max(nic_size).required(),
        employee_id: joi.string().max(employee_id_size).required(),
        first_name: joi.string().max(first_name_size).required(),
        last_name: joi.string().max(last_name_size).required(),
        relationship: joi.string().max(relationship_size).required(),
        addr_house_no: joi.string().max(addr_house_no_size).required(),
        addr_line_1: joi.string().max(addr_line_1_size).required(),
        addr_line_2: joi.string().max(addr_line_2_size),
        addr_city: joi.string().max(addr_city_size).required(),
        contact_no: joi.string().max(contact_no_size).required(),
        email: joi.string().max(email_size).required(),
    })
    return schema.validate(data);
}

module.exports.employee_update_dependent_validation = (data)=>{
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
    const schema = joi.object({
        old:joi.object({
            nic: joi.string().max(nic_size).required(),
            employee_id: joi.string().max(employee_id_size).required(),
            first_name: joi.string().max(first_name_size),
            last_name: joi.string().max(last_name_size),
            relationship: joi.string().max(relationship_size),
            addr_house_no: joi.string().max(addr_house_no_size),
            addr_line_1: joi.string().max(addr_line_1_size),
            addr_line_2: joi.string().max(addr_line_2_size),
            addr_city: joi.string().max(addr_city_size),
            contact_no: joi.string().max(contact_no_size),
            email: joi.string().max(email_size),
        }).required(),
        new:joi.object({
            nic: joi.string().max(nic_size).required(),
            employee_id: joi.string().max(employee_id_size).required(),
            first_name: joi.string().max(first_name_size),
            last_name: joi.string().max(last_name_size),
            relationship: joi.string().max(relationship_size),
            addr_house_no: joi.string().max(addr_house_no_size),
            addr_line_1: joi.string().max(addr_line_1_size),
            addr_line_2: joi.string().max(addr_line_2_size),
            addr_city: joi.string().max(addr_city_size),
            contact_no: joi.string().max(contact_no_size),
            email: joi.string().max(email_size),
        }).required(),
    })
    return schema.validate(data);
}

module.exports.employee_delete_dependent_validation = (data)=>{
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
    const schema = joi.object({
        nic: joi.string().max(nic_size).required(),
        employee_id: joi.string().max(employee_id_size).required(),
        first_name: joi.string().max(first_name_size),
        last_name: joi.string().max(last_name_size),
        relationship: joi.string().max(relationship_size),
        addr_house_no: joi.string().max(addr_house_no_size),
        addr_line_1: joi.string().max(addr_line_1_size),
        addr_line_2: joi.string().max(addr_line_2_size),
        addr_city: joi.string().max(addr_city_size),
        contact_no: joi.string().max(contact_no_size),
        email: joi.string().max(email_size),
    })
    return schema.validate(data);
}

module.exports.employee_insert_emergency_contact_validation = (data)=>{
    // expected body
    // {
    //     "nic" : "",
    //     "employee_id" : "",
    //     "name" : "",    
    //     "contact_no" : ""
    // }
    const schema = joi.object({
        nic: joi.string().max(nic_size).required(),
        employee_id: joi.string().max(employee_id_size).required(),
        name: joi.string().max(first_name_size).required(),
        contact_no: joi.string().max(contact_no_size).required(),
    })
    return schema.validate(data);
}

module.exports.employee_update_emergency_contact_validation = (data)=>{
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
    const schema = joi.object({
        old:joi.object({
            nic: joi.string().max(nic_size).required(),
            employee_id: joi.string().max(employee_id_size).required(),
            name: joi.string().max(first_name_size),
            contact_no: joi.string().max(contact_no_size),
        }).required(),
        new:joi.object({
            nic: joi.string().max(nic_size).required(),
            employee_id: joi.string().max(employee_id_size).required(),
            name: joi.string().max(first_name_size),
            contact_no: joi.string().max(contact_no_size),
        }).required(),
    })
    return schema.validate(data);
}

module.exports.employee_delete_emergency_contact_validation = (data)=>{
    // expected body
    // {
    //     "nic" : "",
    //     "employee_id" : "",
    //     "name" : "",    
    //     "contact_no" : ""
    // }
    const schema = joi.object({
        nic: joi.string().max(nic_size).required(),
        employee_id: joi.string().max(employee_id_size).required(),
        name: joi.string().max(first_name_size),
        contact_no: joi.string().max(contact_no_size),
    })
    return schema.validate(data);
}

module.exports.employee_insert_custom_attributes_validation = (data)=>{
    // expected body
//   {
//       "attributes": [{"employee_id": "09929", "attribute" : "cust_sttr_1", "value" : "value_1"},{"employee_id": "09929", "attribute" : "cust_sttr_2", "value" : "value_2"}]
//   }
    const schema = joi.object({
        attributes:joi.array().items(joi.object({
            employee_id: joi.string().max(employee_id_size).required(),
            attribute: joi.string().max(attribute_size).required(),
            value: joi.string().max(value_size).required(),
         }).required()).required(),
    })
    return schema.validate(data);
}








