#!/bin/bash

txtblk='\033[0;30m' # Black - Regular
txtred='\033[0;31m' # Red
txtgrn='\033[0;32m' # Green
txtylw='\033[0;33m' # Yellow
txtblu='\033[0;34m' # Blue
txtpur='\033[0;35m' # Purple
txtcyn='\033[0;36m' # Cyan
txtwht='\033[0;37m' # White
bldblk='\033[1;30m' # Black - Bold
bldred='\033[1;31m' # Red
bldgrn='\033[1;32m' # Green

undblk='\033[4;30m' # Black - Underline
undred='\033[4;31m' # Red

bakblk='\033[40m'   # Black - Background
bakred='\033[41m'   # Red
badgrn='\033[42m'   # Green
txtrst='\033[0m'    # Text Reset

echolor() {
  if (( $? ==0 )) ; then
    echo -e "${txtgrn}OK - ${@}${txtrst}"
  else
    echo -e "${txtred}KO - ${@}${txtrst}"
  fi
}

info() {
    echo -e "${txtblu}INFO - ${@}${txtrst}"
}
