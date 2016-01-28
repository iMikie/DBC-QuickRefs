### Forking  from DevBootCamp
* Go to the repo online at devbootcamp.
* Click fork on master on that page 
	select my gitHub username
* Now I should have it I’m my GitHub

To clone use Terminal on the local machine: 
```sh

git clone <URL from my forked master on GitHub> --this will create a folder
cd <repo name>
git co master
```

Add a remote by getting the URL from the DevBootCamp
```sh
    git remote add upstream <URL from DevBootCamp>
```
Now add changed files:
```sh
    git add .
```
You can add files individually by name but this appears to add all that changed. Now commit:
```sh
    git commit -m "practice making a change"
```
To push changes to the remote use:
```sh
    git push origin master
```
Use a -f flag to force the update if you don't care about a conflict.

Now make a branch:
```sh
git checkout -b addEarlierReflections master
```
Make some changes. Then:
```sh
git add .
git commit -m "added earlier reflections"
git checkout master
git merge addEarlierReflections
git push origin master
```
Next, try to pull changes from the DevBootCamp remote and merge.
```sh
git pull upstream master
```
This did the fetch and merger.  
```sh
git fetch upstream master 
```
would have just done the fetch.  

I had to add a commit message: git opened Sublime with a file for me to fill out. 

To see what's going on and what files have been changed you can use:
```sh
git status
```
or you can use the log and show or diff commands.  Log will get you the commit numbers:
```sh
git log
```
then you can get info about each commit.
```sh
git show 4903e0a0737f6c12ae7a0bb221efcb20f92d3679
```
This command will tell you which files have changed in concise form.
```sh
git diff-tree --no-commit-id --name-only -r a3525cc73a674c39609240c950d41c56df1f1f36
```
* The --no-commit-id suppresses the commit ID output.
* The --pretty argument specifies an empty format string to avoid the cruft at the beginning.
* The --name-only argument shows only the file names that were affected (Thanks Hank).
* The -r argument is to recurse into sub-trees

When there is a conflict, the commit command will tell you.  You can also use the show command.  Look for which file(s) have conflicts and then edit the files to see which you need to do to clean them up.  Text indicating the diffs (as descried above) will be inserted into the file.  Delete the text from one of the diffs shown in the file and save.  Now you can git add and git commit.



