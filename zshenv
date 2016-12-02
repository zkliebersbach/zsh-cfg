typeset -U path
path=(~/bin ~/.local/bin $path)

export EDITOR=emacsclient
export JAVA_HOME=/usr/lib/jvm/java-openjdk
# Prevent fullscreen games stretching across screens
export SDL_VIDEO_FULLSCREEN_HEAD=1
