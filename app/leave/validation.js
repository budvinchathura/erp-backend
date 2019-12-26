const joi = require('@hapi/joi');

module.exports.leave_limit_add_update_validation = (data)=>{
    const schema = joi.object({
        pay_grade: joi.string().required(),
        leave_type: joi.string().required(),
        limit: joi.number().min(0)
    })

    return schema.validate(data);

}

module.exports.leave_add_validation = (data)=>{
    const schema = joi.object({
        date: joi.date().required(),
        leave_type: joi.string().required(),
        reason: joi.string().required()
    })

    return schema.validate(data);
}

module.exports.leave_type_add_validation = (data)=>{
    const schema = joi.object({        
        leave_type: joi.string().required()
    })

    return schema.validate(data);
}



// module.exports.leave_limit_add_update_validation = leave_limit_add_update_validation;
