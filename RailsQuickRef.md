###Rails Quick Ref


###Resource Routes
A resource is something you'd like to CRUD, like a User.  Rails URL routes, method names are as follows:

|Restful   |   Description |HTTP Verb |  link_to URL GenCode   | URL   |  Controller Method|
-----------|--------------|-----------|-------------------------|-------|--------------|
Read       | list all     | get      | users_path              |/users  | def index|
           | list one   |  get       | user                  |  / user/:id | def show  |
Create     | new (form)|  get  | new_user_path       |/users/new  | def new |
          | create user | post   | ???                   | /users    | def create |
Update    | edit (form)   | get  | edit_user_path(user) | /users/:id/edit  | def edit |
           | save changes  | put | ???          |         /users/:id    |  def edit |
Delete   | delete record  | delete | user, method: :delete  |  users/:id  | def delete |


*Note that Put, Delete, don't actually exist and are faked by hidden fields in the form by rails.*
Example: 
```erb
<%= link_to "text", tweet.zombie %> #model instance = show
<%= link_to "Edit", edit_tweet_path(tweet) %>
<%= link_to "Destroy", tweet, method: :delete %>
```
