const joi = require('@hapi/joi');

const pay_grade_size = 20;

module.exports.pay_grade_add_validation = (data)=>{
    const schema = joi.object({
        pay_grade: joi.string().max(pay_grade_size).required()
    })

    return schema.validate(data);

}

module.exports.pay_grade_update_validation = (data)=>{
    const schema = joi.object({
        old:joi.object({
            pay_grade: joi.string().max(pay_grade_size).required()
        }).required(),
        new:joi.object({
            pay_grade: joi.string().max(pay_grade_size).required()
        }).required(),
    })
    return schema.validate(data);

}

