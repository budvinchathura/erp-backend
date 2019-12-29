var _job_title_model = require('../../models/models/job_title_model');
var _employee_model = require('../../models/models/employee_model');

const { is_higher_access_level } = require("../../helpers/h");


module.exports.minimum_access_level_required = (required_access_levels) => {
    return (req, res, next) => {
        let access_level = req.user.access_level;
        if (required_access_levels.includes(access_level)) {
            return next();
        } else {
            return res.status(403).json({error:'Higher Access Level required'});
        }
    };
};

module.exports.has_authority = (req, res, next) => {
    var employee_model = new _employee_model();
    employee_model.find_by_id(req.body.new.employee_id)
    .then((employee) => {
        if (employee) {
            return employee;
        } else {
            return res.status(400).json({ error: 'could not find employee to edit' });
        }
    })
    .then(async (employee) => {
        var job_title_model = new _job_title_model();
        var job_title = await job_title_model.find_by_job_title(employee.job_title);
        if(is_higher_access_level(req.user.access_level, job_title.access_level)){
            return next();
        } else {
            return res.status(403).json({error:'cannot edit details of higher Access Level employees'});
        }
    })
    .catch((err) => {
        return res.status(500).json({ error: err.message });
    });
}