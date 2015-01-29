$(document).ready(function() {

  var loginLoaded = false,
      loginActive = false,
      signupLoaded = false,
      signupActive = false;
// following jquery ajax is for login
  $('header').on('click','#login-link',function(event){
    event.preventDefault();

    if(loginLoaded) {
      if(loginActive){
        $('#login').hide();
        loginActive = false
      } else{
        $('#login').show();
        $('#signup').hide();
        loginActive = true;
        signupActive = false;
      }
      return
    }
    var $target = $(event.target);

    $.ajax({url: '/login',
            type: 'GET'
    }).done(function(response){
      $('#login').html(response);
    });

    $('#login').show();
    $('#signup').hide();
    loginLoaded = true;
    loginActive = true;
    signupActive = false;
  });

// following jquery ajax is for signup
    $('header').on('click', '#signup-link', function (event) {
    event.preventDefault();

    if(signupLoaded) {
      if(signupActive) {
        $('#signup').hide();
        signupActive = false;
      } else {
        $('#signup').show();
        $('#login').hide();
        loginActive = false;
        signupActive = true;
      }
      return;
    }

    var $target = $(event.target);

    $.ajax({
      url: '/signup',
      type: 'GET'
    }).done(function (response) {
      $('#signup').html(response);
    });

    $('#signup').show();
    $('#login').hide();
    signupLoaded = true;
    signupActive = true;
    loginActive = false;
  });

// following jquery ajax is for edit receipt
$('.showbox').on('click', '.edit', function(event){
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: 'GET',
      url: $target.attr('href')
    }).done(function(response){
      $target.closest('.showbox').children('.edit_box').html(response)
    });
  });

// following jquery and ajax is for delete receipt
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

  // following for displaying search box
  $('#sidebar').on('click', '#search-link', function(event){
      event.preventDefault();
      var $target = $(event.target);
      $.ajax({
        type: 'GET',
        url: $target.attr('href')
      }).done(function(response){
        $('#search-box').html(response)
      });
  });

  // $('#sidebar').keypress(function(event){
  //   if(event.which == 13){
  //     event.preventDefault();
  //     var $target = $(event.target);
  //     $.ajax({
  //       type: 'GET',
  //       url: $target.attr('action')
  //     }).done(function(response){
  //       $('#display-search').html(response)
  //     });
  //   }
  // });
});
