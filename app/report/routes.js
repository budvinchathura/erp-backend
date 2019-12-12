const router = require('express').Router();
const report_controller = require('./controllers/report.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');


module.exports = router;