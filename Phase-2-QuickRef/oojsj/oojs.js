// # Constructor
// User = function(options){
// 	if (!options){ options = {}; }
// 	this.fname = options.fname;
// 	this.lname = options.lname;
// };

// User.prototype.full_name = function(){
// 	return this.fname+' '+this.lname;
// };

// steven_pinker = new User({
//   fname: 'Steven', 
//   lname: 'Pinker',
// });


// Person = function(fname, lname){
// 	this.fname = fname;
// 	this.lname = lname;
// }

// Person.prototype.fullName = function(){
// 	return this.fname+' '+this.lname;
// }

// Person.prototype.speak = function(){
// 	console.log(this.fullName());
// }

// jared = new Person('Jared', 'Grippe');
// brick = new Person('Brick', 'Smith');





// one = {
// 	frog: 'ribbit'
// }

// two = Object.create(one)
// two.cows = 'fat sea creatures'
// two.frog = 'kiss me'

// three = Object.create(two)
// three.boosh = 'i hate hotdogs'



Animal = function(name){
	this.name = name;
}
Animal.prototype.redBlooded = false
Animal.prototype.hasBlood = true
Animal.prototype.multicellular = true


Mammal = function(name, eyeColor){
	this.eyeColor = eyeColor;
	Animal.call(this, name); // super(name)
}

Mammal.prototype = Object.create(Animal.prototype);
Mammal.prototype.redBlooded = true


peter = new Mammal('Peter', 'blue');


// x = new Animal('Steve'); 
// debugger

// instance = Object.create(Animal.prototype)
// Animal.call(instance)
// return instance
