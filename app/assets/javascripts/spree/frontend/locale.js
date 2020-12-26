Spree.fetch_locales = function () {
  return $.ajax({
    url: Spree.pathFor('locales')
  }).done(function (data) {
    $('#main-nav-bar > .navbar-right').append(data);
  });
};

$(function () {
  $('body').on('change', '#locale-select select', function () {
    $(this).parents('form').submit();
  });
});
