$(document).ready(function(){

  // Utility Methods

  function set_token(token) {
    localStorage.setItem('token', token);
  }

  function get_token() {
    return localStorage.getItem('token')
  }

  function log_out(){
    localStorage.setItem('token', null)
  }

  function signed_in() {
    if(get_token() != null) {
      return true
    } else {
      return false
    }
  }

  function toggle_sign_in(){
    if(signed_in()){
      $('.logged_out').hide()
      $('.logged_in').show()
    }else{
      $('.logged_in').hide()
      $('.logged_out').show()
    }
  }

  function reset_form(form_id){
    $(form_id)[0].reset()
  }

  api_root = "https://sleepy-gorge-91783.herokuapp.com/"

  $.getJSON(api_root + "chirps/timeline")
    .done(function(response){
      response.forEach(function(chirp){
        $('#chirp_list').append(
          `
            <div class="media">
              <div class="media-left">
                <img src="${chirp.user.image}" alt="${chirp.user.username}" class="img-circle media-object" />
              </div>
              <div class="media-body">
                <p>${chirp.body}</p>
                <p><small>Posted by ${chirp.user.username} ${moment(chirp.created_at).fromNow()}</small></p>
              </div>
            </div>
          `
        )
      })
    })

    $('#sign_up').on('submit', function(ev){
      ev.preventDefault()
      $.post(api_root + "create", $(this).serialize())
        .done(function(response){
          set_token(response.token)
          toggle_sign_in()
        })
    })

    $('#post_chirp').on('submit', function(ev){
      ev.preventDefault()
      $.post(api_root + "chirps/create?token=" + get_token(), $(this).serialize())
        .done(function(chirp){
          $('#chirp_list').prepend(
            `
              <div class="media">
                <div class="media-left">
                  <img src="${chirp.user.image}" alt="${chirp.user.username}" class="img-circle media-object" />
                </div>
                <div class="media-body">
                  <p>${chirp.body}</p>
                  <p><small>Posted by ${chirp.user.username} ${moment(chirp.created_at).fromNow()}</small></p>
                </div>
              </div>
            `
          )
          reset_form('#post_chirp')
        })
    })



  toggle_sign_in()


})
