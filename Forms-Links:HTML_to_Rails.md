#Forms, Form tags, Link_to etc.

With Rails you will have to master ***form_tag*** and ***link_to*** which are so bloody confusing that no one does. Except you will, now.

Confession: I didn't completely master forms in HTML and maybe you didn't either.  Here's a quick-ref, if you need more kindle the [Duckett Book](http://www.htmlandcssbook.com).)  

In short, forms consist of ***\<form\>*** tags containing ***\<label\> - \<input\>*** tag pairs. The ***\<input\>*** tag is either inside the ***\<label\>*** tag or beside it.  Every input tag has a *name* attribute which will be its variable name when it's sent to the server. That's all there is to it, really.

```html
<form> tag
    <label>Username: <input type="text" name="username"/>  <!-- input tag is inside the lable tag -->
    
    <label for="passwd"> Password: \</label>        <!-- here the label and input tag are separated, so -->
    <input id="passwd" type="password"/>            <!-- use *for* in label and *id* attribute in input tag -->
</form>
```
The <label> tag is basically a <p> paragraph text tag,  but also tells the browser to vocalize the text for vision impaired users.  To pair the label with an <input> tag,  put the <input> tag inside the <label>...</label> tag or give the <input> tag a CSS id attribute and use <label for="some_id_name">. 

Types of ***\<input\>*** tags: text, textarea, password, radio, checkbox, select (drop-down menu or scrolling list), file input, fieldset (with optional legend), and hidden tags. Forms are submitted via a button and can even consist only of a single button.  Button types are: submit button, regular button, image button,combo text and image button.   

Here the different types of form elements


```html
<form action="http://www.example.com/some_crud">
  <label> What do you listen on? </label>
  <input type="text" 
  <select
  
