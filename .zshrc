alias arm="env /usr/bin/arch -arm64 /bin/zsh --login"

alias intel="env /usr/bin/arch -x86_64 /bin/zsh --login"

alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

# human readable long list format, appends special chars and lists hidden files
alias l="ls -lFah"

# running WildFly quickly
wf() {
	~/Documents/cobra/wildfly-26.1.3.Final/bin/standalone.sh "$@"
}

# kills the process running on given port
# ex: k9p 9999 will kill processes running on 9999 port
k9p() {
	PIDS=$(lsof -ti :$1)
	if [ -z "$PIDS" ]; then
		echo "No process found on port $1"
		return 1
	fi

	kill -9 $PIDS 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "Successfully killed process(es) on port $1: $PIDS"
	else
		echo "Failed to kill process(es) on port $1"
	fi
}

# wildfly kill
k9wf() {
	echo "Killing WildFly..."
	k9p 8787
}
