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
