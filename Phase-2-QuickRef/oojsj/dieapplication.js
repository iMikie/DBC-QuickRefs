// $(document).ready(function() {
//   $('#roller button.add').on('click', function() {
//     console.log("WAT")
//     $('.dice').append('<div class="die">0</div>');
//   });

//   $('#roller button.roll').on('click', function() {
//     $('.die').each(function(k, die) {
//       var value = Math.floor((Math.random()*6)+1);
//       $(die).text(value);
//     });
//   });
// });

//repeated functions: $('#roller button.__').on('click', CALLBACK_HERE)



$(document).ready(function() {
    var ourDice = new Dice();
    $('.add').on('click', ourDice.dice_add);
    $('.roll').on('click', ourDice.roll);
});

//name anonymous functions: 2 functions here - 1 adds a die, 1 rolls dice
var Dice = function() {

}

Dice.prototype.dice_add = function(){
    console.log('inside');
    $('.dice').append('<div class="die">0</div>');
}

Dice.prototype.roll = function(){
    console.log('inside')
    $('.die').each(function(k, die) {
        console.log(die)
        var value = Math.floor((Math.random()*6)+1);
        $(die).text(value);
    });
}

// 1. Provide good names for all anonymous functions.
// 2. Move the anonymous functions to objects.
// 3. Each callback or event handler is only 1 or 2 lines
    <html>
    <head>
    <title></title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="application.js"></script>
    <style>
.die { text-align: center; float: left; border: 1px solid black; padding: 40px}
</style>
</head>


<body>
<div id="roller">
    <button class="add">Add dice!</button>
<button class="roll">Roll dice!</button>
<div class="dice"></div>
    </div>

    </body>

    </html>// 4. Create a clear separation of concerns.