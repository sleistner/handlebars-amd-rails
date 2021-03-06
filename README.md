# Handlebars Amd Rails

Use Handlebars templates precompiled and wrapped in a AMD define block, with the asset pipeline in Rails 3.1+ applications.

[![Build Status](https://travis-ci.org/sleistner/handlebars-amd-rails.png?branch=master)](https://travis-ci.org/sleistner/handlebars-amd-rails)

## Installation

Add this line to your application's Gemfile:

```ruby
group :assets do
  gem 'handlebars-amd-rails'
end
```

Update your bundle:

```
$ bundle install
```

Require handlebars.js in your AMD config file

```javascript
{
    paths: {
        "handlebars": "handlebars-runtime"
    }
}
```

## Usage

Place individual Handlebars template file in their own file with template_name.{hbs, handlebars} extension.

```html
<!-- app/assets/javascripts/templates/shared/header.hbs -->

<header>
  A logo perhaps?
</header> 
```

```html
<!-- app/assets/javascripts/templates/demo/index.hbs -->

{{>shared/_header}}

<p class="welcome">
  Hello {{name}}! You have {{count}} new messages.
</p>
```

Which will be compiled and rendered as:

```javascript
define([
  "handlebars",
  "partial!shared/_header"
], function(Handlebars) {
  var templates = Handlebars.templates || (Handlebars.templates = {});
  return templates['demo/index'] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
    helpers = helpers || Handlebars.helpers; partials = partials || Handlebars.partials; data = data || {};
    var buffer = "";
	// …
    return buffer;
  });
});
```

You can take advantage of the asset pipeline by chaining your template through other processors like haml:

```haml
/ app/assets/javascripts/templates/demo/index.hbs.haml

%p.welcome
  Hello {{name}}! You have {{count}} new messages.
```

Which will be compiled and rendered as:

```javascript
define([
	"handlebars"
], function(Handlebars) {
    var templates = Handlebars.templates || (Handlebars.templates = {});
    return templates['demo/index'] = Handlebars.template(function (Handlebars,depth0,helpers,partials,data) {
        helpers = helpers || Handlebars.helpers; data = data || {};
        return "<p class='welcome'>Hello {{name}}! You have {{count}} new messages.</p>";
    });
});
```

You may need to require the haml_assets gem:

```ruby
group :assets do
  gem 'haml_assets'
end
```

Using templates:

```javascript
require([
    'jquery',
    'template!demo/index'
], function ($, template) {
    $('body').html(template({
        name: 'Joe', count: 10
    }))
});
```

## Sample Code

Find a demo application at [https://github.com/sleistner/handlebars-amd-rails-example](https://github.com/sleistner/handlebars-amd-rails-example)

## Config

Handlebars-amd-rails resolves the name of the template out of relative path of each template file. Relative path starts from app/assets/javascripts/templates/ by default.

If you want to change the default root path of template files, add following configuration into application.rb:

```ruby
# config/application.rb
module YourApp
  class Application < Rails::Application
    config.handlebars.template_root = 'app/assets/your_path_to_templates/'
  end
end
```

You can pass arbitrary option parameters to the handlebars compiler:

```ruby
# config/application.rb
module YourApp
  class Application < Rails::Application
    config.handlebars.data = false
  end
end
```

## Credits

I shamelessly borrowed code from the following sources:

* [https://github.com/thefron/dust-rails](https://github.com/thefron/dust-rails)
* [https://github.com/leshill/handlebars_assets](https://github.com/leshill/handlebars_assets)

Thanks guys!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
