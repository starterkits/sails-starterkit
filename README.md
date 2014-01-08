# Sails Starter Kit

Sails + CoffeeScript + Jade + Sass + Zurb Foundation



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
