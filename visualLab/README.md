# Visual Lab Workstation Configuration
The current configuration of the workstations is using the following OS: 
* PROTON1: Ubuntu 16.04
* PROTON2: Ubuntu 16.04
* PROTON3: Ubuntu 16.04 and Windows 10
* PROTON4: Ubuntu 18.04 and Windows 10

## Stepts to setup workstations (Linux)
#### Install Ubuntu Software: [Ubuntu](https://www.ubuntu.com/)
  * Create the Admin Account: **CS** and use the default password
  * Note: if you get the pop up warning when you login, purge the apport
  ```bash
    $ sudo apt purge apport
    $ sudo apt upgrade
    $ sudo apt update
    $ sudo reboot
  ```
  * Install git:
  ```bash 
    $ sudo apt install git
   ```
#### Clone git project to setup the users configurations:
```bash
  $ git clone https://github.com/hugo-valle/dotfiles
```  
  *  Create User Admins
  ```bash 
    $ cd dotfiles
    $ sudo ./CreateUsersLinux.sh hvalle
  ```
  * Setup Linux Development Environment:
  ``` bash
    $ ./DotSetup.sh --administrator
  ```
#### Set up the X11 configuration, this is required to connect to the ExtromQuantum Server
```bash
$ sudo cp ~/dotfiles/visualLab/xorg.conf /etc/X11 
```
#### Install openssh server
```bash
  $ sudo apt install openssh-server
```
#### Install MPLABX
* Install the IDE
> https://www.microchip.com/mplab/
```bash
$ tar xvf MPLABX-v5.05-linux-installer.tar 
$ sudo ./MPLABX-v5.05-linux-installer.sh 
# Get 32-bit libs
$ sudo apt-get install libc6:i386 libx11-6:i386 libxext6:i386 libstdc++6:i386 libexpat1:i386
# run installer
$ sudo ./MPLABX-v5.05-linux-installer.sh 

```
* Install the Compilers (8 bits and 16 bits)
> https://www.microchip.com/mplab/compilers
```bash
$ chmod a+x *.run 
$ sudo ./xc16-v1.35-full-install-linux-installer.run 
$ sudo ./xc8-v2.00-full-install-linux-installer.run 
```

#### Install PyCharms
```bash
$ sudo snap install pycharm-professional --classic
```
#### Install Documentation tools
```bash
$ sudo apt install doxygen
$ sudo apt install texmaker
```
