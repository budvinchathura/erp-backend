var _employee_model = require('../../models/models/employee_model');
var _detailed_leave_model = require('../../models/models/detailed_leave_model');

const { clean_object } = require("../../helpers/h");
const { subordinate_leaves_view_validation } = require("../validation");

module.exports.subordinates = (req, res) => {
    var employee_model = new _employee_model();
    employee_model.find_subordinates(req.user.employee_id)
        .then((emps) => {
            if (emps) {
                for (let index = 0; index < emps.length; index++) {
                    emps[index] = clean_object(emps[index]);

                }
                res.status(200).json(emps);
            } else {
                res.status(200).json([]);
            }
        })
        .catch((error) => {
            return res.status(500).json({ error: error.message });
        })
}


module.exports.subordinate_leaves = (req, res) => {
    const { error } = subordinate_leaves_view_validation(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } else {
        var detailed_leave_model = new _detailed_leave_model();
        detailed_leave_model.find_by_supervisor_id(req.user.employee_id,req.body.state)
            .then((leaves) => {
                if (leaves) {
                    for (let index = 0; index < leaves.length; index++) {
                        leaves[index] = clean_object(leaves[index]);

                    }
                    res.status(200).json(leaves);
                } else {
                    res.status(200).json([]);
                }
            })
            .catch((error) => {
                return res.status(500).json({ error: error.message });
            })
    }
}




