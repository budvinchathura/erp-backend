var express = require('express');
const error_route = require('./error/routes')
const user_route = require('./user/routes');
const organization_info_route = require('./organization_info/routes');
const report_route = require('./report/routes');

const employee_route = require('./employee/routes');
const job_title_route = require('./job_title/routes');
const pay_grade_route = require('./pay_grade/routes');
const employment_status_route = require('./employment_status/routes');
const department_route = require('./department/routes');
const leave_route = require('./leave/routes');
const custom_attribute_route = require('./custom_attributes/routes');
const supervisor_route = require('./supervisor/routes');
var cors = require('cors')

var app = express();

// app.use('/',()=>{});
app.use(cors());

app.use((req, res, next) => {
   
    res.header("Access-Control-Expose-Headers", "erp-auth-token");
    
    next();
});

app.use(express.json());

app.use('/user',user_route);
app.use('/organization-info', organization_info_route);
app.use('/report',report_route);

app.use('/employee',employee_route);
app.use('/job-title',job_title_route);
app.use('/pay-grade',pay_grade_route);
app.use('/employment-status',employment_status_route);
app.use('/department',department_route);
app.use('/leave',leave_route);
app.use('/custom',custom_attribute_route);
app.use('/supervisor',supervisor_route);
app.use(error_route);

module.exports = app;

