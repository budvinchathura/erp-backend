const joi = require('@hapi/joi');



const login_validation = (data)=>{
    const schema = joi.object({
        username: joi.string().min(3).max(40).required(),
        password: joi.string().min(3).required()
    })

    return schema.validate(data);

}

const register_validation = (data)=>{
    const schema = joi.object({
        username:  joi.string().min(3).max(40).required(),
        password:   joi.string().min(3).required(),
        employee_id: joi.string().max(50).required(),
        confirm_password: joi.string().min(3).valid(joi.ref('password')).required()

    })

    return schema.validate(data);
}



const admin_register_validation = (data)=>{
    const schema = joi.object({
        username:  joi.string().min(3).max(40).required(),
        password:   joi.string().min(3).required(),
        email: joi.string().email().required(),
        secret: joi.string().required(),
        confirm_password: joi.string().min(3).valid(joi.ref('password')).required()
    })

    return schema.validate(data);
}

const password_reset_validation = (data)=>{
    const schema = joi.object({
        username:  joi.string().min(3).max(40).required(),
        password:   joi.string().min(3).required(),
        employee_id: joi.string().max(50).required(),
        confirm_password: joi.string().min(3).valid(joi.ref('password')).required()
        
    })

    return schema.validate(data);
}



module.exports.login_validation = login_validation;
module.exports.register_validation = register_validation;
module.exports.admin_register_validation = admin_register_validation;
module.exports.password_reset_validation = password_reset_validation;