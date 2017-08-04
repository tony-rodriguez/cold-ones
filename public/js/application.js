$(document).ready(function() {
  $(".cold-one-form").on("aubmit", function(e) {
    e.preventDefault();
    $form = $(this);
    zip = $form.find('input[name="zip"]').val();
    $.ajax({
      url: 'cold_one',
      data(zip: zip)
    }).done(function(response) {
      $(".main-content").append("<p>" + response + "</p>")
    })

  })
});
