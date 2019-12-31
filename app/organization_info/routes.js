const router = require('express').Router();
const organization_info_controller = require('./controllers/organization_info.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/', organization_info_controller.view);
router.post('/', [valid_jwt_needed,minimum_access_level_required(['L3'])], organization_info_controller.insert);
router.post('/bulk-insert', [valid_jwt_needed,minimum_access_level_required(['L3'])], organization_info_controller.bulk_insert);
router.delete('/', [valid_jwt_needed,minimum_access_level_required(['L3'])], organization_info_controller.delete);
router.patch('/', [valid_jwt_needed,minimum_access_level_required(['L3'])], organization_info_controller.update);

module.exports = router;