app.factory 'FetchData', ($http, $log) ->
    (address, dest) ->
        $http.get '/account_to_dict?address=' + address
            .success (res) -> 
                $scope[dest] = res
                return
            .error (err) -> 
                $log.error err
                return
