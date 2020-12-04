Spree.fetch_locales = function () {
  return $.ajax({
    url: Spree.pathFor('locales')
  }).done(function (data) {
    $('.footer-spree-menu-links .col-3').last().find('.pt-2').after(data);
  });
};

$(function () {
  $(document).on('change', '#locale-select select', function () {
    $(this).parents('form').submit();
  });
});
