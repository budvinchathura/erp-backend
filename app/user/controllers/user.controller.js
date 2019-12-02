var _user_model = require('../../models/models/user_model');
const { login_validation, register_validation } = require('../validation');
const jwt = require('jsonwebtoken');




module.exports.login = (req, res) => {

    const { error } = login_validation(req.body);

    if (error) {
        return res.status(400).send(error.details[0].message);
    }


    var user_model = new _user_model();
    user_model.find_by_username(req.body.username)
        .then((user) => {
            if (user) {
                const passwordMatch = (req.body.password === user.password);
                if (passwordMatch) {
                    // return res.status(200).send({ username: user.username });
                    const token = jwt.sign({username:user.username},process.env.TOKEN_SECRET);
                    return res.header('erp-auth-token',token).send();
                } else {
                    return res.status(400).send('invalid password');
                }

            } else {
                return res.status(400).send('could not find username');
            }
        }).catch((err) => {
            return res.status(500).send('server error');
        });
}

module.exports.register = (req, res) => {
    const { error } = register_validation(req.body);
    if (error) {
        return res.status(400).send(error.details[0].message);
    }

    var user_model = new _user_model();
    user_model.find_by_username_or_emp_id(req.body.username, req.body.emp_id)
        .then((result) => {
            if (result) {
                return res.status(400).send('duplicate entry');
            } else {
                var user_model = new _user_model(req.body);

                user_model.insert()
                .then((result) => {
                    if (result) {
                        res.status(200).send({ username: user_model.username });
                    }
                })
            }
        })
        .then(()=>{
            
        })
        .catch((error) => {
            return res.status(500).send('server error');
        })

    // .catch((error)=>{
    //     return res.status(500).send('server error');
    // })

}