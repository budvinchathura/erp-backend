const joi = require('@hapi/joi');

const attribute_size = 50;

const attribute_add_validation = (data)=>{
    const schema = joi.object({
        attribute: joi.string().max(attribute_size).required()
    })

    return schema.validate(data);

}

module.exports.attribute_update_validation = (data)=>{
    const schema = joi.object({
        old:joi.object({
            attribute: joi.string().max(attribute_size).required()
        }).required(),
        new:joi.object({
            attribute: joi.string().max(attribute_size).required()
        }).required(),
    })
    return schema.validate(data);
}

module.exports.attribute_add_validation = attribute_add_validation;
