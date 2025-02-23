alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"

alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# running WildFly quickly
wf() {
    ~/Documents/cobra/wildfly-26.1.3.Final/bin/standalone.sh "$@"
}
