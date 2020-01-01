const router = require('express').Router();
const user_controller = require('./controllers/user.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');


router.post('/login',user_controller.login);
router.post('/register',[valid_jwt_needed,minimum_access_level_required(['L3','Admin'])],user_controller.register);
router.post('/password-reset',[valid_jwt_needed,minimum_access_level_required(['L3','Admin'])],user_controller.password_reset);
router.post('/register-admin',user_controller.admin_register);
router.post('/login-admin',user_controller.admin_login);

module.exports = router