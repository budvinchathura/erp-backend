module.exports.clean_object = function(obj){
    delete obj.table;
    delete obj.attrs;
    delete obj.constructor

    return obj;
}