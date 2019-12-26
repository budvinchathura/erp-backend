const router = require('express').Router();
const report_controller = require('./controllers/report.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/emp-by-dept', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],report_controller.emp_by_department);



module.exports = router;