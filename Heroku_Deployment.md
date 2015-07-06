##Heroku Deplyment
*note: heroku does't work with Ruby 2.1.0.  Use 2.1.2 or other*
<hr>
#### 0. Go to heroku.com and sign up, download the tool belt

####  1. Initialize heroku from within the .git 
```sh
heroku create     #will provide the heroku url (with name of app) and git heroku url
```

#### 2. See the git heroku url now added as a remote:
```sh
git remote –v
```
#### 3.	You can rename your git heroku url
  1.	Remove the remote 
  ```
  git remote remove heroku
  ```
  2.	Add in the new git heroku url with your new name, must be all lowercase.
  ```
  heroku git:remote –a [new heroku url name]
  ```

#### 4. Push up all your changes
  *	if you’re on the master branch, you can do 
  ```
  git push heroku master
  ```
  *	If you’re on a sub branch, you can do 
  ```
  git push heroku [branch-name]:master
  
  #	this says you want to push your local branch to a remote master 
  #	the only thing that is deployed will be Heroku master
  ```

#### 5.	Deploy super early and super often!!
  *	For example : once you have your index page up
  *	It takes time to deploy
  *	Every time you deploy, it’ll run bundle

*	Warnings
  *	read your warning messages!

#### 6. Open your Heroku site in your browser

```sh
heroku open
```
#### 7. see running heroku log
```
heroku log
```

#### 7. Dump the sample database and load your own
```sh
heroku pg:reset DATABASE_URL
```
  *	The DATABASE_URL option takes the database attached to your application
  *	It's destructive: you are resetting the current heroku database with the one on your local machine
  *	It will throw a warning and ask you to type in the name of your heroku url to verify 
    *	*(Just because you have a database on your local machine, it’s not pushed up to heroku automatically)*
  *	It's similar to doing rake db:drop (since it drops the heroku database) and rake  db:create (since it creates the database from your local machine associated with your application)

#### 8. Migrate your database now that it’s loaded
 ```
heroku run rake db:migrate
```
#### When you make a chamge
```
heroku restart
```
