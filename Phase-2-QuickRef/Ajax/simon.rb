
get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/color' do

  #Create and return a JSON object with the random cell and color given below.

  cell= rand(1..9)
  color= "#" + "%06x" % (rand * 0xffffff)

  content_type :json
  return {
      cell: cell,
      color: color,
  }.to_json

end

#------------------------


$(document).ready(function(){
                    clickButton();
                  });



clickButton = function(){  $('a').on('click', function(element){
                                              element.preventDefault();

                                              var request = $.ajax({
                                                                       method: 'post',
                                                                       url: '/color',
                                                                       dataType: 'json',
                                                                   });

                                              request.done(function(response){
                                                             var cell = response.cell;
                                                             console.log(response.cell);
                                                             $("#color_me li:nth-child("+ cell +")").css('background-color', response.color);
                                                           });

                                              request.fail(function(response){
                                                      console.log("you fucked up");
                                                      console.log(response);

                                                    })
                                            });
}

#---------------------
var getColorListener = function () {
      $('#get_color').on('click', function(event){
                                  event.preventDefault();
                                  $.ajax({
                                             url: "/color",
                                             type: "POST"
                                         })
                                        .done(function(response){

                                                updateDOM(response);
                                                console.log
                                              })

                                  .fail(function(response){
                                          console.log("you fucked up");
                                          console.log(response);

                                        })
                                });
    }


var updateDOM = function(response) {
      $('#color_me li:nth-child(' + response.cell + ')').css('background-color', response.color)
    }



$(document).ready(function(){
                    getColorListener()
                  });


/*
  VERY BROAD STROKES
  clicking a button
  change a random cell to a random color
  broad strokes
  clicking a button
  prevent that buttons default
  get random cell info from server
  update our DOM with info from the server
  finer points
    clicking a button
      - write a click event listener for "click me" button
      -
    prevent that buttons default
      - click listener prevents the buttons default action
    get random cell info from server
      - AJAX request to server
        - url: /color
- type: "POST"
- SERVER SIDE
- give us a valid response
- return status 200
- return some JSON
- return random cell and random color in JSON format
update our DOM with info from the server
- AJAX all good
- verify our data
- update a cell based on returned cell number with returned cell color
- AJAX tottallly f'ed
        - verify our data
        - alert user to failure
*/
