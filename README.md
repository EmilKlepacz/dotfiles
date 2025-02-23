# dotfiles
My dotfiles stored using bare repo approach:
https://www.atlassian.com/git/tutorials/dotfiles

### How bare repo was created locally?

1. In home directory run:

```bash
git init --bare ~/.dotfiles
```

2. Add this alias to .zshrc:
```
alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
```
It will be used to commit, push etc. to the .dotfiles bare repo and not the .git local folder. 
This will prevent collision with possible other Git repos in the home dir that can be created later.

3. To prevent accidental addition in other Git projects:
```bash
echo ".dotfiles" >> ~/.gitignore
```
If you ever initialize a normal Git repository (git init) in $HOME, Git will, by default, try to track everything in your home directory. If .dotfiles/ (the bare repo) is inside $HOME, it could be mistakenly added to a non-bare repository, leading to confusion.

4. When You will type ```config status``` or other commands later, files you are not interested in tracking will not show up as untracked. I assue that in home dir there will be many files that I do not want to track as my dotfiles.
```bash
dotfiles config --local status.showUntrackedFiles no
```


