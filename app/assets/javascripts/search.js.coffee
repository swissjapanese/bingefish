$ ->
  $('#show-search-field').keyup (e) ->
    if e.keyCode == 13
      searchQuery = $(e.target).val()
      window.location = "/search?query=#{encodeURIComponent(searchQuery)}"
