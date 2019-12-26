const router = require('express').Router();
const supervisor_controller = require('./controllers/supervisor.controller');
const {valid_jwt_needed} = require('../common/middleware/validation');
const {minimum_access_level_required} = require('../common/middleware/access_level');

router.get('/subs', [valid_jwt_needed,minimum_access_level_required(['L1','L2','L3'])],supervisor_controller.subordinates);



module.exports = router;