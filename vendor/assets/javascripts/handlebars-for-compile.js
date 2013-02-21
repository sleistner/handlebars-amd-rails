/*global Handlebars:true */
/*jshint strict:false, expr:true */

Handlebars.compileAmd = function (input, options) {
    options || (options = {});

    function interpolate(handlebarPath, template) {
        return 'define([\'' + handlebarPath + 'handlebars\'], function(Handlebars) {\n  return ' + template + ';\n});';
    }

    return interpolate(
        options.handlebarsPath || '',
        Handlebars.precompile(input)
    );
};
