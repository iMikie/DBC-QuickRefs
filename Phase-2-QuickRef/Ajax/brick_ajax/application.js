
$(document).ready(function() {

    // 1) capture the browser event (vote button click)
    $("button.up").on("click", function(event){
        // 2) prevent the default action
        event.preventDefault();
        debugger;
        // 3) capture the link path or destination on server
        var path = $(this).parent().attr("action");
        // 4) make the AJAX request including path, type, dataType, and data
        $.ajax({url: path,
            type: "POST",
            dataType: "json",
            data: {vote_type: "up"}
        })
            // 5) update your controller!
            // 6) create a callback for when the ajax call is done
            .done(function(response){
                // console.log(response)
                // 7) select the correct element and update it
                console.log(response);
                var slogan_div = $("#" + response.slogan_id);
                slogan_div.find(".points").text("\(" + response.vote_count + " points\)");
            })
    })


    // What about the downvote?!?
    // How can we use event bubbling (or event delegation)?

});
