$ ->
  callback = (value) ->
    $.ajax
      url: 'api/v1/search'
      method: 'GET'
      data:
        query: $('#nav-search').val()
      error: (error, status, statusText) ->
        alert('server problem :(')
      success: (data, status, jqhxr) ->
        alert('you hit the mark :o')

  $('#nav-search').typeWatch
    callback: callback
    wait: 500
    highlight: true
    allowSubmit: false
    captureLength: 2
