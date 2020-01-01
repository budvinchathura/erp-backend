const router = require('express').Router();
const leave_controller = require('./controllers/leave.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/limits', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],leave_controller.view_limits);
router.patch('/limit', [valid_jwt_needed,minimum_access_level_required(['L3'])],leave_controller.update_limit);
router.put('/limit', [valid_jwt_needed,minimum_access_level_required(['L3'])],leave_controller.add_limit);
router.get('/taken', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.taken);
router.post('/apply', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.apply_leave);
router.get('/my-types', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.my_leave_types);
router.get('/history', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.history);
router.get('/type', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], leave_controller.view_leave_types);
router.put('/type', [valid_jwt_needed,minimum_access_level_required(['L3'])], leave_controller.add_leave_type);
router.patch('/type', [valid_jwt_needed,minimum_access_level_required(['L3'])], leave_controller.update_leave_type);

module.exports = router;