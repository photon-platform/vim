
#############################
Vim configurations for PHOTON
#############################

.. code:: bash

   cd ~
   sudo apt install build-essential cmake
   git clone git@github.com:photon-platform/.vim --recurse-submodules
   ~/.vim/set_vimrc.sh
   # build YouCompleteMe util
   cd ~/.vim/photon/completion
   git submodule update --init --recursive
   python3 install.py

use ``add_submodule.sh`` to add photon vim plugins
