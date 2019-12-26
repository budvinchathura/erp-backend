const joi = require('@hapi/joi');

module.exports.emp_by_dept_validation = (data)=>{
    const schema = joi.object({
        department: joi.string().required()
        
    })

    return schema.validate(data);

}