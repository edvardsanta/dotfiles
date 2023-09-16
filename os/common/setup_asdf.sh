# Function to install ASDF and set up programming languages
setup_asdf() {
    # Clone ASDF repository
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
   
    # i think that is important, because of that i am exiting the script
    cd ~/.asdf || printf "asdf not cloned"  | exit
    
    # Add ASDF to your shell configuration (e.g., .zshrc)
    echo -e "\n. $HOME/.asdf/asdf.sh" >> ~/.zshrc
    ## Autocomplete stuff
    echo -e "\nfpath=(${ASDF_DIR}/completions $fpath)"
    echo -e "\nautoload -Uz compinit && compinit"

    source ~/.zshrc
      
    # Plugin manager
    install_plugin_manager
    # After added all plugins specified on .plugin-versions, now we will install the versions specified in .tool-versions (only global)
    asdf install
}


install_plugin_manager(){
    asdf plugin add asdf-plugin-manager https://github.com/asdf-community/asdf-plugin-manager.git
    asdf install asdf-plugin-manager 1.1.1
    asdf global asdf-plugin-manager 1.1.1
    asdf-plugin-manager add-all
}
