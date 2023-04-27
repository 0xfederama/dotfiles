#!/bin/sh

echo "Backing up everything..."
sudo mindot backup .
echo "Done"

if [ ! -d ".git" ]; then
  echo "This directory is not a Git repository. Aborting."
  exit 1
fi

sudo cp -r ./nvim ./.config
sudo rm -rf ./nvim

git status
read -p "Do you want to push everything? [Y/n] " answer
case "$answer" in
    [yY] | [yY][eE][sS] | "")
    git add --all
    read -p "Enter the commit message: " msg
    git commit -m "$msg"
    # git push
    echo pushing
    ;;
  [nN])
    ;;
  *)
    echo "Invalid input. Exiting."
    ;;
esac
