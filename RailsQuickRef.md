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

***Data Table for users***
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

***Model for User***

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

###Add the remaining resources
I have a songs table and a performances table to add.  So here goes.

```sh
$ bin/rails generate model Song song_number:integer title:string composer:string larger_work:string arranger_one: string arranger_two: string voicing:string category:string 
```

Now I flesh out the Song model with validations and associations, and I'll add some limits to the db:migration.

***songs Table***
```ruby
class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.integer :song_number
      t.string  :title, limit: 64
      t.string  :composer, limit: 64
      t.string  :larger_work, limit: 64
      t.string  :arranger_one, limit: 64
      t.string  :arranger_two, limit: 64
      t.string  :voicing, limit: 8
      t.string  :category

      t.timestamps
    end
  end
end
```

***Song Model***

```ruby
class Song < ActiveRecord::Base
  validates :song_number, :presence => true
  validates :title, :presence => true

  has_many :performance_songs
  has_many :performances, :through =>  :performance_songs
end
```
###And finally for Performances and for the join table that will relate songs to the performances they are in.

```sh
$ bin/rails generate model Performance title:string date:date performance_time:time call_time:time location:string 

$ bin/rails generate model PerformanceSong performance_id:integer song_id:integer
```
Now I flesh out the migration and Model files for performances and performance_songs.  

***Performance Migration***

```ruby
class CreatePerformances < ActiveRecord::Migration
  def change
    create_table  :performances do |t|
      t.string    :title, limit: 50
      t.date      :date
      t.time      :performance_time
      t.time      :call_time
      t.string    :location
      t.string    :event_leader
      t.string    :leader_phone

      t.timestamps

    end
  end
end
```

***Performance Model***

```ruby
class Performance < ActiveRecord::Base
  validates :title, :presence => true
  validates :date, :presence => true 

  has_many :performance_songs
  has_many :songs, :through =>  :performance_songs  #enables Performance.first.songs
                                                    #enables you to add a song to a performance:
                                                    # @performance.songs << @song
end
```

***Performance_Songs data Table***

```ruby
class CreatePerformanceSongs < ActiveRecord::Migration
  def change
    create_table :performance_songs do |t|
      t.integer  :performance_id
      t.integer  :song_id

      t.timestamps
    end
  end
end

```

***PerformanceSong Model***

```ruby
class PerformanceSong < ActiveRecord::Base
  validates :performance_id, :presence => true
  validates :song_id, :presence => true

  belongs_to :performance
  belongs_to :song

end
```
###Migrate and seed
I create the table with bin/rake db:migrate.  Now it's time to seed the database.  I have a CSV file full of song data already.  To this I'll create a performance and add a couple of songs to it.  (One of the songs is new to the group so I'll have to add it after processing the CSV.

```ruby
require 'CSV'


def import_CSV_of_songs
  headers = [:title, :song_number, :composer, :arranger_one, :arranger_two, :voicing, :category]
  csv_text = File.read("db/SOTS_Library.csv")
  song_hash = {}
  csv_array = CSV.parse(csv_text) do |row|
    row.each_with_index { |element, index| song_hash[headers[index]] = element }

    song_hash[:song_number] = song_hash[:song_number].to_i
    song = Song.create!(song_hash)
  end

end

import_CSV_of_songs



as_game = Performance.create( title: "Oakland A's game",
                    date: Date.new(2015, 7, 10),
                    performance_time: Time.new(2015, 7, 10, 19, 05, 0),
                    call_time: Time.new(2015, 7, 10, 17, 0, 0),
                    location: "Suites entrance which is located in between  the A's coliseum and the Oracle Arena where the Warriors play. It's on the top of the walkway",
                    event_leader: "Saverio DeLuca",
                    leader_phone: "(925)788-5252")

star_spangled_banner = Song.where(song_number: 350).first
as_game.songs << star_spangled_banner

canadian_anthem = Song.create(song_number: 1075, arranger_one: "Herb Goodrich", voicing: "TTBB with Trumpet", category: "Patriotic Anthem")

as_game.songs << canadian_anthem
```
###Making a change

I put too tight a limit on one of my fields so I need to generate a change migration.  

```sh
bin/rails generate migration ChangeTTBBLengthLimit
```
Here's the finished migration:
```ruby
class ChangeTtbbLengthLimit < ActiveRecord::Migration
  def change
    change_column :songs, :voicing, :string, :limit => 64
  end
end
```
###Getting things to work

OK, so the seeding went well.  Just had to change the Voicing field length.  Now it's time to get something running.  

My home page will eventually be an advertisement for the singing group's next performance so I'll create a welcome page.  Let's see about creating a Welcome controller.

```ruby
bin/rails generate controller welcome index
```
 
 This is creating a bunch of files some of which I'll delete:
 
 ```sh
 create  app/controllers/welcome_controller.rb
create the route  get 'welcome/index'
create    app/views/welcome
create    app/views/welcome/index.html.erb
create    test/controllers/welcome_controller_test.rb
create    app/helpers/welcome_helper.rb
remove the following:
   create      app/assets/javascripts/welcome.js.coffee
   invoke    scss
   create      app/assets/stylesheets/welcome.css.scss
```


#Simple Authentication with Bcrypt

This tutorial is for adding authentication to a vanilla Ruby on Rails app using Bcrypt and has\_secure\_password. 

The steps below are based on Ryan Bates's approach from [
Railscast \#250 Authentication from Scratch (revised)](http://railscasts.com/episodes/250-authentication-from-scratch-revised). 

You can see the final source code here: [repo](https://github.com/thebucknerlife/gif_vault). I began with a stock rails app using ``` rails new gif_vault ```

##Steps

1. Create a user model with a name, email and password\_digest (all strings) by entering the following command into the command line: ``` rails generate model user name email password_digest ```. 

    *Note:* If you already have a user model or you're going to use a different model for authentication, that model must have an attribute names password\_digest and some kind of attribute to identify the user (like an email or a username).
2. Run ``` rake db:migrate ``` in the command line to migrate the database.
3. Add these routes below to your routes.rb file. Notice I also deleted all the comments inside that file. Don't forget to leave the trailing ``` end ```, though.
    
    ```ruby
    # config/routes.rb

    GifVault::Application.routes.draw do
        
        # This route sends requests to our naked url to the *cool* action in the *gif* controller.
        root to: 'gif#cool'
        
        # I've created a gif controller so I have a page I can secure later. 
        # This is optional (as is the root to: above).
        get '/cool' => 'gif#cool'
        get '/sweet' => 'gif#sweet'

        # These routes will be for signup. The first renders a form in the browse, the second will 
        # receive the form and create a user in our database using the data given to us by the user.
        get '/signup' => 'users#new'
        post '/users' => 'users#create'

    end
    ```
    
3. Create a users controller: 

    ```ruby
    # app/controllers/users_controller.rb
    
    class UsersController < ApplicationController

    end
    ```
    
4. Add a **new** action (for rendering the signup form) and a **create** action (for receiving the form and creating a user with the form's parameters.): 

    ```ruby
    # app/controllers/users_controller.rb
    
    class UsersController < ApplicationController

        def new
        end

        def create
        end   

    end
    ```
    
5. Now create the view file where we put the signup form. 

    ```html+erb
    <!-- app/views/users/new.html.erb -->
    
    <h1>Signup!</h1>

    <%= form_for :user, url: '/users' do |f| %>

      Name: <%= f.text_field :name %>
      Email: <%= f.text_field :email %>
      Password: <%= f.password_field :password %>
      Password Confirmation: <%= f.password_field :password_confirmation %>
      <%= f.submit "Submit" %>

    <% end %>
    ```
   *A note on Rail's conventions:* This view file is for the **new** action of the **users controller**. As a result, we save the file here: ``` /app/views/users/new.html.erb ```. The file is called **new**.html.erb and it is saved inside the views folder, in a folder we created called **users**. 
   
   That's the convention: view files are inside a folder with the same name as the controller and are named for the action they render.
    
6. Add logic to **create** action and add the private ``` user_params ``` method to sanitize the input from the form (this is a new Rails 4 thing and it's required). You might need to adjust the parameters inside the ``` .permit() ``` method based on how you setup your User model.

    ```ruby
  class UsersController < ApplicationController

    def new
    end

    def create
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/signup'
      end
    end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
    ```

7. Go to your Gemfile and uncomment the 'bcrypt' gem. We need bcrypt to securely store passwords in our database. 

    ```ruby
    source 'https://rubygems.org'

    # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
    gem 'rails', '4.0.4'

    # Use sqlite3 as the database for Active Record
    gem 'sqlite3'

    ...

    # Use ActiveModel has_secure_password
    gem 'bcrypt', '~> 3.1.7'

    ...
    
    ```
    
7. Go to the User model file and add ``` has_secure_password ```. This is the line of code that gives our User model authentication methods via bcrypt.

    ```ruby
    # app/models/user.rb
        
    class User < ActiveRecord::Base

      has_secure_password

    end
    ```
    
9. Run ``` bundle install ``` from the terminal then restart your rails server.

   *Note:* Windows users might have issues with bcrypt. If so, copy the error into Google and look for answers on Stack Overflow. There is documentation online for how to fix Windows so the bcrypt works.
   
10. Create a sessions controller. This is where we create (aka login) and destroy (aka logout) sessions.

    ```ruby
    # app/controllers/sessions_controller.rb
    
    class SessionsController < ApplicationController

      def new
      end

      def create
      end

      def destroy
      end

    end
    ```
    
11. Create a form for user's to login with.

    ```html+erb
    <!-- app/views/sessions/new.html.erb -->
    
    <h1>Login</h1>

    <%= form_tag '/login' do %>

      Email: <%= text_field_tag :email %>
      Password: <%= password_field_tag :password %>
      <%= submit_tag "Submit" %>

    <% end %>
    ```
    
12. Update your routes file to include new routes for the sessions controller.

    ```ruby
    GifVault::Application.routes.draw do

      root to: 'welcome#index'

      # these routes are for showing users a login form, logging them in, and logging them out.
      get '/login' => 'sessions#new'
      post '/login' => 'sessions#create'
      get '/logout' => 'sessions#destroy'

      get '/signup' => 'users#new'
      post '/users' => 'users#create'
      
     
    end
    ```

13. Update the sessions_controller with the logic to log users in and out.

    ```ruby
      # app/controllers/sessions_controller.rb
    
      def create
    user = User.where(username: (params[:username])).first
    # If the user exists AND the password entered is correct.
        if user && user.authenticate(params[:password])
          # Save the user id inside the browser cookie. This is how we keep the user 
          # logged in when they navigate around our website.
          session[:user_id] = user.id
          redirect_to '/'
        else
        # If user's login doesn't work, send them back to the login form.
          redirect_to '/login'
        end
      end

      def destroy
        session[:user_id] = nil
        redirect_to '/login'
      end
    ```
    
14. Update the application controller with new methods to look up the user, if they're logged in, and save their user object to a variable called @current\_user. The ``` helper_method ``` line below current\_user allows us to use ``` @current_user ``` in our view files. Authorize is for sending someone to the login page if they aren't logged in - this is how we keep certain pages our site secure... user's have to login before seeing them.

    ```ruby
    # app/controllers/application_controller.rb
    
    class ApplicationController < ActionController::Base
      # Prevent CSRF attacks by raising an exception.
      # For APIs, you may want to use :null_session instead.
      protect_from_forgery with: :exception

      def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      end
      helper_method :current_user

      def authorize
        redirect_to '/login' unless current_user
      end

    end
    ```

15. Add a ``` before_filter ``` to any controller that you want to secure. This will force user's to login before they can see the actions in this controller. I've created a gif controller below which I'm going to secure. The routes for this controller were added to the routes.rb in the beginning of this tutorial.

    ```ruby
    # app/controllers/song_controller.rb

    class SongController < ApplicationController

      before_filter :authorize

      def cool
      end

      def free
      end

    end
    ```

16. You can update your application layout file to show the user's name if they're logged in and some contextual links.

    ```html+erb
    <!-- app/views/layout/application.html.erb -->
    
    <!DOCTYPE html>
    <html>
    <head>
      <title>GifVault</title>
      <%= stylesheet_link_tag    "application", media: "all", "data-turbolinks-track" => true %>
      <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
      <%= csrf_meta_tags %>
    </head>
    <body>

    # added these lines.
    <% if current_user %>
      Signed in as <%= current_user.name %> | <%= link_to "Logout", '/logout' %>
    <% else %>
      <%= link_to 'Login', '/login' %> | <%= link_to 'Signup', '/signup' %>
    <% end %>

    <%= yield %>

    </body>
    </html>
    ```
###Routes

Rails.application.routes.draw do
 
  resources :articles
 
  root 'welcome#index'
end


###New Controller
