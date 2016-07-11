capitalize = (word) ->
  word = word[0].toUpperCase() + word[1..].toLowerCase()

trim = (word) ->
  word = word.replace /^\s+|\s+$/g, ""

module.exports.piggy = (word) ->
  word = trim word
  pigWord = capitalize word[1..word.length] + word[0] + "ay"

module.exports.clean = (word) ->
  word = capitalize trim word
