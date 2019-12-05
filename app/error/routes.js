const router = require('express').Router();
const error_controller = require('./controllers/error.controller')
router.use('/',error_controller.index)

module.exports = router