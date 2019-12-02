var express = require('express');
const error_route = require('./error/routes')
const user_route = require('./user/routes');

var app = express();

// app.use('/',()=>{});
app.use(express.json());

app.use('/user',user_route);
app.use(error_route);

module.exports = app;

//ggjgjgjgjgj