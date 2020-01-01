const joi = require('@hapi/joi');

const employment_status_size = 20;

module.exports.e_status_add_validation = (data)=>{
    const schema = joi.object({
        employment_status: joi.string().max(employment_status_size).required()
    })

    return schema.validate(data);

}

module.exports.e_status_update_validation = (data)=>{
    const schema = joi.object({
        old:joi.object({
            employment_status: joi.string().max(employment_status_size).required()
        }).required(),
        new:joi.object({
            employment_status: joi.string().max(employment_status_size).required()
        }).required(),
    })
    return schema.validate(data);
}
