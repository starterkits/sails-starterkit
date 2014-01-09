# Sails Starter Kit

Sails + CoffeeScript + Jade + Sass + Zurb Foundation

## Features

* Sails 0.9.8+
* Optimized Gruntfile for jade + sass + coffee
* Vendor directory for clean separation of app and vendor code
  * Modified Gruntfile to automatically compile and copy vendor files
* Automatic inclusion of js and template files
  * assets/templates/*
  * js/*.(js|coffee|)
* Manual inclusion of vendor files
  * vendor/*
  * Allows for better control over vendor bloat
* Manual inclusion of stylesheets via sass @import
  * assets/styles/app.scss
  * Allows for more intuitive development and control than automatic inclusion
* Automatic support for common client-side templates: jade, ejs, dust, etc.
  * Files in assets/templates are compiled and combined into jst.js
  * See [consolidate.js](https://github.com/visionmedia/consolidate.js/) for list of supported templates
* Automatic support for JS and CoffeeScript


### Build from Scratch

```bash
sails new 10hacks --template=jade
npm install then-jade --save-dev
npm install grunt-contrib-sass --save-dev
```

Bump versions in package.json then update.

```javascript
"dependencies": {
  "sails": "0.9.8",
  "grunt": "~0.4.2",
  "sails-disk": "~0.9.0",
  "optimist": "~0.6.0"
}
```

```bash
npm update
```

Create config/jade.js

```javascript
// config/jade.js
module.exports.config = function () {
  if (sails.config.environment === 'development') {
    // Pretty print output
    sails.express.app.locals.pretty = true;
  }
};
```

Load config/jade.js in config/bootstrap.js

```javascript
// Configure jade settings
require('./jade').config();
```


Add grunt-contrib-sass to Gruntfile.js

```javascript
// Gruntfile.js
// ...
grunt.loadTasks(depsPath + '/grunt-contrib-coffee/tasks');
grunt.loadNpmTasks('grunt-contrib-sass');
```
