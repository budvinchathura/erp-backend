var _organization_info_model = require('../../models/models/organization_info_model');
const { organization_info_insert_validation,
        organization_info_bulk_insert_validation,
        organization_info_delete_validation,
        organization_info_update_validation } = require('../validation');

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
    //expected input
    // {
    //     "key":"key1",
    //     "value": "value1"
    // }
    const { error } = organization_info_insert_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

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

module.exports.bulk_insert = (req, res) => {
    // {
    //     "data":[{
    //         "key":"key1",
    //         "value": "value1"
    //     },{
    //         "key":"key1",
    //         "value": "value1"
    //     }]
    // }
    const { error } = organization_info_bulk_insert_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var models = [];
    req.body.data.forEach(function(item, index){
        var organization_info_model = new _organization_info_model(item);
        models.push(organization_info_model);
    });
    new _organization_info_model().bulk_insert(models)
        .then((result) => {
            if(result){
                res.status(200).json(result);
            }
        })
        .catch((err) => {
            res.status(500).json({error : err.message});
        });
}

//TODO update (value only ?)
module.exports.update = (req,res) => {
    //expected input
    // {
    //     "key":"key1",
    //     "value": "value1"
    // }
    const { error } = organization_info_update_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var organization_info_model = new _organization_info_model(req.body);
    organization_info_model._update()
    .then((result) => {
        if (result) {
            res.status(200).json(result);
        }
    })
    .catch((err) => {
        res.status(500).json({error : err.message});
    })
}

module.exports.delete = (req, res) => {
    //expected input
    // {
    //     "key":"key1",
    // }
    const { error } = organization_info_delete_validation(req.body);

    if (error) {
        return res.status(400).json({error:error.details[0].message});
    }

    var organization_info_model = new _organization_info_model();
    organization_info_model._delete(req.body.key)
        .then((result) => {
            if (result) {
                res.status(200).json(result);
            }
        })
        .catch((err) => {
            res.status(500).json({error : err.message});
        })
}