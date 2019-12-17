const joi = require('@hapi/joi');

const leave_limit_add_update_validation = (data)=>{
    const schema = joi.object({
        pay_grade: joi.string().required(),
        leave_type: joi.string().required(),
        limit: joi.number().min(0)
    })

    return schema.validate(data);

}



module.exports.leave_limit_add_update_validation = leave_limit_add_update_validation;
