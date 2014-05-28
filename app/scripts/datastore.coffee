app.factory 'DataStore', ->
createSimpleStore = ->
      get: (key) -> JSON.parse localStorage.getItem JSON.stringify key
      set: (key, value) -> localStorage.setItem JSON.stringify(key), JSON.stringify(value)
      delete: (key) -> localStorage.removeItem JSON.stringify key
      count: -> localStorage.length
      clear: -> localStorage.clear() 

