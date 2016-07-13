express = require 'express'
bodyParser = require 'body-parser'
_ = require 'lodash'

exphbs  = require 'express-handlebars'
session = require 'express-session'

nameGame = require "./name_games"
processNames = require "./process_names"
auth = require "./auth"

app = express()

app.engine 'handlebars', exphbs defaultLayout: 'main'

app.set 'view engine', "handlebars"

app.use bodyParser.urlencoded {extended: true}

app.use session(
  resave: true
  saveUninitialized: true
  secret: 'SOMERANDOMSECRETHERE'
  cookie: maxAge: 60000
  httpOnly: false)

app.get '/', (req, res) ->
  console.log req.session.user
  res.render 'home'


#Login endpoints
app.get '/login', (req, res) ->
  res.render 'login'

app.post "/login", (req, res) ->
  console.log 'post route req.body is'
  console.log req.body
  if req.body.username is "claire" and req.body.password is "password"
    req.session.user = "claire"
    res.redirect '/'
  else
    res.redirect 'login'
  console.log 'post route session is'
  console.log req.session.user



app.get '/getname', (req, res) ->
  name = nameGame.clean req.query.name
  all_names = processNames.process name
  renderView req, res, 'names',
    name: name
    all_names: processNames.get_all_names()

app.get '/changename', (req, res) ->
  name = nameGame.piggy req.query.name
  all_names = processNames.process name
  renderView req, res, 'names',
    name: name
    all_names: processNames.get_all_names()

app.get '/allnames', auth.auth, (req, res) ->
  console.log 'all names route req.session is'
  console.log req.session.user
  if not name
    name = "World"
  name = name
  console.log processNames.get_all_names()
  renderView req, res, 'names',
    name: name
    all_names: processNames.get_all_names()

app.delete '/deletename', (req, res) ->
  input = req.query.name
  console.log req
  processNames.delete input
  renderView req, res, 'names',
    name: "World"
    all_names: processNames.get_all_names()

renderView = (req, res, viewName, viewData) ->
  data = {
    user: req.session?.user,
  }
  _.assignIn data, viewData
  res.render viewName, data

app.listen 8888

console.log 'Server running on localhost:8888'
