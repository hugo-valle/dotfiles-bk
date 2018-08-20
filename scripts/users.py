#!/usr/bin/env python3

# ============================================================================
# @file   users.py
# @brief  Create a list of user to be used by CreateUserLinux.sh
#
# @author hvalle
#
# @internal
#      Created  Friday, 04 May 2018
#     Modified  Friday, 04 May 2018
#     Revision  4
# Organization  Computer Science
#      Company  Weber State University
#
# @Copyright  Copyright (c) 2018, hvalle
#
# @License
#   This source code is released for free distribution under the terms of the
#   GNU General Public License as published by the Free Software Foundation.
#=============================================================================

def main():
    """
    Test your module
    """
    for i in range(100):
        print("wsu{0:03d}".format(i))


if __name__ == "__main__":
    main()
    exit(0)

