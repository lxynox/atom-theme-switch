{CompositeDisposable} = require 'atom'

Config =
  profiles:
    order: 1
    description: 'list of "ui and syntax pair" used for `theme-switch:rand`'
    type: 'array'
    items:
      type: 'string'
    default: [
      "atom-dark-ui atom-dark-syntax"
      "one-dark-ui one-dark-syntax"
      "atom-light-ui atom-light-syntax"
      "one-light-ui one-light-syntax"
    ]
  darkProfiles:
    order: 2
    description: 'used for `theme-switch:rand-dark`'
    type: 'array'
    items:
      type: 'string'
    default: [
      "atom-dark-ui atom-dark-syntax"
      "one-dark-ui one-dark-syntax"
    ]
  lightProfiles:
    order: 3
    description: 'used for `theme-switch:rand-light`'
    type: 'array'
    items:
      type: 'string'
    default: [
      "atom-light-ui atom-light-syntax"
      "one-light-ui one-light-syntax"
    ]

module.exports =
  subscriptions: null
  config: Config

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    @subscriptions.add atom.commands.add 'atom-workspace',
      'theme-switch:rand': => @switch('profiles')
      'theme-switch:rand-dark': => @switch('darkProfiles')
      'theme-switch:rand-light': => @switch('lightProfiles')

  deactivate: ->
    @subscriptions.dispose()
    @subscriptions = null

  equalProfile: (a, b) ->
    (a.length is b.length is 2) and (a[0] is b[0]) and (a[1] is b[1])

  switch: (profileName) ->
    config = atom.config.get("theme-switch.#{profileName}")
    profiles = config.map((profile) -> profile.split(/\s+/))
    current = atom.config.get("core.themes")

    # detect current
    index = null
    for profile, i in profiles when @equalProfile(profile, current)
      index = i
      break

    # determine random index
    randIndex = Math.floor((profiles.length-1) * Math.random())
    randIndex += 1 if randIndex >= index
    index = randIndex
    
    # update theme
    atom.config.set("core.themes", profiles[index])
