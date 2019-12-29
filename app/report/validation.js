const joi = require('@hapi/joi');

module.exports.emp_by_dept_validation = (data)=>{
    const schema = joi.object({
        department: joi.string().required()
        
    })

    return schema.validate(data);

}


module.exports.leave_by_dept_validation = (data)=>{
    const schema = joi.object({
        department: joi.string().required(),        
        start_date: joi.date().required(),      
        end_date: joi.date().required()        
    });

    return schema.validate(data);
}


module.exports.employee_filter_validation = (data)=>{
    const schema = joi.object({
        dept_name: joi.string().required(),        
        marital_status: joi.string().required(),      
        employment_status: joi.string().required(),        
        active_status: joi.string().required(),        
        job_title: joi.string().required(),        
        pay_grade: joi.string().required()        
    });

    return schema.validate(data);
}