
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

### Integers
```php
$Foo =  2;                    //between -2**31 (-2,147,483,648) and 2**32 (2,147,483,647)
$hexInt = Oxa43b;            
$octalINt = O7623;
```

### Float
```php
$floatVar = 25.4    
```

#### Numeric Operators

|  +  |  -     |   \* |  /     | % (mod) |   \*\*  | []   |   
|-----|--------|------|--------|---------|---------|------|
|  =  |   +=   |   -= |  \*=   |   /=    |  %=     |  !=  |   
| ==  | ===    | !==  |   >    |   <     | >=      |  <=  |   
| ++$x | $x++  | --$x |  $x--  |         |         |      |

### String

```php
$stringVar =  "somestring";   
```

|String Concatenation     | .   |  $label.$value | 
|-------------------------|-----|----------------|
| Concatenation Assignment| .=  | $str .= "lbs."| 

### Boolean

```php
$myBool = true;               
```

### Operators

| and <br> && |  or  <br> \|\| |     xor      |      !  |         
|-------------|----------------|--------------|---------|



## Arrays

```php
$cars = array("Volvo","BMW","Toyota");
$numbers = array(1,2,3,4);      //???

sort() - sort arrays in ascending order
rsort() - sort arrays in descending order


```
### Operators
|  + (union) | == | ===| != <br> <> | !== | 
|------------|----|----|------------|-----|

## Associative Arrays or Hashes
Associative arrays, otherwise known as hashes are are key, value pairs
```php
$fruitColors = array("apple" => "red", "macintosh" => "green");  
$betterFruitColors = array("blueberry" => "blue", "squash" => "yellow");  
```
Or you can also define an hash by simply assigning one of it's pairs:
```PHP
$x['apple'] = "red";
```

asort() - sort associative arrays in ascending order, according to the value
ksort() - sort associative arrays in ascending order, according to the key
arsort() - sort associative arrays in descending order, according to the value
krsort() - sort associative arrays in descending order, according to the key
## Multidimensional Arrays




|
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
