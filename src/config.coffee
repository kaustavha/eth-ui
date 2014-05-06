app.config ($routeProvider, $locationProvider) ->
    $routeProvider
        .when '/all', {templateUrl: '../build/views/all.html'}
        .otherwise {templateUrl: '../build/views/all.html'}
    $locationProvider.html5Mode(true);
    return