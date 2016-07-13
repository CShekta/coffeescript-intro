all_names = {}
module.exports.get_all_names = ->
  all_names

module.exports.process = (name) ->
  if not all_names[name]
    all_names[name] = 1
  else
    all_names[name] += 1
  all_names

module.exports.delete = (name) ->
  if not all_names[name]
    return error
  else
    all_names[name] -= 1
    if all_names[name] is 0
      delete all_names[name]
  all_names
