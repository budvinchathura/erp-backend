const router = require('express').Router();
const custom_attribute_controller = require('./controllers/custom_attributes.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/view', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],custom_attribute_controller.view);
router.post('/add', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],custom_attribute_controller.add);

module.exports = router;