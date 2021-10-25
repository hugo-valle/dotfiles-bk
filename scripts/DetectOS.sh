#!/bin/bash -
#===============================================================================
#
#          FILE: DetectOS.sh
#
#         USAGE: ./DetectOS.sh
#
#   DESCRIPTION: Detect the system OS
#
#         NOTES: ---
#        AUTHOR: Hugo Valle (hvalle), hugovalle1@weber.edu
#  ORGANIZATION: WSU
#  Revision  06
#  Modified  Wednesday, 20 October 2021
#===============================================================================

set -o nounset                                  # Treat unset variables as an error
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


