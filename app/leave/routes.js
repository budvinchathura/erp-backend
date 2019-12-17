const router = require('express').Router();
const leave_controller = require('./controllers/leave.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/limits', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],leave_controller.view_limits);
router.patch('/limit', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],leave_controller.update_limit);
router.put('/limit', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],leave_controller.add_limit);
router.get('/remaining', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.remaining);
router.post('/apply', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.apply_leave);

module.exports = router;