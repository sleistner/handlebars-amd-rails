define('partial', {
    load: function (resourceName, parentRequire, callback, config) {
        parentRequire(["handlebars", "templates/" + resourceName], function (Handlebars, resource) {
            parentRequire.isBrowser && Handlebars.registerPartial(resourceName, resource);
            callback(resource);
        });
    }
});
