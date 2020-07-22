# Bash Commands

The main idea of this repo is to provide useful bash commands that i use on my daily. I will keep adding
more and more commands as everyday is an automation day

## How to install

Just execute `$ npm run setup` and you will have the commands available in your environment. Basically, it will add the commands path to your machine \$PATH so they can be available everywhere :tada:

Feel free to backup your \$PATH value if you don't want to keep commands anymore. Just restore and that's it.

## List of commands

1 - `clean-git-branches`: Clean all your workspace git branches except the current one and the master

2 - `remove-orig`: Remove all _.orig_ files inside your current work directory

3 - `install-aws`: Install the cli of amazon v1

4 - `copy-last-tags`: Copy to your clipboard the git tags under **HEAD**

5 - `ios-devices`: Get the list of all target devices installed on your machine. Useful to run an iOS application on a specific device

6 - `port-usage`: Get the process id using a specific port

7 - `reset-react-native-environment`: Reset all symlinks and rebuild the current react-native project

8 - `request-volume-expansion`: Increase the size of EC2 instances. It requires the local machine to have the AWS credentials. Fore more info check the [docs](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

9 - `image-stepper`: Create images for all the steps inside a docker image:tag. Credits for [docker-in-practice](https://github.com/docker-in-practice/image-stepper)
