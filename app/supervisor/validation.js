const joi = require('@hapi/joi');

module.exports.subordinate_leaves_view_validation = (data)=>{
    const schema = joi.object({
        state: joi.string().required().valid('all','approved','pending','rejected')
    })

    return schema.validate(data);

}


module.exports.leave_state_change_validation = (data)=>{
    const schema = joi.object({
        employee_id: joi.string().required(),
        date: joi.date().required(),
        leave_type: joi.string().required(),
        state: joi.string().required().valid('approved','pending','rejected')
    })

    return schema.validate(data);

}
