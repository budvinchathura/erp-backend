const router = require('express').Router();
const employee_controller = require('./controllers/employee.controller');
const {valid_jwt_needed,before_update_employee} = require('../common/middleware/validation');
const {minimum_access_level_required,has_authority} = require('../common/middleware/access_level');
router.post('/view',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.search_by_id]);

//TODO change access levels
//TODO refactor request types
//TODO validate requests
router.post('/add',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.add]);
router.delete('/delete',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.delete]);
//TODO only allow admin to use this
router.post('/hr',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.insert_hr]);
router.get('/hr', [valid_jwt_needed,minimum_access_level_required(['Admin','L3','L1'])], employee_controller.view_hr);

//TODO allow L2,L3
router.patch('/basic',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.update_basic_details]);
router.post('/contact',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.insert_contact_details]);
router.patch('/contact',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.update_contact_details]);
router.delete('/contact',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.delete_contact_details]);
router.post('/email',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.insert_emails]);
router.patch('/email',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.update_email]);
router.delete('/email',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.delete_email]);
router.post('/dependent',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.insert_dependent]);
router.patch('/dependent',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.update_dependent]);
router.delete('/dependent',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.delete_dependent]);
router.post('/emergency',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.insert_emergency_contact]);
router.patch('/emergency',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.update_emergency_contact]);
router.delete('/emergency',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.delete_emergency_contact]);
router.post('/custom',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.insert_custom_attributes]);
router.patch('/custom',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),before_update_employee,has_authority,employee_controller.update_custom_attribute]);

router.get('/profile',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.profile]);
router.get('/form-attributes', [valid_jwt_needed,minimum_access_level_required(['Admin','L3','L1'])], employee_controller.form_attributes);

module.exports = router