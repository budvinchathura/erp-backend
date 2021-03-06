const joi = require('@hapi/joi');

const job_title_size = 50;

const job_title_add_update_validation = (data)=>{
    const schema = joi.object({
        job_title: joi.string().max(job_title_size).required(),
        access_level:joi.string().required().valid('L1','L2','L3','Admin')
    })

    return schema.validate(data);

}

module.exports.job_title_update_validation = (data)=>{
    const schema = joi.object({
        old:joi.object({
            job_title: joi.string().max(job_title_size).required(),
            access_level:joi.string().required().valid('L1','L2','L3','Admin')
        }).required(),
        new:joi.object({
            job_title: joi.string().max(job_title_size).required(),
            access_level:joi.string().required().valid('L1','L2','L3','Admin')
        }).required(),
    })
    return schema.validate(data);

}



module.exports.job_title_add_update_validation = job_title_add_update_validation;
