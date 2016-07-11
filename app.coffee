express = require 'express'
exphbs  = require 'express-handlebars'

nameGame = require "./name_games"
processNames = require "./process_names"


app = express()

app.engine 'handlebars', exphbs defaultLayout: 'main'

app.set 'view engine', "handlebars"

app.get '/', (request, response) ->
  response.render 'home'

app.get '/getname', (request, response) ->
  input = nameGame.clean request.query.name

  all_names = processNames.process input

  response.render 'names',
    name: input
    all_names: all_names

app.get '/changename', (request, response) ->
  input = nameGame.piggy request.query.name

  all_names = processNames.process input

  response.render 'names',
    name: input
    all_names: all_names

app.get '/allnames', (request, response) ->
  if not name
    name = "World"

  name = name
  console.log processNames.get_all_names
  response.render "names",
    all_names: processNames.get_all_names
    name: name

app.listen 8888

console.log 'Server running on localhost:8888'
