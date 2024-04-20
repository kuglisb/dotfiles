# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git flutter zsh-syntax-highlighting vscode)

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

# Android stuff
export JABBA_VERSION="0.11.2"
[ -s "/Users/localadmin/.jabba/jabba.sh" ] && source "/Users/localadmin/.jabba/jabba.sh"
export JAVA_HOME=/Users/localadmin/.jabba/jdk/openjdk@1.17.0/Contents/Home
export ANDROID_HOME=/usr/local/share/android-commandlinetools
export SDK_MANAGER=/usr/local/bin/sdkmanager
export AVD=/usr/local/bin/avdmanager
export ADB=/usr/local/bin/adb

# Path
export PATH=$ADB:$AVD:$SDK_MANAGER:$ANDROID_HOME:$JAVA_HOME:$PATH

