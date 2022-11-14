# if [[ -f /usr/libexec/java_home ]]; then
#   export JAVA_HOME=$(/usr/libexec/java_home -v 11) # 1.8 or 11
# elif [[ -f /usr/bin/javac ]]; then
#   export JAVA_HOME=$(dirname $(dirname $(readlink -e /usr/bin/javac)))
# fi

# if [[ $JAVA_HOME ]]; then
#   export JRE_HOME=$JAVA_HOME/jre
#   export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
#   path=($JAVA_HOME/bin $path)
# fi


_cache jenv1 jenv init - --no-rehash
env_rehash_cmds+=("jenv rehash")

_is_callable google-java-format && alias format-all-java='google-java-format -i **/*.java'
alias idea-format="'/Applications/IntelliJ IDEA.app/Contents/bin/format.sh'"
