#!/bin/bash -
#===============================================================================
#
#          FILE: personal_aliases.sh
#
#         USAGE: ./personal_aliases.sh
#
#   DESCRIPTION: Personal aliases
#
#        AUTHOR: Dr. Hugo Valle (), hugovalle1@weber.edu
#  ORGANIZATION: WSU
#       CREATED: 06/07/2017 17:45:48
#      REVISION:  ---
#===============================================================================

# Personal Developer Aliases
#
alias gcc='gcc -std=c99 -Wall -Werror'
alias mpicc='mpicc-mpich-mp'
alias mysqlstart='sudo /opt/local/bin/mysqld_safe5 &'
alias mysqlstop='/opt/local/bin/mysqladmin5 -u root -p shutdown'

# ssh alias
alias icarus='ssh -X -Y hvalle@icarus.cs.weber.edu'
alias zlinux='ssh -X -Y wsui001@192.86.33.17'
alias zUNIX='ssh -X -Y wsui001@192.86.32.17'
alias mmf='ssh -X -Y us00139@192.86.32.178'
alias atlas='ssh -X -Y hvalle@tier3-atlas3.bellarmine.edu'
alias coeus='ssh -X -Y hvalle@137.190.19.22'
alias pi3='ssh -X -Y hvalle@137.190.179.221'
