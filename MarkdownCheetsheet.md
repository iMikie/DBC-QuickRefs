
###Markdown
-

Some people never left the 80's.  For them the desktop publishing revolution never took place.  Instead, they have markdown.  Alas, you will have to learn it too as it's kind of a standard in programmer land.

How it works: rather than seeing your page as you work on it like a normal editor, you write plain text, putting in little secret codes that no one remembers.  Isn't that cute? Then there's the problem of how to see what it looks like.  You need something that can translate markdown into HTML and your browser can't.

On the Macintosh, [Markdown Pro](https://www.markdownpro.com) is a pretty good editing app, allowing you to type in the left pane and see the result in the right.  It won't show linked images though.  

In GitHub, if you create a repository it will automatically create a readme.md file.  Look for the pencil icon.  That will let you edit and preview right in the github browser page.  While editing look for the preview tab.  GitHub even colorizes your programming code (see below).  

Here we go.

**Michael Farr SF-Dragonfiles-2015**<br>
mikefarr@mac.com <br>
michaelmfarr@gmail.com

---

###Headings

###To see this:   &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;       Type this at the left margin:
#Heading         &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 1`   <br>   
##Heading 2       &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 2`    <br>    
###Heading 3      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 3`
####Heading 4     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 4`
#####Heading 5       &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 5`
######Heading 6     &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `#Heading 6`

---
<br>
###Horizontal Rules

A single - alone on a line with a blank line before it will give a thin line:
```
-
```

-

a triple --- alone on a line with a blank line before will give a thick line: 
```
---
```
---
<br>
###Normal text

For normal text, just type normal text, like this.

For a paragraph break, hit return twice. 
For a single break or for 3 or more, use `<br>`


Use the HTML code for break, <br> to force a new line anywhere&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; `Use the HTML code <br> to force a new line anywhere` <br>

For **bold text** and *italic text*, &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; `For **bold text** and *italic text*`

For ***bold and italic***  &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; `For ***bold and italic***`

For ~~strike through text~~ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  `For ~~strick through text~~~`

For superscript,  O(n<sup>2</sup>) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;`Use raw HTML:  O(n<sup>2</sup>)`

For subscript: binary_search<sub>2</sub>, &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; `For subscript: binary_search<sub>2</sub>`

For non breaking &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spaces inside a line &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `For non breaking &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spaces inside a line` 

---



###Lists


* Top level item     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `* Top level item, start line with *`
  * Second level      &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `<tab> * Second level `
    * Third level   &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   ` <tab><tab>  * Third level item <tab><tab>*`

You can also use '+' and '-' instead of '*'
####Ordered Lists
1. Item 1     &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;   `1. Item 1`
2. Item 2     &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;  `2. Item 2`
  1. Indented 1 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `<tab>1. Indented 1`
  2. Indented 2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   `<tab>2. Indented 2`
    1. Twice Indented 1&nbsp; &nbsp; &nbsp; &nbsp;   `<tab><tab>1. Twice Indented 1`
    2. Also indented 2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; `<tab><tab>2. Also indented 2`

---

###Tables


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

---

###Code


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

---
###Links

`[I'm an inline-style link](https://www.google.com)`<br>
[I'm an inline-style link](https://www.google.com)

`[relative link to your own repository](../blob/master/source/ruby.rb)`<br>
[relative link to your own repository](../blob/master/source/ruby.rb)

`[Numbered reference-style link][1]` <br>
[Numbered reference-style link][1]

`[I'm a reference-style link][Link is included in text somewhere after]`<br>
[I'm a reference-style link][Link matches this text]

`The best quickrefs for devbootcamp can be [found here.]`<br>
The best quickrefs for devbootcamp can be [found here.]

[1]: http://devbootcamp.org
[Link matches this text]: http://devbootcamp.com
[found here.]: http://github.com/iMikie/DBC-QuickRefs

-
Later in the file we need to include the following:

```
[1]: http://devbootcamp.org
[Link matches this text]: http://devbootcamp.com
[found here.]: http://github.com/iMikie/DBC-QuickRefs
```
---

###Images

In-line:

`![alt text for search engines] (http://devbootcamp.com/assets/img/devbootcamp-logo.png)`<br>
The above gives us the image itself: <br>
![alt text] (http://devbootcamp.com/assets/img/devbootcamp-logo.png)

Reference style:
`![alt text for search engines][logo]`<br>
The above gives us: <br>
![alt text for search engines][logo]

Then sometime later in the file you need to have:<br>
`[logo]: http://devbootcamp.com/assets/img/devbootcamp-logo.png`
[logo]: http://devbootcamp.com/assets/img/devbootcamp-logo.png

---

###You Tube Videos
You can include HTML in markdown and that's the best way to include a You-tube video. This is just a link to YouTube with a jpg preview.  Here is an example pointing to a video of my Sudoku challenge solution from week 2. I got it's width and height by right clicking on the video in youtube and selecting "get embed code".
```HTML
<a href="http://www.youtube.com/watch?feature=player_embedded&v=OwevNBQvmwc
" target="_blank"><img src="http://img.youtube.com/vi/OwevNBQvmwc/0.jpg" 
alt="My Sudoku board challenge." width="640" height="390" border="10" /></a>
```

<a href="http://www.youtube.com/watch?feature=player_embedded&v=OwevNBQvmwc
" target="_blank"><img src="http://img.youtube.com/vi/OwevNBQvmwc/0.jpg" 
alt="My Sudoku board challenge." width="640" height="390" border="10" /></a>

You can also do this with pure Markdown but the result is less than spectacular:

`[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=OwevNBQvmwc)`

[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=OwevNBQvmwc)

<iframe width="640" height="390" src="https://www.youtube.com/embed/OwevNBQvmwc" frameborder="0" allowfullscreen></iframe>
---

###Special Characters
You want \*asterisk\* but markdown thinks you want italics:  *asterisk*. 
Put a backslash \\ before the special character.

                    \*literal asterisks\*
            
Markdown provides backslash escapes for the following characters:

                    \   backslash
                    `   backtick
                    *   asterisk
                    _   underscore
                    {}  curly braces
                    []  square brackets
                    ()  parentheses
                    #   hash mark
                    +   plus sign
                    -   minus sign (hyphen)
                    .   dot
                    !   exclamation mark
                    
Special characters
Character	Representation	Description<br>
&copy; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&copy;`&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;    Copyright<br>
&reg;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&reg;`&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;     Registered trade mark <br>
&euro;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&euro;` &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   Euro sign <br>
&trade;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&trade;` &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  Trademark sign <br>
&hearts;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&hearts;`&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  Heart <br>
&larr;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&larr;` &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;  Left arrow <br>
&rarr;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&rarr; `&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   Right arrow <br>
&uarr;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&uarr;` &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;	  Up arrow <br>
&darr;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&darr;` &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   Down arrow <br>
&harr;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;`&harr; `&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;   Right-left arrow <br>
