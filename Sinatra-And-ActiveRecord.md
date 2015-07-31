#Creating a Sinatra Web App
Mike Farr <br>
sf-dragonflies-2015

###Prerequisites, you must have:
* **ruby** and **rbenv** installed:
 * QuickRef: [Install_Ruby_rbenv.md](https://github.com/iMikie/DBC-QuickRefs/blob/master/Install_Ruby_rbenv.md)
* **bundler** installed:
  ```
gem install bundler 
  ```
* Created your User Stories.
* Created your database Schema.

From the example in the SQL QuickReference we have this schema:

![Bands - Musicians](/images/schema.jpg)

 
##Let's get started with Sinatra
1. Clone or fork the Sinatra Skeleton [from this repository] (https://github.com/sf-dragonflies-2015/sinatra-skeleton-mvc-challenge)
 * Not sure how? See [the Git and GitHub section (p. 14) of this QuickRef] (https://github.com/iMikie/DBC-QuickRefs/blob/master/PDFs%20Latest/QuickRefs_Ruby_github_more.pdf)
  
2. Create your own branch (so as to  make sure you don't later accidentally push to master.  Not necessary if you forked from GitHub.)
```sh
    git checkout -b my_branch
```
3. Do a bundle exec to read your Gemfile and install/update any Gems required. 

    ```sh
    bundle exec #within the root directory of the skeleton
    ```
4. From now on all our terminal commands will look like ***bundle exec command***.  This will cause the *command* to be run in the context of the gems (and even their specific versions) mentioned in the Gemfile.  You may want to add this command to your .bash_profile file in your home directory.  This way you can type 'be' instead of 'bundle exec'.

    ```sh
    alias be="bundle exec"
    ```
5. If you are doing this at home, the gem file may complain that it uses a version of ruby that you don't have.  You will have to switch versions of Ruby. If you don't know how to do this see [Install_Ruby_rbenv.md](https://github.com/iMikie/DBC-QuickRefs/blob/master/Install_Ruby_rbenv.md) Once you have rbenv: 
 
    ```sh
    ruby -v                #shows what version of ruby you are running
    rbenv versions         #shows which versions of ruby you have installed
    rbenv install 2.1.0    #install ruby 2.1.0 if you don't have it already
    rbenv local 2.1.0      #switch to 2.1.0 (or whatever version)
    ruby -v                #verify the switch
    ```

6. Following our previously created database schema, let's create some tables.  Note how the names match the schema and are related to each other. This is an ActiveRecord convention and is necessary or your Sinatra and Rails apps will break mysteriously.  Especially take note of the name of the junction (join) table band_musicians, and Model Class for performance-songs.
  **Table names are plural**

 
    ```sh
    rake generate:migration NAME='create_bands'               #create db/migrate/20150613183845_create_bands.rb
    rake generate:migration NAME='create_musicians'        #create db/migrate/20150613183853_create_musicians.rb
    rake generate:migration NAME='create_band_musicians'  #create db/migrate/20150613183946_create_bands_musicians.rb
    ```
    
7. Now let's create the Model files.  Note the lack of 's' on *PerformancesSong*.
  **Note: model names are singular**
    ```sh
    rake generate:model NAME='Band'              # will create app/models/band.rb
    rake generate:model NAME='Musician'       # will create app/models/musician.rb
    rake generate:model NAME='BandsMusician'  # will create app/models/bands_musician.rb, note: NOT: "bands_musicians"
    ```
    
8. Check out the files in the app/Models and app/db directories that were created for you: <br>
![Models and DB folder after rake:generate commands](images/models_and_db_folders.jpg)

9. Now fill create your table "migrations" using the stubs in **db/migrations** and fill in your model classes in **app/models/** with validations and associations. Here is what the migrations would look like for the above. If this is a mystery, [try this link.](http://edgeguides.rubyonrails.org/active_record_migrations.html)

```ruby
class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, limit: 50
      t.string :most_popular_album, limit: 50
      t.string :record_label, limit: 50
      t.string :ASCAP, limit: 50
      
      t.timestamps
    end
  end
end
class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name, limit: 50
      t.string :status, limit: 25
      
      t.timestamps
    end
  end
end
#Note: table names in migrations are plural.  if compound, then singular_plural, or just rename the table like "projects" below
#note: class names are singular
class Project < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.references   :band_id
      t.references   :musician_id
      
      t.timestamps
    end
  end
end
```

8. Here's what the model objects would look like with validations and associations. If this is a mystery, [try this link](http://guides.rubyonrails.org/association_basics.html)

```ruby
class Song < ActiveRecord::Base
  validates :song_number, :presence => true, :uniqueness => true
  validates :title, :presence => true

  has_many :performances_songs
  has_many :performances, :through =>  :performances_songs    #this is how you do a many-to-many
end

class Performance < ActiveRecord::Base  
  validates :title, :presence => true
  validates :date, :presence => true

  has_many :performances_songs             
  has_many :songs, :through =>  :performances_songs           #this is how you do a many-to-many
end

class PerformancesSong < ActiveRecord::Base
  validates :performance_id, :presence => true
  validates :song_id, :presence => true

  belongs_to :performance
  belongs_to :song

end

class User < ActiveRecord::Base
  include BCrypt

  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :phone_number, :presence => true
  validates :password_hash, :presence => true
end
```

9. Now go ahead and rake your model: do your migrations to actually create the database and your parallel ruby classes.

```sh
be rake -T
be rake db:create
be rake db:migrate
```

10. Now you should be able to do a 

```sh
be shotgun
```

and, opening a second terminal, you shoud be able to enter ActiveRecord commands to take a look at your database.



@order = @customer.orders.create(order_date: Time.now), append to order array, fill in customer_id
has_many
belongs_to
has_many_and_belongs_t
