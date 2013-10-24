windowLayout =
  'Airmail':
    size: width: 2/3, height: 1
    position: x: 0, y: 0
    mainScreen: false

  'Tweetbot':
    size: width: 1/3, height: 2/3
    position: x: 2/3, y: 0
    mainScreen: false

  'Messages':
    size: width: 1/3, height: 1/2
    position: x: 2/3, y: 1/2
    mainScreen: false

  'Google Chrome':
    size: width: 1, height: 1
    position: x: 0, y: 0
    mainScreen: false

  'iTerm':
    size: width: 1, height: 1
    position: x: 0, y: 0
    mainScreen: true

bind '1', ['alt', 'cmd'], -> layoutAllWindows()

bind 'i', ['ctrl', 'alt', 'cmd'], ->
  window = api.focusedWindow()
  alert """
    App Title: #{window.app().title()}
    Screen: #{if isMainScreen window.screen() then 'Main' else 'Secondary'}
    Position: #{_.values(window.topLeft()).join(', ')}
  """

listen 'screens_changed', -> layoutAllWindows()

listen 'app_launched', (app) -> layoutAppWindows(app)

isMainScreen = (screen) ->
  return _.isEqual screen.frameIncludingDockAndMenu(), api.allScreens()[0].frameIncludingDockAndMenu()

layoutWindows = (windows) ->
  _.each windows, (window) ->
    layout = windowLayout[window.app().title()]
    return unless window.isNormalWindow() and layout?
    screen = if layout.mainScreen then _.first api.allScreens() else _.last api.allScreens()
    window.setFrame
      w: Math.floor screen.frameWithoutDockOrMenu().w * layout.size.width
      h: Math.floor screen.frameWithoutDockOrMenu().h * layout.size.height
      x: Math.floor screen.frameWithoutDockOrMenu().w * layout.position.x + screen.frameWithoutDockOrMenu().x
      y: Math.floor screen.frameWithoutDockOrMenu().h * layout.position.y + screen.frameWithoutDockOrMenu().y

layoutAllWindows = -> layoutWindows api.visibleWindows()

layoutAppWindows = (app) -> layoutWindows app.visibleWindows()
