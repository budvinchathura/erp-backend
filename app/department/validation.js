const joi = require('@hapi/joi');

const dept_size = 50; 

module.exports.department_add_validation = (data)=>{
    const schema = joi.object({
        dept_name: joi.string().max(dept_size).required(),
    })

    return schema.validate(data);

}

module.exports.department_update_validation = (data)=>{
    const schema = joi.object({
        old:joi.object({
            dept_name: joi.string().max(dept_size).required(),
        }).required(),
        new:joi.object({
            dept_name: joi.string().max(dept_size).required(),
        }).required(),
    })
    return schema.validate(data);
}

