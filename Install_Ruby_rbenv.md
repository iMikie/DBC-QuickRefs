### Ruby Versions, Gem Versions
I recently started learning Ruby (2/15) and one of the first things I ran into was not having the right version of Ruby installed.  (Macintosh comes with Ruby but mine was an older version).  Such problems have lead to the rise of of the Package Manager. 

### Package Managers
Package managers appear to have been invented because downloading and compiling sources, (or even just running programs on the 70's tech that is UNIX) requires multiple code libraries that each depend on different versions of the other is an impossibly mind numbing task.

**MacPorts** is one package manager, but I read a lot of posts and chose **Homebrew**. (Actually I'm running both, and have tried to careful about it but this is fraught with peril I'm told.) Using Homebrew you can download a Ruby version control system called **rbenv**.   rbenv lets you switch back and forth between versions of Ruby at will and handles all the myriad of problems this implies.  rbenv handles every Ruby command across every installed version of Ruby—irb, gem, rake, rails, ruby, and so on. Remarkable actually and pretty rock solid.

Compatibility note: rbenv is incompatible with another Ruby version manager RVM. (Confused yet?) You'll have to uninstall RVM and remove any references to it from your shell.  I'm guessing the only reason you'd be reading this is if RVM didn't work for you.

(This is described in some detail at [sstephenson's github](https://github.com/sstephenson/rbenv).) rbenv appears to be a community standard. To get this I had to first download Homebrew. Type the following into a terminal.  (Don't type the '$', that's supposed to represent your bash prompt.)


    $  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

(You can also get this command from the homebrew Mac site) then:

   $   brew update
   $   brew install rbenv ruby-build

   
  This will get you the updated list of packages that homebrew knows about including latest ruby-build.  
  
  Now you also need to have "rbenv init" run when you start up your bash shell so type this at your command prompt:

	    $ echo 'eval "$(rbenv init -)"' >> ~/.bash_profile


This will add (or 'cat', short for catenate, short for concatenate, I'm told) that cryptic command line into your .bash_profile file.  You can also just vi the rbenv init command into your .profile file, the file of stuff that the bash shell executes when it starts up. 

Now quit and restart Terminal. 

Now type: 

    $ rbenv install -l
    
This will flood your screen with all the versions of Ruby you can install.  According to [ruby-lang,org](https://www.ruby-lang.org/en/downloads/), the current stable Ruby is 2.2.1 as of this blog post but the latest in the list appears to be 2.2.0 that's not a developer version.  Version 2.1.2 was a popular version, for example used by lots of online rspec examples and the famous [Ruby on Rails Tutorial](https://www.railstutorial.org/book) by Michael Hartl.  Now you can pick a version from the list and install a newer version of Ruby using 

    $ rbenv install 2.1.2

OK, when that's finally done, type this:

	$ rbenv versions

You should see something like this:

    * system (set by /Users/Michael/.rbenv/version)
    2.1.2


Let’s switch:

	$ rbenv local 2.1.2

Now type: 

	$ ruby -v

You’ll see something like: 

 	ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-darwin14.0]

You are now using ruby 2.1.2

Next blog post about searching for and installing cool Gems.
