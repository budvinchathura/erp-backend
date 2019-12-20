const joi = require('@hapi/joi');

const attribute_add_validation = (data)=>{
    const schema = joi.object({
        attribute: joi.string().required()
    })

    return schema.validate(data);

}

module.exports.attribute_add_validation = attribute_add_validation;
