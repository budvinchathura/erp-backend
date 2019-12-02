const router = require('express').Router();
const user_controller = require('./controllers/user.controller')
router.post('/login',user_controller.login);
router.post('/register',user_controller.register);

module.exports = router