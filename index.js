const dotenv = require('dotenv');
dotenv.config();
const app = require('./app/app');

app.listen(8888,()=>{console.log('server running on port 8888')});