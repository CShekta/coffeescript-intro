module.exports.get_all_names =
  all_names = {'World': 1}

module.exports.process = (name) ->
  if not all_names[name]
    all_names[name] = 1
  else
    all_names[name] += 1
  all_names
