const joi = require('@hapi/joi');

const leave_type_size = 20; 
const pay_grade_size = 20; 
const limit_size = 366; 

module.exports.leave_limit_add_update_validation = (data)=>{
    const schema = joi.object({
        pay_grade: joi.string().max(pay_grade_size).required(),
        leave_type: joi.string().max(leave_type_size).required(),
        limit: joi.number().min(0).max(limit_size).required()
    })

    return schema.validate(data);

}

module.exports.leave_limit_update_validation = (data) => {
    const schema = joi.object({
        old:joi.object({
            pay_grade: joi.string().max(pay_grade_size).allow('',null),
            leave_type: joi.string().max(leave_type_size).allow('',null),
            limit: joi.number().min(0).max(limit_size).allow('',null)
        }),
        new:joi.object({
            pay_grade: joi.string().max(pay_grade_size).required(),
            leave_type: joi.string().max(leave_type_size).required(),
            limit: joi.number().min(0).max(limit_size).required()
        }).required(),
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

module.exports.leave_type_update_validation = (data)=>{
    const schema = joi.object({
        old:joi.object({
            leave_type: joi.string().max(leave_type_size).required(),
        }).required(),
        new:joi.object({
            leave_type: joi.string().max(leave_type_size).required(),
        }).required(),
    })
    return schema.validate(data);
}



// module.exports.leave_limit_add_update_validation = leave_limit_add_update_validation;
