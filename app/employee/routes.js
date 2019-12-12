const router = require('express').Router();
const employee_controller = require('./controllers/employee.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');
router.post('/view',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.search_other_by_id]);
router.post('/profile',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.search_self]);
router.post('/leave', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])], employee_controller.view_employee_leave);

module.exports = router