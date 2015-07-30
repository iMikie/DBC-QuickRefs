#Forms, Form tags, Link_to etc.

With Rails you will have to master ***form_tag*** and ***link_to*** which are so bloody confusing that no one does. Except you will, now.

I really didn't master forms in HTML and maybe you didn't either.  (BTW, if you need a more in-depth review than what's here, kindle the [Duckett Book](http://www.htmlandcssbook.com).)  

In short, forms consist of ***\<form\>*** tags containing ***\<label\> - \<input\>*** tag pairs. The ***\<input\>*** element is either inside the ***\<label\>*** tag or beside it.  That's all there is to it, really.

```html
<form> tag
    <label>Username: <input type="text" name="username"/>  <!-- input tag is inside the lable tag -->
    
    <label for="passwd"> Password: \</label>        <!-- here the label and input tag are separated, so, -->
    <input id="passwd" type="password"/>            <!-- use *for* in label and *id* attribute in input tag -->
</form>
```
The <label> tag is basically a <p> paragraph text tag,  but also tells the browser to vocalize the text for vision impared users.  To pair the label with an <input> tag,  put the <input> tag inside the <label>...</label> tag or give the <input> tag a CSS id attribute and use <label for="some_id_name">. 

Types of <input> tags: text, textarea, password, radio, checkbox, select (drop-down menu or scrolling list), file(as in file upload, not sure how you receive it on the other end), submit, image, button, fieldset-legend, hidden.  

Here is a form with every element:

```html
<form action="http://www.example.com/some_crud">
  <p> What do you listen on? </p>
  <select
  
