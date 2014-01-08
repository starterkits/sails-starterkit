# 10hackschat
### a Sails application

```
sails new 10hacks --template=jade
npm install then-jade --save-dev
npm install grunt-contrib-sass --save-dev
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


