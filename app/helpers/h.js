module.exports.clean_object = function(obj){
    delete obj.table;
    delete obj.procedure
    delete obj.attrs;
    delete obj.constructor

    return obj;
}

module.exports.fix_date = function(inp_date){
    var new_date = new Date(inp_date).toLocaleDateString('en-US', {
        timeZone: 'Asia/Calcutta',
        year:'numeric',
        month:'2-digit',
        day:'2-digit'
    });
    return "".concat(new_date.slice(6,10),"-",new_date.slice(0,2),"-",new_date.slice(3,5));
}

module.exports.is_higher_access_level = function(comparee, comparer){
    switch(comparee){
        case "L2" : 
            if(comparer == "L1") return true;
            break;
        case "L3" :
            if(comparer == "L3" | comparer == "L2" | comparer == "L1") return true;
    }
    return false; 
}

module.exports.get_unique_id = function () {
    const hex_time = Date.now().toString(16).toUpperCase();
    const random = Math.ceil(Math.random()*1000).toString(16).toUpperCase();
    return hex_time.concat(random);
}