# workstation-setup

Instructions for setting up a development environment on a new computer or remote tserver.

## Key-Pair Authentication

For easy access, run the following to set up your public and private key for `ssh` on the remote machine, and copy over the public key to the list of known keys.
```
ssh-keygen - f <file_name>
cp ~/.ssh/<file_name>.pub ~/.ssh/authorized_keys
rm <file_name>.pub
```
One the local machine, run the following to copy over the private key and check that it works.
```
scp <user>@<host_name>:<path_to_key>/<filename> ~/.ssh
ssh -i ~/.ssh/<filename> <user>@<host_name>
```
If you can log in without the password, remove the private key from the remote machine.
```
rm <path_to_key>/<filename>
```
Finally, in the shell configuration file (`~/.zshrc` for MacOS, which should be created if it doesn't exit), add the `ssh` command as an alias.
```
alias <host_nickname>="ssh -i ~/.ssh/<filename> <user>@<host_name>"
```

## Basic Tools

Install Homebrew using the instructions on the [site](https://brew.sh/). Make sure to following the post-installation instructions on-screen to add `brew` to the path. Then, run:
```
brew install wget
brew install tmux
brew install htop
```

## Python Setup

Go to the Miniconda [installation page](https://docs.conda.io/en/latest/miniconda.html) and copy the link address of the relevant `bash` installer. Download it to the home directory.
```
cd ~
wget <copied_link>
bash <Miniconda_script>.sh
rm <Miniconda_script>.sh
```
Quit and restart the terminal, and look for a `(base)` environment indicator before the prompt. Create a `conda` environment for whichever version of Python.
```
conda create -n <env_name> python=3.8
```
To remove an environment, run:
```
conda remove --name <env_name> --all
```
To verify that the correct Python installation is being called, run `which python` or `python --version`. See more info [here](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html).

## VS Code

After downloading and installing [Visual Studio Code](https://code.visualstudio.com/download), get the [Remote Development Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) and the [Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python). For formatting, search `python formatting provider` and select `black`.
