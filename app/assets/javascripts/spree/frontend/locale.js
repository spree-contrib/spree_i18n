Spree.fetch_locales = function () {
  return $.ajax({
    url: Spree.pathFor('locales')
  }).done(function (data) {
    $('#locales').html(data);
  });
};

$(function () {
  $(document).on('change', '#locale-select select', function () {
    $(this).parents('form').submit();
  });
});
