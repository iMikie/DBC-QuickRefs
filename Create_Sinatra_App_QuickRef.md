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
5. The gem file may require a version of ruby that you don't have.  You will have to switch versions of Ruby. If you don't know how to do this see [Install_Ruby_rbenv.md](https://github.com/iMikie/DBC-QuickRefs/blob/master/Install_Ruby_rbenv.md)

6. Following your previously created database schema, issue the rake command:
