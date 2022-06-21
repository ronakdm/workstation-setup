# workstation-setup

Instructions for setting up a development environment on a new computer or remote server.

## Adding Users

If you do not yet have an account, a user with `sudo` privileges needs to create it using the following. 
```
sudo adduser <user>
```
Follow the on-screen prompts and set a temporary password for the new user. Note that `adduser` is separate and better than the related command `useradd`, as `adduser` also creates additional user folders, directories, and other necessary functions easily and `useradd` does not.

Verify that you can log in and then change the temporary password.
```
ssh  <user>@<host_name>
passwd
```
Verify that you can log in once again, this time with the new password.


## Key-Pair Authentication

First, set up passwordless SSH. If you do not have a `.ssh` folder in your home directory, run `mkdir ~/.ssh`. Then generate your public and private key for `ssh` on the **local** machine.
```
cd ~/.ssh
ssh-keygen -t rsa -b 4096 -f <filename>
```
Copy over the public key to the **remote** machine.
```
scp  ~/.ssh/<filename>.pub <user>@<host_name>:~
```
Log into the remote machine. If you do not already have an `authorized_keys` file in the `.ssh` folder, create one.
```
touch ~/.ssh/authorized_keys
```
Then, copy the contents of the public key into this file and exit the machine.
```
cat ~/<filename>.pub >> ~/.ssh/authorized_keys
exit
```
Now, check that you can use the private key to log into the remote machine without a password.
```
ssh -i ~/.ssh/<filename> <user>@<host_name>
```
If you can successfully, remove the public key `<filename>.pub` from both the local and remote machines.

The final step is to create an alias for the login command. Open the shell configuration file (`~/.zshrc` for MacOS, which should be created if it doesn't exit), and add the `ssh` command as an alias.
```
alias <host_nickname>="ssh -i ~/.ssh/<filename> <user>@<host_name>"
```

## Basic Tools

Check to see that you have `wget` installed using `which wget` (and repeat for `tmux` and `htop`). If not, install Homebrew using the instructions on the [site](https://brew.sh/). Make sure to following the post-installation instructions on-screen to add `brew` to the path. Then, run:
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

## Visual Studio (VS) Code

After downloading and installing [Visual Studio Code](https://code.visualstudio.com/download), get the [Remote Development Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) and the [Python Extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python). For formatting, search `python formatting provider` and select `black`. When creating and running Jupyter notebooks, the `conda` environment that is specified for the kernel must have `jupyter` installed. If not, then do so and restart VS Code.
