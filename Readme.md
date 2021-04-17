##### git install
```
yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev

yum install git
apt-get install git
```

##### Basic commands 

```
git --version #to check the version of git
which git ## 
git init ## it create .git folder with meta information, also to start the repo
git status ## reports back with output of status , reviews the status of git files version  
git add . ## will add everything to git repo, it will stage the files ,
git commit -m "init commit " ## will add commit -m defines message 
git remote add origin <url> ## it will add the url to remote repo
git clone ## to c

lone the repo to local or remote server from git repository 
git clone <<url>> 
git clone <<url>> <FOLDER> ## u can define desitnation 
git clone git@github.com:username/projectname.git ## SSH git version

git init --bare /path/to/repo.git ## Sharing code, minimize the space on the remoteserver,  .git objects,
##cant create a working copy in the filesystem , remomte as an uppstream server to easily share updates with arguments 
git remote add origin ssh://username@server:/path/to/repo.git ## on the local machine
git push --set-upstream origin master ## git --set-upstream created upstream (tracking) ref which is used by argument-less GIT 
git pull 

```

##### gets the information of configured user. helps in determining 
to declare the identitification for a single repo , use git config 
```
git config --global ## $HOME/.gitconfig , %USERPROFILE%\.gitconfig  
git config --global user.name "Your Name"
git config --global user.email mail@example.com
git config --global --remove-section user.name
git config --global --remove-section user.email
git config --global user.useConfigOnly true ## to force git to look for your id, only within a repo settings.


git remote -v ## will show fetch and push of th repo details 
git remote set-url upstream <url>
git remtoe add upstream <url> #we can add colleagues fork if we dont have it 
git remote add dave https://github.com/dave/repo.git ###

```

##### to compare and u can use --help command to know the command aruguments 
```
git diff --help
git help diff
git status --help 
git help status 
git checkout -h
```

#### setting up the git is easy 
```
ls -al ~/.ssh ## can be found with 
## id_dsa.pub 
## id_rsa.pub
## generate sshkey
ssh-keygen -t rsa 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git remote set-url origin ssh://<url>
```

### git history or logging information 
```
git log 
git log -2 # shows last commit
git log --decorate --oneline --graph  ## shows graph of the merge 
git config --global alias.lol "log --decorate --oneline --graph" ## u can assign it alias by alais.lol
git lol
git lol HEAD develop origin/master
git lol -all
git log --graph --pretty=format:'%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr)%C(yellow)<%an>%Creset'
git log -2 --oneline ## shows in one line with 
git log -S"#Searchword"
git log -G"#define SAMPLES" ## -G will search for regexp
git shortlog ## summarizes git log and groups 
git shortlog -s ###  -n numbered, -e email , --format 
git log --all --grep "removed file" 
git log --grep="add file" --invert-grep
git log -L 1,20:index.html 
diff --git a/index.html b/index.html
git log --after '3 days ago'
git log --after 2016-05-01
git log --author=author
git log --patch ## changes inline
git log --stat  ## shows comited lines 
git show ##single comit 
```

##### Working with remotes
```
git push <<name>> --delete <<branch>>
git fetch --all --prune ### prune deleted branches from all remote 
git fetch remote-name
git merge remote-name/branch-name
git pull --rebase remote-name branch-name ## pulls all the rebased flags 
git pull 

git ls-remote --ref ## resolve the actual url used
##From https://github.com/Omkar219/LinuxCheatsheet.git
##6a46a7a634dbc3430168542d9b005ae2d5b752        refs/heads/master
git remote add upstream git-repository-url
git checkout -b KA-02 ## creates new branch -b
git push --set-upstream origin AP-57 ### upstream this to be pushed , just do git push to pyush
git remote rename origin destination ## to rename destinatin 
git remote get-url origin ### shows information of the origin urlk
git remote set-url remote-name <<url>> ## sets the origin url
git remote set-url omkar219 <url> ##
```

#### Git add perks
```
git add -A
git add --all
git add -p or git add --patch ### works of staged commit
git add --interactive ## more helpful in doubt 
>> revert ## will revert the cahgnes staged comit
>> patch can be used to remove 
>> diff will show what will be commited
>> quit will exit interactive mode.
git rm <file> ##remove staged
git rm --cached <file>

```
### how to make log files other files not to be pushed to gitrepo
```
Create .gitignore file >> innput the value of file locaiton with 

!.gitignore
*.log 
java/*.apk
!important.txt ## to ignore specific pattern .
!!includethis
\!excludethis ### using escape 
## we can also do 
.git/info/exclude file (using the same syntax as .gitignore). The rules will be global in the scope
of the repository;
##
git update-index --skip-worktree [<file>...]: for minor local modifications
git update-index --assume-unchanged [<file>...]: for production ready, non-changing files upst

git check-ignore ## To check what are the other files that are ignored
git config --global core.excludesfil ### define a global gitignore file path 
git status --ignored ### finding ingored files location
git status --ignored --untracked-files=all ## 


```
##### Undoing life
```
git checkout 789abcd 
## later reset it by soft
git reset --soft ## soft will roll back to previous commit 
git reset --hard ## will discard changes permanently  
git reset --hard/--soft HEAD~ ### discards any changes made after the last commmit 
```

##### Reflog 
```
git reflog 
git checkout HEAD@{3} ## check out the has for 3 
git reset --hard HEAD@{3} ## reseting hard
```

##### Undoing merges
```
get reset --hard <<last commit of that branch you were on>>
git reset HEAD~

#### example
git merge feature/added-css
git commit -m "added-css"
git push 

git revert -m 1 <the last commited hash>
git push 

### problem not yet over 
git checkout feature/added-css
git checkout master
git revert <lastcommithash>
git commit -m " merge "
git push
### fix the merge conflict that happened now 
git checkout feature/added-css
git merge master
git revert <last commithash>
git checkout master
git merge feature/added-cs
git commit -m "fixed merge conflict "
git push 

##### other examples using head
git revert HEAD~1
git push

##### 
git revert HEAD~1
git add -A .
git commit -m "updated"
git push 
git revert <last comit >
git push 
```

##### revert some existing commits 
```
git rebase -i <earlier SHA>
### finding all the no merged changes 
for branch in $(git branch -r) ; do
[ "${branch}" != "origin/master" ] && [ $(git diff master...${branch} | wc -l) -eq 0 ] && echo -
e `git show --pretty=format:"%ci %cr" $branch | head -n 1`\\t$branch
done | sort -r
######## GIT MERGE 
git merge --abort # aborting changes 
git merge <branch_name> --no-ff -m "<commit message>" ### merge resolves as a fast-forward, no need of merge commit
```

###### SUbmodules 
Submodule ref a sepcifiic commit in another repository , to check out exact state is ref for all sub-modules ,
```
git submodule add https://github.com/chaconinc/DbConnector
git status
#
# this will be seated on .gitmodules 
#[submodule "DbConnector"]
	path = DbConnector
	url = https://github.com/chaconinc/DbConnector
git submodule update --init --recursive ## this will clone 
git submodule update --recursive
git submodule foreach git pull <remote> <branch> ## this will udpate your local checkout to latest 
git submodule foreach git pull ### better than above 
git add <submodule direcotry>
git submodule update --remote --recursive
git submodule -b abranch -- /url/of/submodule/repo
cd /path/to/parent/repo
git config -f .gitmodules submodule.asubmodule.branch abranchv
```

##### GIT COMMIT 
```
git add -u # to add only currently tracked (update)
git add .
git add --all
git add -A 
git commit -am "commit and add"
git commit --amend
git commit --amend --reset-author ## but leaves author date untouched 
git commit --amend --no-edit ### use the previous commit message without changing
git commit -m "i have added this 1st " -m "2nd one is here added "
git commit -m "This is a blank commit" --allow-empty ## u can do empty commit 
git commit --amend --date="Thu Jul 28 11:30 2016 -0400" -m "add this "
```
##### .gitconfig
best for alias defination 


##### REBASING
LOCAL REBASING BRANCH 
rebasing reapplies a series of commits on top of the another commit
```
git checkout topic
git rebase master ## rebase current branch master
A---B---C topic
/
D---E---F---G master
#### Later after rebase 
                A'--B'--C' topic
/
D---E---F---G master
git rebase -i
git rebase -i HEAD~3
git rebase -i --root ### rebase down to initial commit 
git config --global rebase.autostash # one time configuration
git rebase @{u} ### AUTOSTASH
git rebase -i -x make ### Execute matke to check t otu , if it fails git will chance to fix it.

```
###### PROXY 
```
git config --global http.proxy http://proxyserver:portnumber
git config --global --unset http.proxy 
```
##### Branching

```
git branch <name>
git checkout <name>
git checkout -b <name>
git checkout -b <branch_name> <remote_name>/<branch_name>
git branch --all ## list remote and local branch
git branch -v ## verbos local branch
git branch -r ## list remote branch 
git branch -rv
git branch --merged ### lists merged branches
git branch --contains ## (contains commit)

git push origin :<branch> 
git push origin --delete <branch>
git branch --delete --remote 
git branch -dr 
git fetch --prune ## delete multiple obsolete tracking branches
git fetch -p

git branch -d <name> ## deletes branch local
git branch -D <name> ## delete a branch even if it has unmerged chantges
git checkout - ## to switch to previous branch 

git checkout --orphan <orphan branch>
git branch -m <rename> ## rename a branch 

git branch --contains <commits> ## to sreach in branches
git branch -a --containers <comit> ## to local remote that contains specific commit/tag

git push <remotename> <branch_name>
git push -u <remotename> <branch_name> ## up-stream branch 

```

###REV_LIST 
git rev-list , helps us in understanding if the merge has happened or not 

git rev-list --oneline master ^origin/master

> git merge --squash ## using to squashing commit durnign merge 
> git reset --soft $(git merge-base master <branch>) 

###### CHERRY PICKING 
```
git checkotu mmaster
git cherry-pick <#hashcommit> ## apply the changes made in an existing commit to another branch
## u can copy commits from branch to branch 
git checkout master
git cherry-pick b886a0 A886a0 C886a0 
git branch --contains <<commit>> ## local tracking changes 
git branch -r --contains <<commit>>## remtoe tracking  changes 
```

###### RECOVERING 
We can do a full recover lets follow the steps 
```
git reset @~3 ## Get backs to 3 commits 
git reflog ## shows the log u r back
git reset <#hash commit > it will back you

#### recover from stash
git stash apply 
git stash list
git stash apply stash@(2) ## this will nober of stsash you want to go back too
git stash pop ## it works same as git stash apply like 
git stash pop stash@(2)

#### recovering from lost commit 
git reflog 
git reset HEAD --hard <#hash commit >

### restoring a deleted file after a commit 
git log --diff-filter=0 --summary 
git checkout <#has> <file>
git reset <#hash> <file>
git reflog 
git checkout -b <branch> <#hash>

```
##### Cleaning in git

```
git clean -i ## interactive mode
git clean -f ## forecfully remove untracked files 
git clean -fX ## clean ignored files
git clean -Xn ## clearn current and sub direcotries 
git clean -fd ## untracked Directories 
```


##### pulling changes to a local repository 
```
git pull
git pull origin feature1
git fetch origin # retrive obnjects and update re from origin 
git merge origin/feature1
git checkout -b localname origin/feature1
git checkout mergingbranches
git merge localbranch

##  STASH 
git stash 
git stash --include-untracked
git stash save "<whatever message>"
git stash --keep-index 
git stash pop
git stash show 
git stash -p
git stash drop ### to drop the stash
git fsck --no-reflog | awk '/dangling commit/ {print $3}' ## to recover from dropped stash
git stash pop


git stash list ## saved stashes 
git pull --rebase
git stash pop
git pull --no-rebase ## to perform a normal merging pull

git checkout stash@{0} -- myfile.txt ## to apply part of a stash with checkout 

git clean 

```
###### PUSHIGN 
```
git push
git push origin 
git push origin feature_x 
git push --force
```

###### to view commit file
```
git cat-file commit 5bac93 
git cat-file -p <the tree value> ## so too see what are the dir
``` 
##### ARCHIVING 
```
git archive --format tar HEAD | cat > archive-HEAD.tar 
git archive --format tar HEAD | gzip > archive-HEAD.tar.gz 
git archive --format zip HEAD > archive-HEAD.zip 
git archive --output=archive-dev.zip --prefix=src-directory-name dev 
## rewriting 
if [ "$GIT_AUTHOR_NAME" = "Author to Change From" ]
then
export GIT_AUTHOR_NAME="Author to Change To"
export GIT_AUTHOR_EMAIL="email.to.change.to@example.com"
fi 
```
##### git show 
```
git show
git show @~3
git show @~3:src/program.js shows src/program.js ## seeing last 3 commits ago
git show @:a.txt @:b.txt ## concatentated with b.txt ffrom current commit 
```
##### use git bisect to finding faulty , allws you to find which commit triggerd bug using a binary search
```
git bisect start 
git bisect good <commit>
git bisect bad HEAD ## whree th bug est
git bisect reset 
```

##### BLAMING 
``` 
## this is used to be restricted by sepcifuing lines, blamign ise used to check files or lines which are bad
git blame -L <start>,<end> 
git blame -L /void main/, git blame -L 46,/void foo/v
git blame -L 108,+30, git blame -L 215,-15

git blame <File> ## to see who changed a file 
git blame -L 1,10 test.c ## 
git blame -w ## To ignore whtie - space 
```
##### OTHER commands
```
git checkout HEAD^0 # equivalent to 'git checkout --detach' in modern Gitgit checkout HEAD^0 # equivalent to 'git checkout --detach' in modern Git
git show v1.0^{} 
git cat-file -p v1.0^{} 
git replace --edit v1.0^{}
```
#####
git statistics

```
git ls-tree -r HEAD | sed -Ee 's/^.{53}//' | \
while read filename; do file "$filename"; done | \
grep -E ': .*text' | sed -E -e 's/: .*//' | \
while read filename; do git blame --line-porcelain "$filename"; done | \
sed -n 's/^author //p' | \
sort | uniq -c | sort -rn


for k in `git branch -a | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci
%Cblue%cr%Creset" $k --`\\t"$k";done | sort

git log --pretty=format:%ae \
| gawk -- '{ ++c[$0]; } END { for(cc in c) printf "%5d %s\n",c[cc],cc; }'

git log --pretty=format:"%ai" | awk '{print " : "$1}' | sort -r | uniq -c

git log --pretty=oneline |wc -l

git log --pretty=format:"%Cgreen%ci %Cblue%cn %Cgreen%cr%Creset %s"
### Finding local repos 
find $HOME -type d -name ".git"
locate .git |grep git$


### total number of commits per another 
git shortlog -s --all

### git rerere ## auto resolves
git config --global rerere.enabled true

### git tag
git tag 
git tag -l "v.01" ## lists 

git tag <tagname>
git tag commit-ide
git push origin tag-name
git push origin --tags 

### clearning local branches that have been deleted on the remote 
git fetch -p ## later use below command
git branch -vv
git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d ## one shot



