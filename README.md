# dotfiles
TrevCan's config files. Below is an explanation on how anyone can set up their one repo.

# Dependencies
- [git](https://git-scm.com/downloads)

# How to set up
**Remember to back up your dotfiles to another location.**\
You can set up a local repo first, then add the remote url but I recommend starting from the remote one.
- [Remote](#Creating-the-remote-repo)
- [Local](#local-repo)

## Local Repo

### Create git repo
In your `$HOME` directory run
```bash
git init --bare .files/
```

Where, `.files/` is where the git directory will be (this is different from the working tree. See below). A bare repo will not have a working directory by default. Let's add some aliases to set it up.

### Set up aliases
Add to your startup shell startup script (`.bashrc`, `.bash_aliases`, etc) the following:\
```bash
alias dotfiles="/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME"
```

Where  `.files\` is your git directory. Now run your script:
```bash
source .bash_aliases
```

### Remove property show untracked files from git repo
If you run `dotfiles status` you'll get a long list of all your untracked filesunder `$HOME`. If you don't want these files to be show, execute the following:
```
dotfiles config --local status.showUntrackedFiles no
```

Now, you can start adding and committing all the dotfiles you want to track under `$HOME`




### Using with a remote repo
From the server side, nothing fancy is needed. Just create a standard git repository.\
Then clone it using the `--bare` flag and the `.files/` git directory.


### Cloning
Clone the repository using the

## Where did you find out about this ? // Sources
   [Harfang's Perch (2016)](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)\
   [Altassian (n.d.)](https://www.atlassian.com/git/tutorials/dotfiles)\
   [StreakyCobra (Hacker News, 2016)](https://news.ycombinator.com/item?id=11071754)
