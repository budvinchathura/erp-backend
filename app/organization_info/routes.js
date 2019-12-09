const router = require('express').Router();
const organization_info_controller = require('./controllers/organization_info.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.post('/view', organization_info_controller.view);
router.post('/insert', [valid_jwt_needed,minimum_access_level_required(['L3'])], organization_info_controller.insert);
router.post('/delete', [valid_jwt_needed,minimum_access_level_required(['L3'])], organization_info_controller.delete);

module.exports = router;