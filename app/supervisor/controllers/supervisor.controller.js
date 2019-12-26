var _employee_model = require('../../models/models/employee_model');

const { clean_object } = require("../../helpers/h");
const {} = require("../validation");

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


