
#helper functions
findById = (id, fn) ->
  User.findOne(id).done (err, user) ->
    if err
      fn null, null
    else
      fn null, user

findByUsername = (u, fn) ->
  User.findOne(username: u).done (err, user) ->

    # Error handling
    if err
      fn null, null

    # The User was found successfully!
    else
      fn null, user

passport = require("passport")
LocalStrategy = require("passport-local").Strategy
bcrypt = require("bcrypt")

# Passport session setup.
# To support persistent login sessions, Passport needs to be able to
# serialize users into and deserialize users out of the session. Typically,
# this will be as simple as storing the user ID when serializing, and finding
# the user by ID when deserializing.
passport.serializeUser (user, done) ->
  done null, user.id

passport.deserializeUser (id, done) ->
  findById id, (err, user) ->
    done err, user



# Use the LocalStrategy within Passport.
# Strategies in passport require a `verify` function, which accept
# credentials (in this case, a username and password), and invoke a callback
# with a user object.
passport.use new LocalStrategy((username, password, done) ->
  # asynchronous verification, for effect...
  process.nextTick ->

    # Find the user by username. If there is no user with the given
    # username, or the password is not correct, set the user to `false` to
    # indicate failure and set a flash message. Otherwise, return the
    # authenticated `user`.
    findByUsername username, (err, user) ->
      return done(null, err)  if err
      unless user
        return done(null, false,
          message: "Unknown user " + username
        )
      bcrypt.compare password, user.password, (err, res) ->
        unless res
          return done(null, false,
            message: "Invalid Password"
          )
        returnUser =
          username: user.username
          createdAt: user.createdAt
          id: user.id

        done null, returnUser,
          message: "Logged In Successfully"

)
