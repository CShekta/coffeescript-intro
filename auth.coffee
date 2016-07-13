module.exports.auth = (req, res, next) ->
  console.log 'the session user is from auth is'
  console.log req.session.user
  if req.session.user isnt "claire"
    res.redirect 'login'
  else
    return next()
