express = require 'express'
exphbs  = require 'express-handlebars'

app = express()
all_names = ['world']

app.engine 'handlebars', exphbs defaultLayout: 'main'
app.set 'view engine', "handlebars"

app.get '/', (request, response) ->
  response.render 'home'

app.get '/getname', (request, response) ->
  name = request.query.name
  all_names.push name.toString()
  response.render 'names',
    name: capitalize name
    all_names: all_names

app.get '/allnames', (request, response) ->
  title = "All Names Ever"
  response.render "names", {'names': all_names, 'title': title}

app.listen 8888

capitalize = (word) ->
  word = word[0].toUpperCase() + word[1..].toLowerCase()

console.log 'Server running on localhost:8888'
