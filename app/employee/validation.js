const joi = require('@hapi/joi');

module.exports.employee_search_by_id_validation = (data)=>{
    const schema = joi.object({
        employee_id: joi.string().required(),
    })
    return schema.validate(data);
}

module.exports.employee_insert_basic_validation = (data)=>{
    const schema = joi.object({
        first_name: joi.string().max(20).required(),
        last_name: joi.string().max(20).required(),
        nic: joi.string().max(15).required(),
        addr_house_no: joi.string().max(20).required(),
        addr_line_1: joi.string().max(20).required(),
        addr_line_2: joi.string().max(20),
        addr_city: joi.string().max(20).required(),
        dob: joi.date().required(),
        marital_status: joi.string().required().valid('Married','Single','Divorced'),
        employment_status: joi.string().max(20).required(),
        job_title: joi.string().max(50).required(),
        dept_name: joi.string().max(50).required(),
        pay_grade: joi.string().max(20).required(),
    })
    return schema.validate(data);
}

module.exports.employee_update_basic_validation = (data)=>{
    const schema = joi.object({
        new:joi.object({
            employee_id: joi.string().max(20).required(),
            first_name: joi.string().max(20),
            last_name: joi.string().max(20).required(),
            nic: joi.string().max(15).required(),
            addr_house_no: joi.string().max(20).required(),
            addr_line_1: joi.string().max(20).required(),
            addr_line_2: joi.string().max(20),
            addr_city: joi.string().max(20).required(),
            dob: joi.date().required(),
            marital_status: joi.string().required().valid('Married','Single','Divorced'),
            employment_status: joi.string().max(20).required(),
            active_status: joi.number().required().valid(1,0),
            job_title: joi.string().max(50).required(),
            dept_name: joi.string().max(50).required(),
            pay_grade: joi.string().max(20).required(),
            supervisor_id: joi.string().max(20).required(),
        }).required(),
    })
    return schema.validate(data);
}




