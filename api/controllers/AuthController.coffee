passport = require("passport")

AuthController =
  login: (req, res) ->
    res.view()

  process: (req, res) ->
    passport.authenticate("local", (err, user, info) ->
      if err or not user
        res.redirect "/login"
        return
      req.logIn user, (err) ->
        if err
          res.redirect "/login"
          return
        res.redirect "/"
        return

    ) req, res

  logout: (req, res) ->
    req.logout()
    res.redirect "/"

module.exports = AuthController
