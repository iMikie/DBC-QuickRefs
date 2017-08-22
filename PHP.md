
# PHP

## Constants 
  - are always global,
can you have an object constant?

```php
define("GREETING", "Welcome to W3Schools.com!", true); //created with define function
define(name, value, case-insensitive);
```

## Variables 
- defined with $
- Case sensitive
- dynamically typed 
  - no int, float, boolean type declarations, PHP figures it out.  
  - The type of a variable can change, it depends on what it contains

```php
$myVar =  "somestring";     //Dynamically typed: PHP figures out this is a string
$MyVar = 25.4               //PHP figures it's a float, note case sensitive
```
## Data Types

```php
### Integers
```php
$Foo =  2;                    //between -2**31 (-2,147,483,648) and 2**32 (2,147,483,647)
$hexInt = Oxa43b;            
$octalINt = O7623;
```
### String
```php
$stringVar =  "somestring";   
```

### Float
```php
$floatVar = 25.4             

### Boolean
$myBool = true;               
```

## Arrays
```php
$cars = array("Volvo","BMW","Toyota");
$numbers = array(1,2,3,4);      //???
```

## Functions

```php
function myTest(){}       //same function
function mytest(){}
```

## Classes and Objects
---
```php
class Car {                           //define a class
    function Car() {
        $this->model = "VW";
    }
}
$herbie = new Car();                   //create an object

echo $herbie->model;                  // show object properties
```

//Built in Functions and values
//Strings

```

```html
//Within in Web Page; PHP is executed and the return value is inserted in the HTML
<!DOCTYPE html>
<html>
<body>
<?php
echo "<h1>Hello World!"</h1>";
?>
</body>
</html>
```
