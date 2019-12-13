const joi = require('@hapi/joi');

const pay_grade_add_validation = (data)=>{
    const schema = joi.object({
        pay_grade: joi.string().required()
    })

    return schema.validate(data);

}

module.exports.pay_grade_add_validation = pay_grade_add_validation;
