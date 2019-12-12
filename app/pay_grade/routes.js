const router = require('express').Router();
const pay_grade_controller = require('./controllers/pay_grade.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/view', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],pay_grade_controller.view);

module.exports = router;