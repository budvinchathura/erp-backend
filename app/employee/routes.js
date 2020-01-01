const router = require('express').Router();
const employee_controller = require('./controllers/employee.controller');
const {valid_jwt_needed,before_update_employee} = require('../common/middleware/validation');
const {minimum_access_level_required,has_authority} = require('../common/middleware/access_level');

//admin 
router.get('/hr', [valid_jwt_needed,minimum_access_level_required(['Admin'])], employee_controller.view_hr);
router.post('/hr',[valid_jwt_needed,minimum_access_level_required(['Admin']),employee_controller.insert_hr]);
router.patch('/hr',[valid_jwt_needed,minimum_access_level_required(['Admin']),employee_controller.promote_to_hr]);

//L3
router.post('/add',[valid_jwt_needed,minimum_access_level_required(['L3']),employee_controller.add]);
router.delete('/delete',[valid_jwt_needed,minimum_access_level_required(['L3']),employee_controller.delete]);
router.post('/activate',[valid_jwt_needed,minimum_access_level_required(['L3']),employee_controller.activate]);

//L2,L3
router.patch('/basic',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.update_basic_details]);
router.post('/contact',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.insert_contact_details]);
router.patch('/contact',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.update_contact_details]);
router.delete('/contact',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.delete_contact_details]);
router.post('/email',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.insert_emails]);
router.patch('/email',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.update_email]);
router.delete('/email',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.delete_email]);
router.post('/dependent',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.insert_dependent]);
router.patch('/dependent',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.update_dependent]);
router.delete('/dependent',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.delete_dependent]);
router.post('/emergency',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.insert_emergency_contact]);
router.patch('/emergency',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.update_emergency_contact]);
router.delete('/emergency',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.delete_emergency_contact]);
router.post('/custom',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.insert_custom_attributes]);
router.patch('/custom',[valid_jwt_needed,minimum_access_level_required(['L2','L3']),before_update_employee,has_authority,employee_controller.update_custom_attribute]);

//L2,L3,Admin
router.post('/view',[valid_jwt_needed,minimum_access_level_required(['L2','L3','Admin']),employee_controller.search_by_id]);
router.get('/form-attributes', [valid_jwt_needed,minimum_access_level_required(['L2','L3','Admin'])], employee_controller.form_attributes);



//L1,L2,L3,Admin
router.get('/profile',[valid_jwt_needed,minimum_access_level_required(['L1','L2','L3']),employee_controller.profile]);

module.exports = router