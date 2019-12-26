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