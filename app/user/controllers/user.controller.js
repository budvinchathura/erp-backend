var _user_model = require('../../models/models/user_model');
var _admin_model = require('../../models/models/admin_model');
var _user_access_model = require('../../models/models/user_access_model');
const { clean_object } = require("../../helpers/h");

const { login_validation, register_validation,admin_register_validation,password_reset_validation } = require('../validation');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');



module.exports.login = (req, res) => {

    const { error } = login_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var user_access_model = new _user_access_model();
    user_access_model.find_by_username(req.body.username)
        .then(async (user) => {
            if (user) {
                const password_match = await bcrypt.compare(req.body.password,user.password);
                if (password_match) {
                    // return res.status(200).send({ username: user.username });
                    user = clean_object(user);
                    
                    delete user.password;
                    user = Object.assign({},user);
                    const token = jwt.sign(user,process.env.TOKEN_SECRET);
                    return res.status(200).header('erp-auth-token',token).json({access_level:user.access_level});
                } else {
                    return res.status(400).json({error:'invalid password'});
                }

            } else {
                return res.status(400).json({error:'could not find username'});
            }
        }).catch((err) => {
            return res.status(500).json({error:err.message});
        });
}

module.exports.register = (req, res) => {
    const { error } = register_validation(req.body);
    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var user_model = new _user_model();
    user_model.find_by_username_or_employee_id(req.body.username, req.body.employee_id)
        .then(async (result) => {
            if (result) {
                return res.status(400).json({error:'duplicate entry'});
            } else {
                const salt = await bcrypt.genSalt(10);
                const hashed_password = await bcrypt.hash(req.body.password, salt);
                req.body.password = hashed_password;
                var user_model = new _user_model(req.body);

                user_model.insert()
                .then((result) => {
                    if (result) {
                        res.status(200).json({ username: user_model.username });
                    }
                })
                .catch((err)=>{
                    return res.status(500).json({error:err.message});
                })
            }
        })
        
        .catch((error) => {
            return res.status(500).json({error:error.message});
        })

    // .catch((error)=>{
    //     return res.status(500).send('server error');
    // })
}




module.exports.admin_login = (req, res) => {

    const { error } = login_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var admin_model = new _admin_model();
    admin_model.find_by_username(req.body.username)
        .then(async (user) => {
            if (user) {
                const password_match = await bcrypt.compare(req.body.password,user.password);
                if (password_match) {
                    // return res.status(200).send({ username: user.username });
                    user = clean_object(user);
                    
                    delete user.password;
                    delete user.email;
                    user = Object.assign({},user);
                    const token = jwt.sign(user,process.env.TOKEN_SECRET);
                    return res.status(200).header('erp-auth-token',token).json({access_level:user.access_level});
                } else {
                    return res.status(400).json({error:'invalid password'});
                }

            } else {
                return res.status(400).json({error:'could not find username'});
            }
        }).catch((err) => {
            return res.status(500).json({error:message});
        });
}



module.exports.admin_register = (req, res) => {
    const { error } = admin_register_validation(req.body);
    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }
    if(req.body.secret !== process.env.ADMIN_REGISTER_SECRET){
        return res.status(400).json({error:"Invalid secret"});
    }

    var admin_model = new _admin_model();
    admin_model.find_by_username(req.body.username)
        .then(async (result) => {
            if (result) {
                return res.status(400).json({error:'duplicate entry'});
            } else {
                const salt = await bcrypt.genSalt(10);
                const hashed_password = await bcrypt.hash(req.body.password, salt);
                req.body.password = hashed_password;
                var admin_model = new _admin_model(req.body);
                admin_model.access_level = "Admin";

                admin_model.insert()
                .then((result) => {
                    if (result) {
                        res.status(200).json({ username: admin_model.username });
                    }
                })
                .catch((err)=>{
                    return res.status(500).json({error:err.message});
                })
            }
        })
        
        .catch((error) => {
            return res.status(500).json({error:error.message});
        })

    // .catch((error)=>{
    //     return res.status(500).send('server error');
    // })
}

module.exports.password_reset = async (req, res) => {
    const { error } = password_reset_validation(req.body);
    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var user_model = new _user_model();
    
    const salt = await bcrypt.genSalt(10);
    const hashed_password = await bcrypt.hash(req.body.password, salt);
    req.body.password = hashed_password;
    var user_model = new _user_model(req.body);

    user_model._update()
    .then((result) => {
        if (result) {
            res.status(200).json({ username: user_model.username });
        }
    })
    .catch((err)=>{
        return res.status(500).json({error:err.message});
    })

        
        

}

