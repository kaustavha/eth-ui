app
    .controller 'WalletCtrl', ($scope, $http, $log, FetchData) ->
        $scope.genseed = ->
            $scope.seed = encodeURIComponent((''+Math.random()).substring(2)+''+new Date().getTime())
            hash = sha3 $scope.seed
            $scope.key = CryptoJS.enc.Hex.stringify hash

            # false flag important since key is uncompressed
            btcKey = Bitcoin.ECKey.fromHex $scope.key, false

            bytes = Bitcoin.convert.hexToBytes(btcKey.pub.toHex()).slice 1
            binaryForCryptoJs = CryptoJS.enc.Latin1.parse Bitcoin.convert.bytesToString bytes

            addr = sha3 binaryForCryptoJs
            $scope.address = addr.toString().substr 24
            return

        $scope.alloc = (addr, amount) ->
            $http.post '/alloc', {addr: addr, amount: amount}
                .success (res) ->
                    $scope.response = "Allocated " + amount + " to " + addr
                    $scope.error = ''
                    FetchData $scope.address, 'account'
                    FetchData $scope.search_address, 'search_account'
                    return
                .error (err) -> $log.error err
            return

        return
