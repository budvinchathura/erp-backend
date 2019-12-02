const joi = require('@hapi/joi');



const login_validation = (data)=>{
    const schema = joi.object({
        username: joi.string().min(3).required(),
        password: joi.string().min(3).required()
    })

    return schema.validate(data);

}

const register_validation = (data)=>{
    const schema = joi.object({
        username:  joi.string().min(3).required(),
        password:   joi.string().min(3).required(),
        employee_id: joi.string().required()
    })

    return schema.validate(data);
}

module.exports.login_validation = login_validation;
module.exports.register_validation = register_validation;