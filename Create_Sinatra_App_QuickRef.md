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
  *Here is a sample with a many-to-many
    ![Sample Schema](images/schema.png)
 
 
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
5. The gem file may require a version of ruby that you don't have.  You will have to switch versions of Ruby. If the version mentioned listed in your *Gemfile* is very close to the ruby you have installed, you can try simply changing that line. 

```sh
	ruby '2.1.0' #=> 2.1.2
```
Or, you may have multiple versions of Ruby installed.  Tye * rbenv versions * at the terminal to see if you have rbenv installed. If you don't, type *rvm*.  I don't know rvm so if you don't have either on your machine check this out: [Install_Ruby_rbenv.md](https://github.com/iMikie/DBC-QuickRefs/blob/master/Install_Ruby_rbenv.md) Once you have rbenv: 

```sh
    ruby -v                #shows what version of ruby you are running<br>
    rbenv versions         #shows which versions of ruby you have installed
    rbenv install 2.1.0    #install ruby 2.1.0 if you don't have it already
    rbenv local 2.1.0      #switch to 2.1.0 (or whatever version)
    ruby -v                #verify the switch
```

6. Following your previously created database schema, let's create some tables.  Note how the names match the schema and are related to each other. This is an ActiveRecord convention and is necessary or your Sinatra and Rails apps will break mysteriously.  Especially take note of the name of the junction (join) table and Model Class for performances-songs.

    ```sh
    rake generate:migration NAME='create_songs'
    rake generate:migration NAME='create_performances'
    rake generate:migration NAME='create_performances-songs'
    rake generate:migration NAME='create_users'
    ```
    
7. Now let's create the Model files.  Note the lack of 's' on *PerformancesSong*.

    ```sh
    rake generate:model NAME='Song'              # will create app/models/song.rb
    rake generate:model NAME='Performance'       # will create app/models/song.rb
    rake generate:model NAME='PerformancesSong'  # will create app/models/performances_song.rb, note: NOT: "performances_songs"
    rake generate:model NAME='User'              # will create app/models/song.rb
    ```
    
8. Check out the app/Models and app/db directories: <br>
![Models and DB folder after rake:generate commands](images/models_and_db_folders.jpg)

9. Now fill in your model objects in **app/models/** with validations and create your tables in files in **db/migrations**.
