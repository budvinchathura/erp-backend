var _organization_info_model = require('../../models/models/organization_info_model');

module.exports.view = (req, res) => {
    var organization_info_model = new _organization_info_model();
    organization_info_model._find_all()
        .then((result) => {
            if(result){
                result.forEach(element => {
                    delete element.table;
                    delete element.attrs;
                });
                res.status(200).json(result);
            } else { 
                res.status(200).json([]);
            }   
        })
        .catch((err) => {
            return res.status(500).json({error:err.message});
        })
}


module.exports.insert = (req, res) => {
    var organization_info_model = new _organization_info_model(req.body);
    organization_info_model.insert()
        .then((result) => {
            if (result) {
                res.status(200).json(result);
            }
        })
        .catch((err) => {
            res.status(500).json({ error: err.message });
        })
}
    
