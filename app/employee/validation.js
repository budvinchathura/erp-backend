const joi = require('@hapi/joi');



const employee_search_by_id_validation = (data)=>{
    const schema = joi.object({
        employee_id: joi.string().required(),
    })

    return schema.validate(data);

}



module.exports.employee_search_by_id_validation = employee_search_by_id_validation;
