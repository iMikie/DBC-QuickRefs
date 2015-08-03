#Forms
Confession: I didn't completely master HTML forms the first time around. Maybe you're the same.  Here's a quick-ref, if you need more, kindle the [Duckett Book](http://www.htmlandcssbook.com).)  

By the way, I spent a day looking at all the helpers that Rails gives you for creating forms and I think they aren't worth it. 

##HTML Forms Quick Ref
* HTML forms consist of ***\<form\>*** tags containing ***\<label\>*** and *** \<input\>*** tags
* HTML forms end with a button that sends the form. 
* The *\<label\>* tag is just a *\<p\>* paragraph text tag that tells the browser to vocalize for vision impaired users.  
* Every *\<input\>* tag has a *name* attribute that becomes its variable name when sent to the server.  
* The *\<input\>* tag is placed either inside the *\<label\>* tag or besides it. Take a look:

```html
<form> tag
    <label>Username: <input type="text" name="username"/>  <!-- input tag is inside the lable tag -->
    
    <label for="passwd"> Password: </label>                <!-- here the label and input tag are separated, so -->
    <input id="passwd" type="password" name="password"/>    <!-- use *for* in label and *id* attribute in input tag -->
</form>
```
The button that dispatches the form to the server can be an input tag of type submet, or type image, or a button tag with both.

###Mother of all forms
Here's all the form elements in one form.  When all else fails, copy from here.

```html
<body>

<form action="http://www.example.com/some_crud">
    <label> Username:
        <input type="text" name="username"/>                              <!--text -->       
    </label><br>
    <label> Password:                                    
        <input type="password" name="password"/>                          <!--password -->
    </label><br><br>

    <label> What's your opinion of HTML forms?<br>
        <!--note <textarea> is inconsistent: should be <input type="textarea"> -->
     <textarea name="opinion" cols="30" rows="4">                         <!--textarea -->
       Enter your comment here.
     </textarea>
    </label>

    <p> Radio Buttons- what sucks the most?<br>                           <!--radio buttons -->
        <!-- now using the other label format -->
        <input id="css-radio" type="radio" name="language" value="css" checked="checked"/>
        <label for="css-radio"> CSS </label> <br>

        <input id="javascript-radio" type="radio" name="language" value="javascript"/>
        <label for="javascript-radio"> Javascript </label><br>

        <input id="java-radio" type="radio" name="language" value="java"/>
        <label for="java-radio"> Java </label><br>
    </p>

    <p> Checkboxes: what languages do you like?                            <!--check boxes -->
        <!-- note: I'm now leaving out <label> tags to make the rest readable -->
        <br>
        <input type="checkbox" name="good-language" value="ruby" checked="checked"/> Ruby
        <input type="checkbox" name="good-language" value="python"/> Python
        <input type="checkbox" name="good-language" value="livescript"/> Livescript
    </p>

    <p> Drop-down menu - what is your favorite computer?<br>               <!--drop down menu -->
        <select name="computers">
            <option value="mbp">Mac Book Pro</option>
            <option value="mba">Mac Book Air</option>
            <option value="mpro">Mac Pro</option>
        </select>
    </p>                                                                   <!--multi-select box -->
    <p> Multiple Select Box: what computers do you hate? (You can select more than one, use cmd-key on Mac, ctrl PCs)
    </p>
    <select name="computers" size="3" multiple="multiple">
        <option value="dell" selected="selected"> Dell</option>
        <option value="hp"> HP</option>
        <option value="lenovo"> Lenovo</option>
        <option value="asus"> ASUS</option>
    </select><br><br>
    <br>
    <fieldset>
      <legend> Contact details</legend>
        <label>Email:<br>
          <input type="text" name="email" />
        </label> <br>
        <label>Mobile:<br>
          <input type="text" name="mobile" />
        </label> <br>
        <label>Assistant:<br>
          <input type="text" name="assistant" />
        </label> <br>   
    </fieldset>
    
    <input type="submit" name="whew" value="Whew, Submit already"/>
</form>

</body>
```

####A file upload form would look like this:

```html
<form action="http://www.example.com/files/new" method="post">              <!--file upload -->
    <p> Upload the file: </p>
    <input type="file" name="document" /> <br>
    <input type="submit" value="Upload" />
</form>
```

####Instead of the submit buttons above, we could use:

```html
An image button:                                                             <!--image button -->
    <input type="image" src="images/do_it_now.jpg" width="40" height="20" />

or a image-text button:                                                      <!--<button> -->

    <button><img src="images/forget_it.jpg" alt="Just forget it" width="40" height="20"
    </button>
    
and finally, we'll have use for hidden fields with Rails when we need a value included with the form's result:

    <input type="hidden" name="userid" value="5" />                          <!--hidden field -->

```
##Here is what the above code yeilds:

![the unstyled forms] (Forms/form.png)



