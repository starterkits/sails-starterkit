###
isAuthenticated

@module      :: Policy
@description :: Simple policy to allow any authenticated user
Assumes that your login action in one of your controllers sets `req.session.authenticated = true;`
@docs        :: http://sailsjs.org/#!documentation/policies
###

module.exports = (req, res, next) ->
  # Passport authentication
  return if req.isAuthenticated()
    next()
  else
    res.redirect('/login')

  # Sails default...
  #
  # User is allowed, proceed to the next policy,
  # or if this is the last policy, the controller
  # return next()  if req.session.authenticated
  #
  # User is not allowed
  # (default res.forbidden() behavior can be overridden in `config/403.js`)
  # res.forbidden 'You are not permitted to perform this action.'
