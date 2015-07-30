#Forms, Form tags, Link_to etc.

By the time you get to Rails you will have to master form tags and link_tos which are so bloody confusing that no one does. Except you, now.

Let's start with forms.  I really didn't master them in HTML and maybe you didn't either.  (My favorite source is the [Duckett Book](http://www.htmlandcssbook.com) ).  

In short, forms consist of a \<form\> \</form\> tag containing \<label\> - \<input\> tag pairs.

```html
<form> tag
    <label for="username"> Username \</label>  <!-- label and input tags separate, use id= -->
    <input id="username" type="text"/>   
    <label>Password <input type="password" name="password"/>  <!--input tag inside lable tag -->
</form>
```
The <label> tag is basically a <p> paragraph text tag,  but also tells the browser to vocalize the text for vision impared users.  To pair the label with an <input> tag,  put the <input> tag inside the <label>...</label> tag or give the <input> tag a CSS id attribute and use <label for="some_id_name">. 

Types of <input> tags: text, textarea, password, radio, checkbox, select (drop-down menu or scrolling list), file(as in file upload, not sure how you receive it on the other end), submit, image, button, fieldset-legend, hidden.  

Here is a form with every element:

```html
<form action="http://www.example.com/some_crud">
  <p> What do you listen on? </p>
  <select
  
