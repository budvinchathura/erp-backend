const db = require('../../db/db')


exports.index = (req,res)=>{
    res.status(404).send('This is 404 error page');
    
}