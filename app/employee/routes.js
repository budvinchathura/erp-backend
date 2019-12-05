const router = require('express').Router();
const employee_controller = require('./controllers/employee.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');
router.post('/by-id',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.search_by_id]);

module.exports = router