# 10hackschat
### a Sails application

```
sails new 10hacks --template=jade
npm install then-jade --save-dev
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



