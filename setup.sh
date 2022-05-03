CWD=$(pwd)

echo "export BASH_COMMANDS_HOME=$CWD" >> ~/.bash_profile
echo "export PATH=$BASH_COMMANDS_HOME/bin:$PATH" >> ~/.bash_profile

source ~/.bash_profile
