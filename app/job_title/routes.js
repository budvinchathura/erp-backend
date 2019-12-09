const router = require('express').Router();
const job_title_controller = require('./controllers/job_title.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.post('/view', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],job_title_controller.view);

module.exports = router;