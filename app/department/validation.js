const joi = require('@hapi/joi');

const department_add_validation = (data)=>{
    const schema = joi.object({
        dept_name: joi.string().required()
    })

    return schema.validate(data);

}

module.exports.department_add_validation = department_add_validation;
