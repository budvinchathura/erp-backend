module.exports.clean_object = function(obj){
    delete obj.table;
    delete obj.procedure
    delete obj.attrs;
    delete obj.constructor

    return obj;
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