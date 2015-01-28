$(document).ready(function() {
  $('.showbox').on('click', '.delete', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: 'DELETE',
      url: $target.attr('href')
    }).done(function(response){
      $target.closest('.showbox').remove();
    });
  });
});
