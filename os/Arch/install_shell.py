import subprocess
import sys

# Append dotfiles workspace
sys.path.append("../common/python")
from shellplugins import *


def install_zsh():
    subprocess.run(["sudo", "pacman", "-S", "zsh"])
    subprocess.run(["chsh", "-s", "/bin/zsh"])
    choice = input("Do you want to install oh my zsh? (Y/N)")
    if choice == "y" or choice == "y":
        install_oh_my_zsh()
    else:
        print("Oh my zsh not installed")


def install_fish():
    subprocess.run(["sudo", "pacman", "-S", "fish"])
    subprocess.run(["chsh", "-s", "/usr/bin/fish"])


def main():
    print("Select a shell to install:")
    print("1. Zsh")
    print("2. Fish")
    print("3. Nushell")
    print("4. Elvish")
    print("5. Maintain default shell (No changes)")

    choice = input("Enter the number of your choice: ")

    if choice == "1":
        install_zsh()
    elif choice == "2":
        install_fish()
    elif choice == "5":
        print("Maintaining default shell.")
    else:
        print("Invalid choice. No changes made.")


if __name__ == "__main__":
    main()
