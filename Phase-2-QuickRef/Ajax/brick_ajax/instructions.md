
##AJAX STEPS
1) capture the event and attach an action to it  
2) prevent the event from doing it's default action  
3) determine the request path using jQuery  
4) make a request to the server using AJAX  
5) update the controller to handle the AJAX request  
6) retrieve the data passed back (with a callback function that will execute when the ajax call is done)  
7) update the page accordingly by manipulating the DOM  



##Implementing AJAX in steps w/ our tools

####Capturing the Event - JS CONSOLE
1) capture an event and attach an action to it (test w/ console.log)  
2) prevent the normal default action of the event  

####Determining the Request Path - JS DEBUGGER
3) capture the path of the button form w/ jQuery (use debugger and test `this` and `event`)

####Create XHR request - SERVER LOG
4) create the ajax request  
5) update the controller and test if request is reaching the server (puts statements!)  

####Recieve XHR Response - JS CONSOLE
6) return a JSON string w/ appropriate data (test the #done method w/ console.log to see `response`)  

####Update The Element - JS CONSOLE
7) select the correct element and update it (use console to create correct Jquery)  
