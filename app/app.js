var express = require('express');
const error_route = require('./error/routes')
const user_route = require('./user/routes');
const organization_info_route = require('./organization_info/routes');

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
app.use('/organization_info', organization_info_route);

app.use(error_route);

module.exports = app;

