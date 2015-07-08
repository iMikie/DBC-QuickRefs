###Rails Quick Ref

####Starting
```sh
rails --version                             #see if you have rails, and which version
sudo gem install rails		#this gets the rails framework which  an create a new, template rails app
sqlite3   #to start sql database
or start postgres application
```
####Start the database, run the server
```sh
bin/rails db:create
bin/rails server
```
You should now be able to go to http://localhost:3000 and see rails running.

At this point you should have your DB schema, know your resources, and wireframed your basic pages.  Now create the controller for one of your resources. IN my case:

```sh
 bin/rails generate controller users
```
I now have a blank users_controller.rb file.  Now it's time to start thinking about my RESTful routes.  


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


*Note that Put, Delete, don't actually exist and are faked by hidden fields in the form by rails.*<br>

Rails can generate links for you without hard coding.  I'm not sure this is actually any easier but here's an example of how to use the link_to URL GenCode listed above.
<br>

```ruby
<%= link_to "Author", tweet.zombie %> 
<%= link_to "Edit", edit_tweet_path(tweet) %>
<%= link_to "Destroy", tweet, method: :delete %>
```


For User, I've written one of these before so I'm going to copy it here.
```ruby
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    session[:user_id] = nil
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    session[:current_user_id] = nil
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    session[:current_user_id] = @user.id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
  ```

####User Model
Now it's time to create the database table for Users and the Model.  Unlike Sinatra this is done at the same time as the Model.

```sh
$ bin/rails generate model User username:string email:string password_hash:string phone_number:string
```

This creates a bare bones db migration file to which I've added limits and an empty Model file to which I've added validations and the BCrypt password stuff.  

**Data Table for users**
```ruby
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username,  limit: 50
      t.string :email, limit: 50
      t.string :password_hash
      t.string :phone_number, limit: 24

      t.timestamps null: false
    end
  end
end
```

**Model for User **

```ruby
class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :phone_number, :presence => true
  validates :password, :presence => true
  validates :password, length: { minimum: 6 }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end
```


