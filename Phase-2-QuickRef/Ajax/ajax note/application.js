$(document).ready(function () {

    // Add new note
    $('#create-new-note').on("click", function (event) {
        event.preventDefault();

        //This is the new note get route
        var path = $('#create-new-note').attr('href');

        var request = $.ajax({
            url: path,
            type: "GET",
            data: $('#new_note').serialize()
        });//end ajax

        //Adds new question div
        request.done(function (response) {
            // console.log(response + 'you made it here 2');
            $('#section').append(response);
            // $('.create-note-button').hide();
        });//end done

        request.fail(function (response) {
            console.log(response);
        });

    });

    $('.container').on('click', '#save-new-note', function (event) {
        event.preventDefault();

        var path = $('#save-new-note').parent().attr('action');

        var request = $.ajax({
            url: path,
            type: "POST",
            data: $('#new_note').serialize()
        });

        request.done(function (response) {

            $('#note-list').append(response);
            $('.new-note-popup').hide();
        });//end done

    });


});