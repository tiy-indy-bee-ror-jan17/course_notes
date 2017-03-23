$(document).ready(function(){

  api_root = "https://sleepy-gorge-91783.herokuapp.com/"

  // Utility Methods

  function set_token(token) {
    localStorage.setItem('token', token);
  }

  function get_token() {
    return localStorage.getItem('token')
  }

  function log_out(){
    localStorage.removeItem('token')
  }

  function signed_in() {
    if(localStorage.getItem('token') === null) {
      return false
    } else {
      return true
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

  function chirp_display(chirp) {
    return      `
                  <div class="media" id="chirp-${chirp.id}">
                    <div class="media-left">
                      <img src="${chirp.user.image}" alt="${chirp.user.username}" class="img-circle media-object" />
                    </div>
                    <div class="media-body">
                      <p>${chirp.body}</p>
                      <p><small>Posted by ${chirp.user.username} <a href="#chirp-${chirp.id}" class="chirp_show">${moment(chirp.created_at).fromNow()}</a></small></p>
                    </div>
                  </div>
                `
  }

  function timeline_url() {
    if(signed_in()){
      return api_root + "chirps?token=" + get_token()
    } else {
      return api_root + "chirps/timeline"
    }
  }

  function populate_chirps() {
    $('#chirp_list').empty()
    $.getJSON(timeline_url())
      .done(function(response){
        response.forEach(function(chirp){
          $('#chirp_list').append(
            chirp_display(chirp)
          )
        })
      })
    }

    $('#sign_up').on('submit', function(ev){
      ev.preventDefault()
      $.post(api_root + "create", $(this).serialize())
        .done(function(response){
          set_token(response.token)
          toggle_sign_in()
          populate_chirps()
        })
    })

    $('#post_chirp').on('submit', function(ev){
      ev.preventDefault()
      $.post(api_root + "chirps/create?token=" + get_token(), $(this).serialize())
        .done(function(chirp){
          $('#chirp_list').prepend(
            chirp_display(chirp)
          )
          reset_form('#post_chirp')
        })
    })

    $('#sign_out').on('click', function(ev){
      ev.preventDefault()
      log_out()
      toggle_sign_in()
      populate_chirps()
    })

    $('#sign_in').on('submit', function(ev){
      ev.preventDefault()
      $.post(api_root + "login", $(this).serialize())
        .done(function(response){
          set_token(response.token)
          reset_form('#sign_in')
          toggle_sign_in()
          populate_chirps()
        })
    })

    $(document).on('click', '.chirp_show', function(ev){
      // ev.preventDefault()
      id_to_fetch = $(ev.target).attr("href")
      console.log($(id_to_fetch).html())
      $('#modal_one .modal-body').html($(id_to_fetch).html())
      $('#modal_one').modal('show')
    })

    function first_load(){
      $('#chirp_list').empty()
      $.getJSON(timeline_url())
        .done(function(response){
          response.forEach(function(chirp){
            $('#chirp_list').append(
              chirp_display(chirp)
            )
          })
          if(window.location.hash){
            $('a[href="' + window.location.hash + '"]').click()
          }
        })
    }



  toggle_sign_in()
  first_load()


})
