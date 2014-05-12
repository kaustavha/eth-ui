app = angular.module 'tryethereum', ['ngRoute']

app.config ($routeProvider, $locationProvider) ->
    $routeProvider
        .when '/all', {templateUrl: '../build/views/all.html'}
        .when '/wallet', {templateUrl: '../build/views/wallet.html'}
        .otherwise {templateUrl: '../build/views/all.html'}
    $locationProvider
        .html5Mode(true)
        .hashPrefix('!')
    return

dom = angular.element document
# Manual initialization to run foundation
dom.ready ->
    dom.foundation()
    angular.bootstrap document, ['tryethereum']