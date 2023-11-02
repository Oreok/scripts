#!/bin/bash

export KUBECONFIG=~/.kube/config

mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"

echo "kubectl config exported!"

# Clone a GitHub repository
github_repo="https://gist.github.com/c5deba9a760411d6cf4ee0dfe046a126.git"
clone_directory="rep"

# Remove the existing directory if it exists
if [ -d "$clone_directory" ]; then
      rm -r "$clone_directory"
      fi

      git clone "$github_repo" "$clone_directory"

# Remove the existing .vimrc if it exists
if [ -e ~/.vimrc ]; then
      rm ~/.vimrc
      fi

# Move .vimrc to the root directory
cp "$clone_directory/.vimrc" ~/.vimrc

echo ".vimrc has been copied to the root directory"
