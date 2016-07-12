express = require 'express'
bodyParser = require 'body-parser'

exphbs  = require 'express-handlebars'

nameGame = require "./name_games"
processNames = require "./process_names"

app = express()

app.engine 'handlebars', exphbs defaultLayout: 'main'

app.set 'view engine', "handlebars"

app.use bodyParser.urlencoded {extended: true}

app.get '/', (req, res) ->
  res.render 'home'

app.get '/getname', (req, res) ->
  input = nameGame.clean req.query.name
  all_names = processNames.process input
  res.render 'names',
    name: input
    all_names: all_names

app.get '/changename', (req, res) ->
  input = nameGame.piggy req.query.name
  all_names = processNames.process input
  res.render 'names',
    name: input
    all_names: all_names

app.get '/allnames', (req, res) ->
  if not name
    name = "World"
  name = name
  console.log processNames.get_all_names
  res.render "names",
    all_names: processNames.get_all_names
    name: name

app.delete '/deletename', (req, res) ->
  input = req.query.name
  console.log req
  processNames.delete input
  reponse.render 'names',
    name: "World"
    all_names: processNames.get_all_names

app.listen 8888

console.log 'Server running on localhost:8888'
