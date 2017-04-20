# theme-switch

Switch theme(ui and syntax) by `random`.

![gif](https://raw.githubusercontent.com/t9md/t9md/2391f495870160c16ee560e0ee5dc913f0df74d4/img/atom-theme-switch.gif)

# Features

* Switch to random theme within defined set of ui and syntax pair.
* Provide three kind of theme set store(All, Dark, Light).

# Commands

Use following command to change theme.

* `theme-switch-rand`: Change to random theme in `profiles`
* `theme-switch-rand-dark`: Change to random theme in `darkProfiles`
* `theme-switch-rand-light`: Change to random theme in `lightProfiles`

No keymap by default.  
Keymap example is here.
```coffeescript
'atom-workspace:not([mini])':
  'f5': 'theme-switch:rand'
```

# Configuration

Configure theme set(=profile) directly in your `config.cson` or via setting UI.  
If you are not sure for exact name of ui and syntax name.
Check `atom.config.get('core.theme')` in Chrome DevTools.

e.g.

```coffeescript
"theme-switch":
  profiles: [
    "atom-dark-ui spacegray-dark-syntax"
    "atom-dark-ui atom-dark-syntax"
    "atom-light-ui atom-light-syntax"
  ],
  darkProfiles: [
    "atom-dark-ui atom-dark-syntax"
    "one-dark-ui one-dark-syntax"
  ],
  lightProfiles: [
    "atom-light-ui atom-light-syntax"
    "one-light-ui one-light-syntax"
  ]
```
