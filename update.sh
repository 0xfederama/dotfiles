#!/bin/sh

echo "Backing up everything..."
sudo mindot backup .

if [ ! -d ".git" ]; then
  echo "This directory is not a Git repository. Aborting."
  exit 1
fi

sudo cp -r ./nvim ./.config
sudo rm -rf ./nvim
brew bundle dump --force

git status
read -p "Do you want to add and push everything? [Y/n] " answer
case "$answer" in
    [yY] | [yY][eE][sS] | "")
    git add --all
    read -p "Enter the commit message: " msg
    git commit -m "$msg"
    git push
    ;;
  [nN])
    ;;
  *)
    echo "Invalid input. Exiting."
    ;;
esac
