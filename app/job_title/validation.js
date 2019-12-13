const joi = require('@hapi/joi');

const job_title_add_validation = (data)=>{
    const schema = joi.object({
        job_title: joi.string().required(),
        access_level:joi.string().required().valid('L1','L2','L3','Admin')
    })

    return schema.validate(data);

}



module.exports.job_title_add_validation = job_title_add_validation;
