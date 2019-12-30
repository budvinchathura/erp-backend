const jwt = require('jsonwebtoken');
const joi = require('@hapi/joi');

module.exports.valid_jwt_needed = function (req, res, next) {
    const token = req.header('erp-auth-token');
    if (!token) {
        return res.status(401).send('Access Denied. Valid JWT needed');
    }
    try {
        const verified = jwt.verify(token, process.env.TOKEN_SECRET);
        req.user = verified;
        next();
    } catch (error) {
        res.status(400).send('Invalid Token');
    }
}

module.exports.before_update_employee = function(req, res, next){
    const schema = joi.object({
        new:joi.object({
            employee_id: joi.string().max(20).required(),
         }).unknown(true).required(),
    }).unknown(true)
    const { error } = schema.validate(req.body);
    if (error) {
        return res.status(400).json({error:error.details[0].message});
    } else {
        next();
    }
}

module.exports.before_update_employee_custom = function(req, res, next){
    const schema = joi.object({
        attributes:joi.array().items(joi.object({
            employee_id: joi.string().max(20).required(),
         }).unknown(true).required()).required(),
    })
    const { error } = schema.validate(req.body);
    if (error) {
        return res.status(400).json({error:error.details[0].message});
    } else {
        next();
    }
}

