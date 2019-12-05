var express = require('express');
const error_route = require('./error/routes')
const user_route = require('./user/routes');
const organization_info_route = require('./organization_info/routes');

const employee_route = require('./employee/routes');
const job_title_route = require('./job_title/routes');
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

app.use('/employee',employee_route);
app.use('/job-title',job_title_route);
app.use(error_route);

module.exports = app;

