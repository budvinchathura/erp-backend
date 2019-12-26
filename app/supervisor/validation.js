const joi = require('@hapi/joi');

module.exports.subordinate_leaves_view_validation = (data)=>{
    const schema = joi.object({
        state: joi.string().required().valid('all','approved','pending','rejected')
    })

    return schema.validate(data);

}
