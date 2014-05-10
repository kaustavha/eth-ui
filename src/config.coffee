app = angular.module 'tryethereum', ['ngRoute']

app.config ($routeProvider, $locationProvider) ->
    $routeProvider
        .when '/all', {templateUrl: '../build/views/all.html'}
        .otherwise {templateUrl: '../build/views/all.html'}
    $locationProvider.html5Mode(true);
    return

dom = angular.element document
# Manual initialization to run foundation
dom.ready ->
	dom.foundation()
	angular.bootstrap document, ['tryethereum']