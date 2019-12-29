const joi = require('@hapi/joi');

module.exports.e_status_add_validation = (data)=>{
    const schema = joi.object({
        employment_status: joi.string().required()
    })

    return schema.validate(data);

}
