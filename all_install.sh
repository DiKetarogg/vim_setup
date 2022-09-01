#!/bin/bash
FORCE=$1
bash install_vimrc.sh
bash install_plugins.sh
bash install_scs.sh $FORCE
bash install_42header.sh $FORCE
bash install_c_cpp.sh









