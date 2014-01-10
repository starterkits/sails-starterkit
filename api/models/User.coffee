bcrypt = require('bcrypt');

module.exports =
  attributes:
    username:
      type: "string"
      required: true
      unique: true

    password:
      type: "string"
      required: true

    toJSON: ->
      obj = this.toObject()
      delete obj.password
      obj

    beforeCreate: (user, cb) ->
      bcrypt.genSalt 10, (err, salt) ->
        bcrypt.hash user.password, salt, (err, hash) ->
          if err
            console.log err
            cb(err)
          else
            user.password = hash
            cb(null, user)

