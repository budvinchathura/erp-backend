const joi = require('@hapi/joi');

const key_size = 50;
const value_size = 50;

module.exports.organization_info_insert_validation = (data)=>{
    const schema = joi.object({
        key: joi.string().max(key_size).required(),
        value: joi.string().max(value_size).required(),
    })
    return schema.validate(data);
}

module.exports.organization_info_bulk_insert_validation = (data)=>{
    const schema = joi.object({
        data: joi.array().items(joi.object({
            key: joi.string().max(key_size).required(),
            value: joi.string().max(value_size).required(),
        })
        ).required()
    })
    return schema.validate(data);
}

module.exports.organization_info_update_validation = (data)=>{
    const schema = joi.object({
        key: joi.string().max(key_size).required(),
        value: joi.string().max(value_size).required(),
    })
    return schema.validate(data);
}

module.exports.organization_info_delete_validation = (data)=>{
    const schema = joi.object({
        key: joi.string().max(key_size).required(),
    })
    return schema.validate(data);
}
