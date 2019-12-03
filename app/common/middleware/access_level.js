exports.minimum_access_level_required = (required_access_levels) => {
    return (req, res, next) => {
        let access_level = req.user.access_level;
        if (required_access_levels.includes(access_level)) {
            return next();
        } else {
            return res.status(403).json({error:'Higher Access Level required'});
        }
    };
};