setup_lvim() {
  # In this step it is assumed that all required languages ​​are previously configured at least with asdf or installed with package manager
  LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)  

}
