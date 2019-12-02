const router = require('express').Router();
const error_controller = require('./controllers/error.controller')
router.get('/',error_controller.index)

module.exports = router