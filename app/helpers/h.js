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