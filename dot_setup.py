#!/usr/bin/env python3
"""
============================================================================
@file   DotSetup.py
@brief  Install jIDE vim / nvim IDE

@author Hugo Valle

@internal
    Created  Thursday, 04 January 2018
    Modified  Friday, 15 February 2019
    Revision  337

@Copyright  Copyright (c) 2018, John Warnes
============================================================================
Required Python3 and Pip3
"""
from __future__ import print_function
import os
import sys
import platform
import subprocess
import argparse
import shutil
from pkg_resources import parse_version
from git import Repo

# Global variables
SETTINGS = {
    # Script
    'version': '3.1',

    # Directorys
    'dotfiles': '~/dotfiles',

    # Files
    'backup_file': '~/.jvimBackup',

    # vim
    'vim_recommended': '8.1',
    'vim_required': '8.0',

    'nvim_recommended': '0.2.0',
    }

SYSDATA = {}
USER = {}


def get_script_path():
    """
    Get system  real path
    Returns:
        Real path to running program
    """
    return os.path.dirname(os.path.realpath(sys.argv[0]))

def collect_system_data():
    """
    Collect current system information
    """
    global SYSDATA
    SYSDATA['home'] = os.path.expanduser('~')
    SYSDATA['sdir'] = get_script_path()
    SYSDATA['sfile'] = str(__file__)
    SYSDATA['os_kind'] = os.name
    SYSDATA['os'] = platform.system()
    SYSDATA['os_release'] = platform.release()
    SYSDATA['os_dist'] = platform.linux_distribution()
    shell = os.environ.get('SHELL').split('/')
    SYSDATA['shell'] = shell[-1]

    SYSDATA['vim_version'] = subprocess.check_output(
        "vim --version | head -1 | cut -d ' ' -f 5",
        shell=True).decode('ascii').strip()

    SYSDATA['nvim_version'] = subprocess.check_output(
        "nvim --version | head -1 | cut -d ' ' -f 2",
        shell=True).decode('ascii').strip()[1:]
    # print(os.getcwd())  # Current DIR
    # os.chdir(current_dir)  # Chance DIR


def display_system_data():
    """
    Display current system infromation
    """
    print("== JVIM ", SETTINGS['version'], " ==")
    print(' Script File: ', SYSDATA['sfile'])
    print(' Script Directory: ', SYSDATA['sdir'])
    print(' Home Directory: ', SYSDATA['home'])
    print()
    print('-- OS --')
    print(' Kind: {}'.format(SYSDATA['os_kind']))
    print(' OS: {}'.format(SYSDATA['os']))
    print(' Release: {}'.format(SYSDATA['os_release']))
    print(' Dist: {}'.format(SYSDATA['os_dist']))
    print()
    print('-- Vim --')
    print(' Required Version: {:6}'.format(SETTINGS['vim_required']))
    print(' Recommended Version: {:6}'.format(SETTINGS['vim_recommended']))
    print(' Current Version: {:5}'.format(SYSDATA['vim_version']))
    print()
    print('-- Neovim --')
    print(' Recommended Version: {:6}'.format(SETTINGS['nvim_recommended']))
    print(' Current Version: {:5}'.format(SYSDATA['nvim_version']))
    print()
    print('To install run ./Dotfiles.py -i or ./Dotfiles.py --install')


def check_dependencies():
    """
    Check system dependencies
    """
    print("== Checking Dependences ==")
    dependences = True
    if parse_version(SETTINGS['vim_required']) > parse_version(SYSDATA['vim_version']):
        print(" :ERROR Vim version is below the required version")
        dependences = False

        if parse_version(SETTINGS['vim_recommended']) > parse_version(SYSDATA['vim_version']):
            print(" Warring vim version is below the recommend version")
    else:
        print(" Vim version: OK")

    if parse_version(SETTINGS['nvim_recommended']) > parse_version(SYSDATA['nvim_version']):
        print(" Warring: Neovim version is below the recommend version")
    else:
        print(" Neovim version: OK")
    print()
    return dependences


def ask_user_data():
    """
    Collect user information
    """
    global USER

    print("=== User information ===")
    print(" Please enter your user information.")

    # User Full Name
    USER["name"] = input(" Full Name 'John Smith': ")
    if USER["name"] == '':
        print("Error! Must enter a fist and last name. example: John Smith")
        quit()
    name = USER["name"].split()
    first = name[0]
    last = name[-1]

    # User System Name
    USER["user"] = input(" Username '{}{}' [Enter] for default: ".format(
        first[0].lower(), last.lower()))
    if USER["user"] == '':
        USER["user"] = first[0].lower() + last.lower()

    # Company
    USER["company"] = input(" Company 'Weber State University' [Enter] for default: ")
    if USER["company"] == '':
        USER["company"] = 'Weber State University'

    # Organization
    USER["org"] = input(" Organization 'Computer Science' [Enter] for default: ")
    if USER["org"] == '':
        USER["org"] = 'Computer Science'

    # Email
    USER["email"] = input(" Email '{}{}@mail.weber.edu' [Enter] for default: ".format(
        first.lower(), last.lower()))
    if USER["email"] == '':
        USER["email"] = first.lower() + last.lower() + '@mail.weber.edu'

    # Editor
    USER["vim"] = input(" Default editor '{}' [Enter] for default: ".format('vim'))
    if USER["vim"] == '':
        USER["vim"] = 'vim'

    print(" --- User Data ---")
    for key, val in USER.items():
        print('{} => {}'.format(key, val))
    print('')


def create_user_vim():
    """
    Create user's vim credentials for file templates
    """
    print("=== creating user.vim ===")
    f_vim = open('vim/user.vim', 'w')
    f_vim.write('let g:_NAME_    = {}\n'.format(USER["name"]))
    f_vim.write('let g:_USER_    = {}\n'.format(USER["user"]))
    f_vim.write('let g:_COMPANY_ = {}\n'.format(USER["company"]))
    f_vim.write('let g:_ORG_     = {}\n'.format(USER["org"]))
    f_vim.write('let g:_EMAIL_   = {}\n'.format(USER["email"]))
    f_vim.write('let g:_VIM_   = {}\n'.format(USER["vim"]))
    f_vim.close()


def create_user_git():
    """
    Create git user credentials
    """
    print("=== creating gitconfig ===")
    f_git = open('git/gitconfig', 'w')
    f_git.write('''[user]
    name = {name}
    email = {email}
[core]
    editor = {vim}
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
    amend = !git log -n 1 --pretty=tformat:%s%n%n%b | git commit -F - --amend
    details = log -n1 -p --format=fuller
    logpretty = log --graph --decorate --pretty=format:'%C(yellow)%h%Creset%C(auto)%d%n%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset'
    logshort = log --graph --decorate --pretty=format:'%C(yellow)%h%Creset -%C(auto)%h %d%Creset %s %C(green)(%cr) %C(blue)<%an>%Creset' --abbrev-commit
    s = status
    arc = "!git tag archive/$1 $1 -m "Archived on: $(date '+%Y-%m-%dT%H:%M:%S%z')" && git branch -D $1 && git push origin -d $1 #"
    arcl = "!git tag | grep '^archive' #"
[url "https://github.com/"]
    insteadOf = gh:
'''.format(name=USER["name"], email=USER["email"], vim=USER["vim"]))
    f_git.close()


def create_sym_links():
    """
    Create symbolic links for: vim, git, tmux, zsh, zprezto
    dotifles/vim -> ~/.vim
    dotfiles/vim/vimrc -> ~/.vimrc
    dotfiles/git/gitconfig -> ~/.gitconfig
    """
    symlinks = {
        SYSDATA['sdir'] + '/vim' : SYSDATA['home'] + '/.vim',
        SYSDATA['sdir'] + '/vim/vimrc' : SYSDATA['home'] + '/.vimrc',
        SYSDATA['sdir'] + '/tmux/tmux.conf' : SYSDATA['home'] + '/.tmux.conf',
        SYSDATA['sdir'] + '/git/gitconfig' : SYSDATA['home'] + '/.gitconfig',
    }
    print('=== Creating symlinks ===')

    for src, dest in symlinks.items():
        if os.path.isfile(dest):
            os.remove(dest)
        if os.path.islink(dest):
            os.unlink(dest)
        print(' {} -> {}'.format(src, dest))
        os.symlink(src, dest)


def export_dotfiles():
    """
    Export dotfiles system environments
    """
    print('=== Exporting DOTFILES Environment Variable ===')
    if SYSDATA['os'] == 'Darwin':
        if SYSDATA['shell'] == 'zsh':
            print(' Darwin detected: Selecting file ~/.zshrc')
            print(' Darwin detected: Selecting file ~/.zpresto')
        else:       # bash
            print(' Darwin detected: Selecting file ~/.bash_profile')

        f_shell = SYSDATA['home'] + '/.bash_profile'
        exportline = 'export DOTFILES=' + SYSDATA['sdir'] + '\n'
        autoruncode = 'export CLICOLOR=1\nsource $DOTFILES/shell/autorun.sh\n'

    else:
        f_shell = SYSDATA['home'] + '/.bashrc'
        exportline = 'export DOTFILES=' + SYSDATA['sdir'] + '\n'
        autoruncode = 'export CLICOLOR=1\nsource $DOTFILES/shell/autorun.sh\n'

    if os.path.isfile(f_shell) or os.path.islink(f_shell):
        with open(f_shell) as f_in:
            if any(line == exportline for line in f_in):
                print(' .bash_profile already modified')
            else:
                print(' modifying .bash_profile')
                f_sh = open(f_shell, 'a')
                f_sh.write(exportline)
                f_sh.write(autoruncode)
                f_sh.close()


def install_setup():
    """
    Install required packages for developer setup
    """
    ask_user_data()
    create_user_vim()
    create_user_git()
    create_sym_links()
    export_dotfiles()
    print('\n=== DONE ===\n')
    print('run the command: "vim +PackUpdate")')
    print('Then close and reopen ALL terminal windows to finish setup.')


def remove_setup():
    """
    Remove current setup. Create a backup of current system
    """
    pass


def install_powerlinefonts():
    """
    Download and install powerline fonts from repository
    """
#    Repo.clone_from(git_url, repo_dir)
#    if SYSDATA['os'] == 'Darwin':
#        subprocess.call("brew install fonts-powerline")
#    elif SYSDATA['os'] == 'Linux:
#        subprocess.call("sudo apt-get install fonts-powerline")
#    else:       # windows
#        pass
    git_url = "https://github.com/powerline/fonts.git"
    home_dir = os.getcwd()
    repo_dir = os.getcwd() + "/powerline"
    print("Cloning powerline fonts")
    Repo.clone_from(git_url, repo_dir)
    os.chdir(repo_dir)
    subprocess.call("./install.sh", shell=True)
    os.chdir(home_dir)
    shutil.rmtree(repo_dir)


def install_prezto():
    """
    Download and install prezto for zshell
    """
    git_url = "https://github.com/sorin-ionescu/prezto.git"
    repo_dir = "${ZDOTDIR:-$HOME}/.zprezto"
    src_link = os.getenv('HOME') + "/.zprezto/runcoms/"
    dst_link = os.getenv('HOME') + "/"
    print("Cloning prezto fonts")
    Repo.clone_from(git_url, repo_dir)
    # Create symlinks
    for rcfile in os.listdir(src_link):
        if rcfile == "README.md":
            continue
        elif rcfile == "zshrc" and os.path.isfile(os.getenv('HOME') + '/.zshrc'):
            print("Backing up existing .zshrc file")
            shutil.copy(os.getenv('HOME') + '/.zshrc',
                        os.getenv('HOME') + '/.zshrc.bk')
        print(src_link + rcfile + " to " + dst_link)
#        os.symlink(src_link + rcfile, dst_link)



def main():
    """
    Main Function for setup
    """
    #process command line arguments
    parser = argparse.ArgumentParser()
    xorgroup = parser.add_mutually_exclusive_group()
    xorgroup.add_argument('-i', '--install', help="Install Files",
                          action="store_true", default=False)
    xorgroup.add_argument('-r', '--remove', help="Remove Files",
                          action="store_true", default=False)
    #parser.add_argument('-', help="Column to show", type=int, default=16, dest="col")
    args = parser.parse_args()

    print("-- Command line arguments ---")
    print(args)
    print("")

    collect_system_data()
    display_system_data()
    if not check_dependencies():
        print("Error: Missing dependences.")
        quit()

    if args.install:
        install_setup()
    elif args.remove:
        remove_setup()


if __name__ == "__main__":
    main()
    exit(0)
