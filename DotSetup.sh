#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

arg1="${1:-}"
# timestamp
ts=`date +%y-%m-%d-%H-%M`

#--  FUNCTION  ----------------------------------------------------------------
#          NAME:  DetectOS
#   DESCRIPTION:  Set variables detecting the OS type
#    PARAMETERS:  None
#       RETURNS:  None
#-------------------------------------------------------------------------------
#
DetectOS()
{
    # IDs help ---> https://github.com/zyga/os-release-zoo
    supported_distros="ubuntu, linuxmint, debian, elementary OS, neon, peppermint, Zorin OS"

    source /etc/os-release    #Load OS VARS
    # :TRICKY:03/01/2019 05:12:09 PM:hvalle: Overwrite OS system variable based on OSTYPE
    case "$OSTYPE" in
        solaris*)   OS="SOLARIS" ;;
        darwin*)    OS="OSX" ;;
        linux*)     OS="LINUX" ;;
        bsd*)       OS="BSD" ;;
        msys*)      OS="WINDOWS" ;;
        cygwin*)    OS="WINDOWS" ;;
        *)          echo "unknown: $OSTYPE" 
                    OS="unknown" ;;
    esac

    if [[ $OS == "unknown" ]]; then
        read -p "${BOLD}${RED}Unknown OSTYPE: $OS,${RESET} the script might not work. Do you want to procced <y/N>? " weird_os
            case "$weird_os" in
                y|Y ) : ;;
                n|N|* ) echo "$RESET" exit -1;;
            esac
    fi

    if [[  $OS == 'LINUX' ]]; then
        if [[  $supported_distros != *$ID* ]]; then
            echo "$BOLD${RED}ERROR:$RESET Undetect Linux: $ID $RESET"
            echo "Supported:$BOLD$BLUE $supported_distros $RESET"
            read -n 1 -p "Attempt to continue? $RESET (y/N): $GREEN" choice
            echo "$RESET"
            case "$choice" in
                y|Y ) :;;
                n|N|* ) echo "$RESET";exit -1;;
            esac
        else
            if [[  -z "$PRETTY_NAME" ]]; then
                echo "Linux Detected:$BOLD$GREEN $ID $RESET"
            else
                echo "Linux Detected:$BOLD$GREEN $PRETTY_NAME $RESET"
            fi
        fi

    elif [[  "$OS" == "OSX" ]]; then
        echo "OSX Detected $RESET"
        if which brew 2> /dev/null; then
            echo "$BOLD${YELLOW}Note!$RESET Missing Packages will installed using BREW"
            BREW=1;
        else
            BREW=0
            echo "$BOLD${YELLOW}Note:$RESET OSX:$BOLD$BLUE HomeBrew (https://brew.sh/)$RESET is required for auto install."
            echo "$BOLD${YELLOW}Note:$RESET Missing Packages will be listed."
        fi

    elif [[  "$OS" == "WINDOWS" ]]; then
        echo "Windows Detected $RESET"
        if which pact 2> /dev/null; then
            echo "$BOLD${YELLOW}Note!$RESET Missing Packages will installed using babun"
            PACT=1;
        else
            PACT=0
            echo "$BOLD${YELLOW}Note:$RESET WINDOWS:$BOLD$BLUE HomeBrew (https://babun.github.io/)$RESET is required for auto install."
            echo "$BOLD${YELLOW}Note:$RESET Missing Packages will be listed."
        fi
    fi

    # Set Package Manager
    if [[ $OS == 'LINUX' ]]; then
        APTCMD='sudo apt -o Dpkg::Progress-Fancy="1" -y install'
    elif [[ $OS == 'OSX' ]]; then
        APTCMD='brew install'
    elif [[ $OS == 'WINDOWS' ]]; then
        APTCMD='pact install'
    fi
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  ScriptSettings
#   DESCRIPTION:  Setup the settings for this script
#    PARAMETERS:  None
#       RETURNS:  None
#-------------------------------------------------------------------------------
ScriptSettings()
{
    SCRIPTNAME="WSU Dr. V VIM IDE"

    #Directory Setup
    DOTFILES=$HOME/dotfiles
    LOCALBIN=~/.local/bin
    ENV_FILES=($HOME/.bash_profile 
                $HOME/.bash_login 
                $HOME/.profile 
                $HOME/.bashrc)

    #Optional
    OPTPKGS='neovim python3-neovim nodejs npm tree clang cppcheck libxml2-utils lua-check jsonlint pylint python3-pip python3-doc ctags cppman libbz2-dev bats ruby ruby-dev zlib1g-dev pkg-config libglib2.0-dev binutils-dev autoconf libtool libssl-dev libpixman-1-dev virtualenv fontconfig'
    PIPPKGS='vim-vint proselint sphinx virtualenvwrapper numpy pandas'
    PKGS='git wget vim python3 curl bc build-essential cmake libboost-all-dev doxygen '

    # Note these two arrays must match by index number
    FILES=($DOTFILES/vim/vimrc 
            $DOTFILES/vim 
            $DOTFILES/tmux/tmux.conf 
            $DOTFILES/bash/bashrc 
            $DOTFILES/git/gitconfig)
    LINKS=( ~/.vimrc
            ~/.vim 
            ~/.tmux.conf
            ~/.bashrc
            ~/.gitconfig)

    #Global Vars (Auto Set - Changing will have BAD effects)
    ADMIN=0
    ZSH=0
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  PrintHelp
#   DESCRIPTION:  Help Function for script. Invoked with --help
#    PARAMETERS:  None
#       RETURNS:  None
#-------------------------------------------------------------------------------
PrintHelp()
{
    echo "${RESET}usage: $0 [--administrator] [--remove] [--backup] [--upgrade] [--decrypt] [--encrypt]$RESET"
    exit 0
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  Remove
#   DESCRIPTION:  Removes current setup files. Invoke with --remove
#    PARAMETERS:  None
#       RETURNS:  None
#          Note:  
#-------------------------------------------------------------------------------
Remove()
{
    echo "$RESET${RED}REMOVE$RESET Selected$RESET"
    # Run backup just in case
    Backup

    read -n 1 -p "$BOLD${BLUE}Remove all configuration and files?$RESET (y/N): $GREEN" choice
    echo ""
    case "$choice" in
        y|Y ) :;;
        n|N ) echo "Canceled$RESET";exit 0;;
        * ) echo "Canceled$RESET";exit 0;;
    esac


    #Unlimk FILES
    for LINK in ${LINKS[@]}; do
        unlink $LINK 2>/dev/null
    done

    #Delete generated DIRS
    rm -rf $DOTFILES/vim/bundle
    rm -rf $DOTFILES/vim/autoload
    rm -rf $DOTFILES/vim/colors

    #Detete FILE created by the setup
    rm -f $DOTFILES/git/gitconfig
    rm -f $DOTFILES/vim/template/personal.template

    echo "Remove Complete$RESET"
    echo ""
    exit -1
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  Upgrade
#   DESCRIPTION:  Upgrade current setup after doing a git pull --upgrade
#    PARAMETERS:  None
#       RETURNS:  None
#          Note:  Might just do a Plug clean install etc
#-------------------------------------------------------------------------------
Upgrade()
{
    # TODO:03/01/2019 05:41:45 PM:hvalle: Need to test this more. Do I link back?
    unlink ~/.bash_aliases
    unlink ~/.zsh_aliases
    vim +PlugInstall +PlugUpdate +PlugClean +qall
    exit 0
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  DecryptSecure
#   DESCRIPTION:  Decrypt secure file NOTE Must be called after AddToEnvironment
#    PARAMETERS:  none
#       RETURNS:  Success(0) or none
#-------------------------------------------------------------------------------
DecryptSecure()
{
    read -n 1 -p "$BOLD${BLUE}Use secure valut?$RESET (You must have a git repository setup) (y/N): $GREEN" choice
    echo "$RESET"
    case "$choice" in
        y|Y ) :;;
        n|N|* ) return;;
    esac
    read -p "${RESET}Enter$BOLD$BLUE git repository of secure vault$RESET ex\"https://github.com/<user name>/secure.git\": $GREEN" REPO

    (cd $DOTFILES && exec git clone $REPO)
    (exec $DOTFILES/scripts/unlock.sh)
    exit 0
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  EncryptSecure
#   DESCRIPTION:  Encrypt secure file NOTE Must be called after AddToEnvironment
#    PARAMETERS:  none
#       RETURNS:  Success(0) or none
#-------------------------------------------------------------------------------
EncryptSecure()
{
    read -n 1 -p "$BOLD${BLUE}Use secure valut?$RESET (You must have a git repository setup) (y/N): $GREEN" choice
    echo "$RESET"
    case "$choice" in
        y|Y ) :;;
        n|N|* ) return;;
    esac

    (exec $DOTFILES/scripts/lock.sh)

    exit 0
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  Init
#   DESCRIPTION:  Initialization of script. Color setup. Folder configuration.
#    PARAMETERS:  $@ Program input choices.
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
Init()
{
    #Check if running as sudo
    if [[  $EUID == 0 ]]
    then
        echo "Do ${RED}NOT$RESET run this script as root or with sudo$RESET"
        PrintHelp
    fi

    #Check and process command line arguments
    while [[  $# > 0 ]]; do
        case $1 in
            --administrator) ADMIN=1;;
            --remove) Remove;;
            --backup) Backup;;
            --upgrade) Upgrade;;
            --decrypt) DecryptSecure;;
            --encrypt) EncryptSecure;;
            -h|--help|*) PrintHelp;;
        esac;
        shift;
    done

    echo "Installing$BOLD$BLUE $SCRIPTNAME$RESET"

    if [[ $ADMIN == 1 ]]; then
        echo "Admin Mode is:$BOLD$GREEN ON $RESET"
    fi
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  CheckOptional
#   DESCRIPTION:  Check for recommended but optional packages
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
CheckOptional()
{
    echo -n "Checking for optional packages:$RESET"
    ERRFLAG=false

    for PKG in $OPTPKGS; do
        if which $PKG 1>/dev/null 2>/dev/null; then
            echo -n "$BOLD$GREEN $PKG$RESET"
        else
            echo -n "$BOLD$YELLOW $PKG$RESET"
            ERRFLAG=true
        fi
    done
    echo ""
    if [[  $ERRFLAG ]]; then
        echo "$BOLD${YELLOW}Note:$RESET Recommended$BOLD$YELLOW NOT$RESET required package missing."
        unset ERRFLAG
    fi
    echo ""
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  CheckDeps
#   DESCRIPTION:  Verifies system dependencies
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
CheckDeps()
{
    printf "Checking for Required Packages:$RESET"
    ERRFLAG=0

    for PKG in $PKGS; do
        if which $PKG 1>/dev/null 2>/dev/null; then
            printf "$BOLD$GREEN $PKG$RESET"
        else
            printf "$BOLD$RED $PKG$RESET"
            ERRFLAG=1
        fi
    done
    echo ""

    #if [[ $ERRFLAG == 1 ]] && [[ $ADMIN == 0 ]]; then
    if (( $ERRFLAG )) && (( ! $ADMIN )); then
            echo ""
            echo "$BOLD${RED}ERROR:$RESET Missing Required Package: RUN:$BOLD$BLUE \"$0 --administrator\"$RESET attempt to fix $RESET"
            echo ""
            exit -1
    fi
    echo ""
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  SetupZsh
#   DESCRIPTION:  Setup function for zsh
#    PARAMETERS:  None
#       RETURNS:  If selected, setup the 10K
#-------------------------------------------------------------------------------
SetupZsh()
{

    read -n 1 -p "Setup$BOLD$BLUE zsh$RESET (Y/n): $GREEN" choice
    echo "$RESET"
    case "$choice" in
        n|N ) :;;
        y|Y|* ) ZSH=true;;
    esac

    echo ""
    if [[ "$ZSH" != true ]]
    then
        echo "Next time, you should consider using it :)"
        return
    fi

    # Begin Setup and Configuration
    if [[ -d  ~/.oh-my-zsh ]] 
    then
        echo "You already have oh-my-zsh"
    else
        echo "Downloading and installing: oh-my-zsh"
        # sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        git clone --depth=1 git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    fi


    echo "Downloading and installing plugins: autosuggestions, syntax-highlighting"
    if [ -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]; then
        cd ~/.oh-my-zsh/plugins/zsh-autosuggestions && git pull
    else
        git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    fi

    if [ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
        cd ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull
    else
        git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    fi

    # if [ -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]; then
    #     cd ~/.oh-my-zsh/custom/plugins/zsh-completions && git pull
    # else
    #     git clone --depth=1 https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
    # fi

    # if [ -d ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search ]; then
    #     cd ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search && git pull
    # else
    #     git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins/zsh-history-substring-search
    # fi


    # INSTALL FONTS
    echo -e "Installing Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono\n"

    wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
    wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
    wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/

    fc-cache -fv ~/.fonts

    # Theme
    echo "Downloading and installing: PowerLevel10K theme"
    if [ -d ~/.oh-my-zsh/custom/themes/powerlevel10k ]
    then
        cd ~/.oh-my-zsh/custom/themes/powerlevel10k  && git pull
    else
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi

    # external plugins, things, will be installed in here
    if [ -d  ~/.quickzsh ]
    then
        echo "Plugin folder ~/.quickzsh ready"
    else
        mkdir -p ~/.quickzsh
    fi
    
    # Command line Fuzzi finder
    if [ -d ~/.quickzsh/fzf ]
    then
        cd ~/.quickzsh/fzf && git pull
        ~/.quickzsh/fzf/install --all --key-bindings --completion --no-update-rc
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.quickzsh/fzf
        ~/.quickzsh/fzf/install --all --key-bindings --completion --no-update-rc
    fi
    
    # Directory listings for zsh with git features
    if [ -d ~/.oh-my-zsh/custom/plugins/k ]
    then
        cd ~/.oh-my-zsh/custom/plugins/k && git pull
    else
        git clone --depth 1 https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
    fi

    # Marker is a command palette for the terminal
    if [ -d ~/.quickzsh/marker ]
    then
        cd ~/.quickzsh/marker && git pull
    else
        git clone --depth 1 https://github.com/pindexis/marker ~/.quickzsh/marker
    fi

    if ~/.quickzsh/marker/install.py
    then
        echo -e "Installed Marker\n"
    else
        echo -e "Marker Installation Had Issues\n"
    fi

    # if git clone --depth 1 https://github.com/todotxt/todo.txt-cli.git ~/.quickzsh/todo; then :
    # else
    #     cd ~/.quickzsh/todo && git fetch --all && git reset --hard origin/master
    # fi
    # mkdir ~/.quickzsh/todo/bin ; cp -f ~/.quickzsh/todo/todo.sh ~/.quickzsh/todo/bin/todo.sh # cp todo.sh to ./bin so only it is included in $PATH
    # #touch ~/.todo/config     # needs it, otherwise spits error , yeah a bug in todo
    # ln -s ~/.quickzsh/todo ~/.todo
    if [ ! -L ~/.quickzsh/todo/bin/todo.sh ]; then
        echo -e "Installing todo.sh in ~/.quickzsh/todo\n"
        mkdir -p ~/.quickzsh/todo/bin
        wget -q --show-progress "https://github.com/todotxt/todo.txt-cli/releases/download/v2.11.0/todo.txt_cli-2.11.0.tar.gz" -P ~/.quickzsh/
        tar xvf ~/.quickzsh/todo.txt_cli-2.11.0.tar.gz -C ~/.quickzsh/todo --strip 1 && rm ~/.quickzsh/todo.txt_cli-2.11.0.tar.gz
        ln -s ~/.quickzsh/todo/todo.sh ~/.quickzsh/todo/bin/todo.sh     # so only .../bin is included in $PATH
        ln -s ~/.quickzsh/todo/todo.cfg ~/.todo.cfg     # it expects it there or ~/todo.cfg or ~/.todo/config
    else
        echo -e "todo.sh is already instlled in ~/.quickzsh/todo/bin/\n"
    fi

    if [[ $1 == "--cp-hist" ]] || [[ $1 == "-c" ]]; then
        echo -e "\nCopying bash_history to zsh_history\n"
        if command -v python &>/dev/null; then
            wget -q --show-progress https://gist.githubusercontent.com/muendelezaji/c14722ab66b505a49861b8a74e52b274/raw/49f0fb7f661bdf794742257f58950d209dd6cb62/bash-to-zsh-hist.py
            cat ~/.bash_history | python bash-to-zsh-hist.py >> ~/.zsh_history
        else
            if command -v python3 &>/dev/null; then
                wget -q --show-progress https://gist.githubusercontent.com/muendelezaji/c14722ab66b505a49861b8a74e52b274/raw/49f0fb7f661bdf794742257f58950d209dd6cb62/bash-to-zsh-hist.py
                cat ~/.bash_history | python3 bash-to-zsh-hist.py >> ~/.zsh_history
            else
                echo "Python is not installed, can't copy bash_history to zsh_history\n"
            fi
        fi
    else
        echo -e "\nNot copying bash_history to zsh_history, as --cp-hist or -c is not supplied\n"
    fi


 
    # ls tools
    sudo gem install colorls
    
    # AddToEnvironment
    # Create symlink
    rm ~/.zshrc
    ln -s $DOTFILES/zsh/zshrc ~/.zshrc
        
    # source ~/.zshrc
    echo -e "\nSudo access is needed to change default shell\n"

    if chsh -s $(which zsh) && /bin/zsh -i -c omz update; then
        echo -e "Installation Successful, exit terminal and enter a new session"
    else
        echo -e "Something is wrong"
    fi
    echo "Remember to Install Nerdfonts: www.nerdfonts.com"
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  AdminSetup
#   DESCRIPTION:  Administrator setup. Will required sudo access to the machine
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#          NOTE:  Only needed once on each computer
#-------------------------------------------------------------------------------
AdminSetup()
{
    echo "$BOLD${BLUE}Admin Setup$RESET ($OS)"
    ERRFLAG=false
    APTOPT=''

    echo -n "$BOLD${BLUE}Installing Packages: $RESET"
    for PKG in $PKGS; do
        if which $PKG 1>/dev/null 2>/dev/null; then
            echo -n "$BOLD$GREEN $PKG$RESET"
        else
            echo "$BOLD$YELLOW $PKG$RESET"
            $APTCMD $APTOPT $PKG
        fi
    done
    echo ""

    read -n 1 -p "Try to install$BOLD$BLUE Optional$RESET Packages (y/N): $GREEN" choice
    echo "$RESET"
    case "$choice" in
        y|Y ) :;;
        n|N|* ) echo ""; echo ""; return;;
    esac

    echo -n "$BOLD${BLUE}Installing Optional Packages: $RESET"
    for PKG in $OPTPKGS; do
        if which $PKG 1>/dev/null 2>/dev/null; then
            echo -n "$BOLD$GREEN $PKG$RESET"
        else
            echo "$BOLD$YELLOW $PKG$RESET"
            $APTCMD $APTOPT $PKG
        fi
    done

    echo ""
    echo ""
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  GetUserInfo
#   DESCRIPTION:  Capture User information. This is required to setup the
#                 vim and git templates.
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
GetUserInfo()
{
    read -p "${RESET}Enter$BOLD$BLUE Full Name$RESET ex\"Waldo Doe\": $GREEN" name
    # Author ref
    author_ref=(${name// / })
    author_name="${author_ref[0]:0:1}${author_ref[1]}"  # take initialFirstName + lastName
    author_name="${author_name,,}"          # Make it lower case
    read -p "${RESET}Enter$BOLD$BLUE Author Ref$RESET (hit enter for default): \"$author_name\": $GREEN" ref
    ref="${ref:-$author_name}"              # Set default
    # Email
    tmp_email="${author_ref[0],,}${author_ref[1],,}@weber.mail.edu"  
    read -p "${RESET}Enter$BOLD$BLUE Email Address$RESET (hit enter for default): \"$tmp_email\": $GREEN" email
    email="${email:-$tmp_email}"
    # Organization
    read -p "${RESET}Enter$BOLD$BLUE Oganization$RESET (hit enter for default): \"WSU\": $GREEN" org
    org="${org:-WSU}"
    # Company
    read -p "${RESET}Enter$BOLD$BLUE Company$RESET (hit enter for default): \"WSU\": $GREEN" com
    com="${com:-WSU}"
    # License
    read -p "${RESET}Enter$BOLD$BLUE Default License$RESET (hit enter for default): $GREEN" license
    if [[  -z "$license" ]]; then
        license='this program is free software: you can redistribute it and/or modify
        it under the terms of the GNU General Public License as published by
        the Free Software Foundation, either version 3 of the License, or
        (at your option) any later version.

        This program is distributed in the hope that it will be useful,
        but WITHOUT ANY WARRANTY; without even the implied warranty of
        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
        GNU General Public License for more details.

        You should have received a copy of the GNU General Public License
        along with this program.  If not, see <http://www.gnu.org/licenses/>\n.'
    fi
    printf "$RESET"
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  CreatePersonalTemplate
#   DESCRIPTION:  Create personal vim templates for c, perl, bash, etc
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
CreatePersonalTemplate()
{
    echo "Creaing User Template File:$BOLD$BLUE $DOTFILES/vim/templates/personal.template$RESET"

printf "§ =============================================================
§  Personal Information
§ =============================================================

SetMacro( 'AUTHOR',       '%s' )
SetMacro( 'AUTHORREF',    '%s' )
SetMacro( 'EMAIL',        '%s' )
SetMacro( 'ORGANIZATION', '%s' )
SetMacro( 'COMPANY',      '%s' )
SetMacro( 'COPYRIGHT',    'Copyright (c) |YEAR|, |AUTHOR|' )
SetMacro( 'LICENSE',      '%s' )

§ =============================================================
§  Date and Time Format
§ =============================================================

§SetFormat( 'DATE', '%%x' )
§SetFormat( 'TIME', '%%H:%%M' )
§SetFormat( 'YEAR', '%%Y' )
" "$name" "$ref" "$email" "$org" "$com" > $DOTFILES/vim/templates/personal.template
}



#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  CreateGitConfig
#   DESCRIPTION:  Creates basic git configuration file based on input
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
CreateGitConfig()
{
    echo "Creating User Git Config:$BOLD$BLUE $DOTFILES/git/gitconfig$RESET"

    printf "
[user]
    name = %s
    email = %s
[core]
    editor = vim
    autocrlf= input
[diff]
    tool = vimdiff
[difftool]
    prompt = false
[merge]
    tool = vimdiff
[help]
    autocorrect = 1
[color]
    ui = auto
    branch = auto
    diff = auto
    interactive = auto
    status = auto
[push]
    default = matching
[credential]
    helper = cache --timeout=28800
[alias]
    export = archive -o latest.tar.gz -9 --prefix=latest/
    amend = !git log -n 1 --pretty=tformat:%%s%%n%%n%%b | git commit -F - --amend
    details = log -n1 -p --format=fuller
    logpretty = log --graph --decorate --pretty=format:'%%C(yellow)%%h%%Creset -%%C(auto)%%h %%d%%Creset %%s %%C(green)(%%cr) %%C(blue)<%%an>%%Creset' --abbrev-commit
    s = status
[url \"https://github.com/\"]
    insteadOf = gh:
" "$name" "$email" > $DOTFILES/git/gitconfig
}



#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  ManageFilesAndLinks
#   DESCRIPTION:  Create symbolic links to your ~/dotfiles directory
#    PARAMETERS:  None
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
ManageFilesAndLinks()
{
    echo "Creating$BOLD$GREEN symlinks$RESET"
    # Make a copy and move it out of way
    Backup

    for ((i=0; i<=${#LINKS[@]}-1;i++))
    do
        echo "Linked$BOLD$GREEN ${LINKS[${i}]} $RESET->$BOLD$BLUE ${FILES[${i}]} $RESET"
        ln -s ${FILES[${i}]} ${LINKS[${i}]}
    done

    echo "Downloading Colors wombat256mod.vim"
    mkdir -p $DOTFILES/vim/colors
    wget -O $DOTFILES/vim/colors/wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400


    echo ""
}


#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  AddToEnvironment
#   DESCRIPTION:  Add need variables to environment
#    PARAMETERS:  none
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
AddToEnvironment()
{
    echo "Add Environment Var:$RESET$BOLD$BLUE \$DOTFILES=$RESET$DOTFILES"

    for RCFILE in "${ENV_FILES[@]}"
    do
        if [[  -e ${RCFILE} ]]; then
            if grep -q "export DOTFILES=" "$RCFILE" 2>/dev/null; then
                echo "$BOLD$GREEN $RCFILE$RESET:$BOLD$BLUE Already added$RESET skipping"
            else
                echo "Adding to file:$BOLD$GREEN $RCFILE$RESET"
                echo "export DOTFILES=\"$DOTFILES\"" >> $RCFILE
                echo "export PATH=\"\$PATH:$DOTFILES/scripts\"" >> $RCFILE
                echo "source $DOTFILES/shell/autorun.sh" >> $RCFILE
            fi
        else
           echo "$YELLOW${BOLD}Note:$RESET$BOLD $RCFILE$RESET does not exist"
        fi
   done

    if [[  $OS == 'OSX' ]]; then
        touch ~/.bash_profile
        RCFILE="~/.bash_profile"
        echo "Adding to file:$BOLD$GREEN $RCFILE$RESET"
        echo "export DOTFILES=\"$DOTFILES\"" >> $RCFILE
        echo "export PATH=\"\$PATH:$DOTFILES/scripts\"" >> $RCFILE
        echo "source $DOTFILES/shell/autorun.sh" >> $RCFILE
    fi

    #Also export then for any subscript this script runs
    export DOTFILES="$DOTFILES"
    export PATH="$PATH:$DOTFILES/scripts"
    echo ""
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  BackupFile
#   DESCRIPTION: Make a bk copy of a file if it exist 
#    PARAMETERS:  File to backup
#       RETURNS:  none
#-------------------------------------------------------------------------------
BackupFile()
{
    local file=$1
    local bkfile="$file.bk.$ts"
    # Check if file exist in home area
    if [ -L $file  ]
    then
        if [ -e $file ]
        then
            echo "Good link $BOLD$GREEN $file $RESET"
            echo "Creating a backup $BOLD$BLUE $bkfile $RESET."
            # Skip symlinks to folders
            if [[ $file  == ~/.vim ]] 
            then
                echo "Symlink to dir $BOLD$BLUE ${LINKS[${i}]} $RESET."
            else
                # Make bk copy
                cp $file $bkfile
            fi
            # Remove old file
            rm $file
        else
            echo "Broken link $BOLD$RED $file $RESET"
            # Remove old file
            rm $file
        fi
    elif [ -e $file  ]
    then
        echo "Not a link $BOLD$BLUE $file $RESET"
            # Make bk
            echo "Creating a backup $BOLD$BLUE $bkfile $RESET."
            cp $file $bkfile
            # Remove old file
            rm $file
    elif [ -d $file  ]
    then
        echo "$BOLD$BLUE $file $RESET folder exist"
            # Make bk
            echo "Creating a dir backup $BOLD$BLUE $bkfile $RESET."
            cp -r $file $bkfile
            # Remove old file
            rm -rf $file
    else
        echo "Missing $BOLD$RED $file $RESET"
    fi
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  Backup
#   DESCRIPTION: Make a bk copy of a file if it exist 
#    PARAMETERS:  File to backup
#       RETURNS:  none
#-------------------------------------------------------------------------------
Backup()
{
    echo "Backing up $BOLD$GREEN current dotfiles$RESET"
    for ((i=0; i<=${#LINKS[@]}-1;i++))
    do
        echo "Backup$BOLD$GREEN ${LINKS[${i}]} $RESET"
        BackupFile ${LINKS[${i}]}
    done
}

#---  FUNCTION  ----------------------------------------------------------------
#          NAME:  main
#   DESCRIPTION:  This is the main driver function.
#    PARAMETERS:  Optional parameters: --help, --administrator, --remove
#       RETURNS:  Success or Error
#-------------------------------------------------------------------------------
main()
{
    source ./scripts/colors.sh
    
    DetectOS
    
    ScriptSettings # Set arrays of files to link
    
    Init "$@"     # Remember to pass the command line args $@
    
    CheckDeps

    if [[ $ADMIN == 1 ]]
    then
	    CheckOptional
        AdminSetup
    fi
    
    GetUserInfo   # Get user information

    ManageFilesAndLinks   # Create Dirs Copy Files and Make Links

    CreatePersonalTemplate # Personal template for some plugins
    
    CreateGitConfig # Git config file

    vim +PlugInstall +qall # Install the vim plugin system and updates all plugins

    # DecryptSecure

    SetupZsh    # Zsh setup

}

# Main Program
main "$@"     #remember to pass all command line args
exit 0
