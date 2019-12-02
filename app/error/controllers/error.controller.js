const db = require('../../db/db')


exports.index = (req,res)=>{
    res.status(404).send('This is default error page');
    const cond = {
        // columns:['id','course_id','grade'],
        conditions:['`year` = 2010']
    }
    // db.find(['takes'],cond,(er,res,f)=>{console.log(res);});

    const data = {
        
        dept_id:'55',
        contact_no:'0-09'
        // other:'pop'
    }
    // db.insert('employee',data,(er,res,f)=>{console.log(res);});
    const params = {
        conditions:["`name` = 'abc'"]
    }
    db.update('employee',params,data,(er,res,f)=>{console.log(res);});
}