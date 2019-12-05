var _job_title_model = require('../../models/models/job_title_model');
const { clean_object } = require("../../helpers/h");



module.exports.view = (req, res) => {
    var job_title_model = new _job_title_model();
    job_title_model._find_all()
        .then((job_titles) => {
            if(job_titles){
                for (let index = 0; index < job_titles.length; index++) {
                    job_titles[index] = clean_object(job_titles[index])
                    
                }
                res.status(200).json(job_titles);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}