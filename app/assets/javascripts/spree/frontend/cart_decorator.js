Spree.fetch_cart = function () {
  return $.ajax({
    url: Spree.pathFor('/cart_link'),
    cache: false
  }).done(function (data) {
    $('#link-to-cart').html(data);
  });
};
