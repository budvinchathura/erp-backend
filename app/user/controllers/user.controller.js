var _user_model = require('../../models/models/user_model');
const { login_validation, register_validation } = require('../validation');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');




module.exports.login = (req, res) => {

    const { error } = login_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }


    var user_model = new _user_model();
    user_model.find_by_username(req.body.username)
        .then(async (user) => {
            if (user) {
                const password_match = await bcrypt.compare(req.body.password,user.password);
                if (password_match) {
                    // return res.status(200).send({ username: user.username });
                    const token = jwt.sign({username:user.username},process.env.TOKEN_SECRET);
                    return res.status(200).header('erp-auth-token',token).json();
                } else {
                    return res.status(400).json({error:'invalid password'});
                }

            } else {
                return res.status(400).json({error:'could not find username'});
            }
        }).catch((err) => {
            return res.status(500).json({error:err});
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
                    return res.status(500).json({error:err});
                })
            }
        })
        
        .catch((error) => {
            return res.status(500).json({error:error});
        })

    // .catch((error)=>{
    //     return res.status(500).send('server error');
    // })

}