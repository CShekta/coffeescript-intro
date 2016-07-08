express = require 'express'
exphbs  = require 'express-handlebars'

app = express()
all_names = {'world': 1}

app.engine 'handlebars', exphbs defaultLayout: 'main'
app.set 'view engine', "handlebars"

app.get '/', (request, response) ->
  response.render 'home'

app.get '/getname', (request, response) ->
  name = capitalize request.query.name
  if !all_names[name]?
    all_names[name] = 1
  else
    all_names[name] += 1
  response.render 'names',
    name: name
    all_names: all_names

app.get '/allnames', (request, response) ->
  name = name
  title = "All Names Ever"
  response.render "names",
    all_names: all_names
    name: name

app.listen 8888

capitalize = (word) ->
  word = word[0].toUpperCase() + word[1..].toLowerCase()

console.log 'Server running on localhost:8888'
