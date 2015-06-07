# DBC-QuickRefs
<br>
No one learns anything on the first try,  but what to keep close at hand?  
This is what I found I used all the time.  

Make your mods and pass it on to the next cohort.   
Good luck!

**Mike Farr,  SF Dragonflies 2015**<br>
*Everything you ever wanted to do was once impossible.*

---

<br>
###Markdown
-

Some people never left the 80's.  For them the desktop publishing revolution never took place.  Pages, MS Word and PDF might as well not exist.  Instead, they have markdown.  Alas, you will have to learn it too. You write documents in plain text, putting in little secret codes.  Isn't that cute?  One advantage is that it can be stored with code as plain text.  You can even write it with a code editor if you can remember those secret codes.  That's where this cheatsheet comes in. 

On the Macintosh, Markdown Pro is a pretty good editing app, allowing you to type in the left pane and see the result in the right.  In GitHub, if you create a filename.md file, look for the pencil icon.  That will let you edit and preview right in the github page and it's preview is the best. Make sure you are in your GitHub account!)  GitHub even colorizes your programming code (see below).  

Here we go:

###Headings
-


###To see this:   &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;       Type this at the left margin:
#Heading         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 1`   <br>   
##Heading 2       &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 2`    <br>    
###Heading 3      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 3`
####Heading 4     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 4`
#####Heading 5       &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 5`
######Heading 6     &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;`#Heading 6`

###Horizontal Rules
A single - alone on a line with a blank line before it will give a thin line:

-

a triple --- alone on a line with a blank line before will give a thick line: 

###Normal text
-
For normal text, just type normal text, like this.

For a paragraph break, hit return twice. 
For a single break or for 3 or more, use `<br>`


Use the HTML code for break, <br> to force a new line anywhere&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; `Use the HTML code <br> to force a new line anywhere` <br>

For **bold text** and *italic text*, &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; `For **bold text** and *italic text*`

For ***bold and italic***  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; `For ***bold and italic***`

For ~~strike through text~~ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  `For ~~strick through text~~~`

For superscript,  O(n<sup>2</sup>) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;`Use raw HTML:  O(n<sup>2</sup>)`

For subscript: binary_search<sub>2</sub>, &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; `For subscript: binary_search<sub>2</sub>`

For non breaking &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spaces inside a line &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `Use &nbsp;` 




###Lists
------

* Top level item     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `* Top level item, start line with *`
  * Second level      &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `<tab> * Second level `
    * Third level   &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   ` <tab><tab>  * Third level item <tab><tab>*`

You can also use '+' and '-' instead of '*'
####Ordered Lists
1. Item 1     &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `1. Item 1`
2. item 2
  1. Indented 1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `<tab>1. Indented 1`
  2. Indented 2
    1. Twice Indented 1&nbsp; &nbsp; &nbsp; &nbsp;   `<tab><tab>1. Twice Indented 1`
    2. Indented 2

###Tables
-

| Tables        | Are           | Cool  |    
| ------------- |:-------------:| -----:|
| this column      | this col    | right_aligned |
|  is       | is       |   $12 |
| left aligned |  centered     |    $1 |

:----:  centered <br>
-----:  right aligned

```
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
```


###Code
------

Tell GitHub what language and it will syntax highlight the code. (Note if you aren't viewing this in GitHub you might not see the highlighting.)

    ```ruby
      class MyClass
        def initialize(gimme: a_variable)
          p "When in doubt, p it out."
          puts "Try RubyMine to see what an IDE for Ruby is like."
        end
      end
      ``` 


```ruby
class MyClass
  def initialize(gimme: a_variable)
    p "When in doubt, p it out."
    puts "Try RubyMine to see what an IDE for Ruby is like."
  end
end
```



Other languages supported include \`\`\`HTML, \`\`\`javascript, \`\`\`python and maybe more





