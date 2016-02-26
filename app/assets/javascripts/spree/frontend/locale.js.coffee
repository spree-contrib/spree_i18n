Spree.fetch_locales = ->
  $.ajax
    url: Spree.pathFor("locales"),
    success: (data) ->
      $('#main-nav-bar > .navbar-right').append(data)

$ ->
  $('body').on 'change', '#locale-select select', ->
    $(this).parents('form').submit()
