app = angular.module 'tryethereum', ['ngRoute']

app.config ($routeProvider, $locationProvider) ->
    $routeProvider
        .when '/all', {templateUrl: './views/all.html'}
        .when '/wallet', {templateUrl: './views/wallet.html'}
        .when '/mining', {templateUrl: './views/mining.html'}
        .otherwise {templateUrl: './views/all.html'}
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
    angular.element '.left-off-canvas-menu'
        .css 'height', wh
    
    angular.bootstrap document, ['tryethereum']