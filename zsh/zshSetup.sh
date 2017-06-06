#!/bin/bash - 
#===============================================================================
#
#          FILE: zshSetup.sh
# 
#         USAGE: ./zshSetup.sh 
# 
#   DESCRIPTION: Updates the zshrc file. This is required due to the update
#                oh-my-zsh does. 
#        AUTHOR: Hugo Valle (), hugovalle1@weber.edu
#  ORGANIZATION: WSU
#       CREATED: 06/01/2017 01:06:20 PM
#===============================================================================

# Set Zsh
echo "${BOLD}Appending Aliases file to ~/.zshrc $RESET"
rm ~/.zshrc
ln -s $DOTFILES/zsh/zshrc ~/.zshrc
source ~/.zshrc

exit 0
