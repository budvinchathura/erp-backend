const router = require('express').Router();
const department_controller = require('./controllers/department.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/view', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],department_controller.view);
router.post('/add', [valid_jwt_needed,minimum_access_level_required(['L3'])],department_controller.add);
router.patch('/add', [valid_jwt_needed,minimum_access_level_required(['L3'])],department_controller.update);

module.exports = router;