$(document).ready(function(){
  movies = []

  movies.push({
      title: "Dr. Strangelove: Or How I Learned to Stop Worrying and Love the Bomb",
      directors: ["Stanley Kubrick"],
      actors: ["James Earl Jones", "Peter Sellers", "George C. Scott"],
      genre: "Dark Comedy",
      year: 1964,
      imdb_rating: 8.5,
      meta_rating: 96
  })
  movies.push({
      title: "Pulp Fiction",
      directors: ["Stanley Kubrick"],
      actors: ["James Earl Jones", "Peter Sellers", "George C. Scott"],
      genre: "Dark Comedy",
      year: 1964,
      imdb_rating: 4.3,
      meta_rating: 53
  })
  movies.push({
      title: "Primer",
      directors: ["Stanley Kubrick"],
      actors: ["James Earl Jones", "Peter Sellers", "George C. Scott"],
      genre: "Dark Comedy",
      year: 1964,
      imdb_rating: 7.6,
      meta_rating: 82
  })
  movies.push({
      title: "Edge of Tomorrow",
      directors: ["Stanley Kubrick"],
      actors: ["James Earl Jones", "Peter Sellers", "George C. Scott"],
      genre: "Dark Comedy",
      year: 1964,
      imdb_rating: 3.4,
      meta_rating: 42
  })
  movies.push({
      title: "A Clockwork Orange",
      directors: ["Stanley Kubrick"],
      actors: ["James Earl Jones", "Peter Sellers", "George C. Scott"],
      genre: "Dark Comedy",
      year: 1964,
      imdb_rating: 3.4,
      meta_rating: 42
  })

  movies.sort(function(a,b){
      return a.title.localeCompare(b.title);
  })

  console.log(movies)

  console.log(JSON.stringify(movies))

  favorite_table = '<table class="table">'

  favorite_table += '<tr><th>Title</th>'
  favorite_table += '<th>Year</th>'
  favorite_table += '<th>Directors</th>'
  favorite_table += '<th>Stars</th>'
  favorite_table += '<th>Genre</th>'
  favorite_table += '<th>IMBD Rating</th>'
  favorite_table += '<th>Meta Rating</th>'
  favorite_table += '<th></th></tr>'

  movies.forEach(function(film){
    favorite_table += `<tr>
      <td>${film.title}</td>
      <td>${film.year}</td>
      <td>${film.directors.join(", ")}</td>
      <td>${film.actors.join(", ")}</td>
      <td>${film.genre}</td>
      <td>${film.imdb_rating}</td>
      <td>${film.meta_rating}</td>
      <td><a class="btn btn-danger unfavorite" href="#">Unfavorite</a></td>
    </tr>
    `
  })

  favorite_table += "</table>"
  console.log(favorite_table)

  $('#content').append(favorite_table)

  $('.unfavorite').on('click', function(ev){
    $(ev.target).parent().parent().hide()
    // AJAX call to favorites#destroy
  })

  // Star Wars ... nothing but Staaaaaar Waaaars

  function sort_by_episode_number(movies) {
    return movies.sort(function(a,b){
      return a.episode_id - b.episode_id
    })
  }

  // function list_of_characters(movie){
  //   deferred = $.Deferred()
  //     var names = []
  //     movie.characters.forEach(function(char){
  //       $.ajax({url: char, data_type: 'json', async: true}).
  //       then(function(response){
  //         names.push(response.name)
  //       })
  //     })
  //   deferred.resolve()
  //   console.log(names)
  //
  //   return names.join(", ")
  // }

  data = $.ajax({url: 'http://swapi.co/api/films/', data_type: 'json', async: false})
          .done(function(response){
            sort_by_episode_number(response.results).forEach(function(movie){
              console.log(movie.release_date)
              $('#swapi').append(
                `
                  <div class="row">
                    <div class="col-xs-4">
                      <h4>${movie.title}</h4>
                      <p><small>Director: ${movie.director}</small></p>
                      <p><small>Released: ${movie.release_date}</small></p>
                      <p><small id="episode-${movie.episode_id}"></small></p>
                    </div>
                    <div class="col-xs-8">
                      <p>${movie.opening_crawl}</p>
                    </div>
                  </div>
                `
              )
              movie.characters.forEach(function(char_url){
                $.getJSON(char_url, function(response){
                  $('#episode-' + movie.episode_id).append(response.name + ", ")
                })
              })
            })
  })

})
