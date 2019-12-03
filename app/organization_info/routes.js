const router = require('express').Router();
const organization_info_controller = require('./controllers/organization_info.controller');

router.post('/view', organization_info_controller.view);

module.exports = router;