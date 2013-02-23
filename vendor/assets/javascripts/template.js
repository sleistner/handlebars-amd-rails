define('template', {
    load: function (resourceName, parentRequire, callback, config) {
        parentRequire(["templates/" + resourceName], function (resource) {
            callback(resource);
        });
    }
});
