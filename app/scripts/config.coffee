app = angular.module 'tryethereum', ['ngRoute', 'partials']

app.config ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/all', 
      templateUrl: '/partials/all.html'
    .when '/wallet', 
      templateUrl: '/partials/wallet.html'
    .otherwise 
      templateUrl: '/partials/all.html'
  $locationProvider
      .html5Mode(false)
  return

dom = angular.element document
# Manual initialization to run foundation
dom.ready ->
  dom.foundation()
  wh = window.innerHeight
  ms = angular.element('.main-section')
  if ms.height < wh
    ms.css 'height', wh
  iw = angular.element '.inner-wrap'
  if iw.height < wh
    iw.css 'height', wh
  try
    angular.bootstrap document, ['tryethereum']
  catch err