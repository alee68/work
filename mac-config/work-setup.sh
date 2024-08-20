#!/bin/bash

### For work Mac

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # https://brew.sh/

# Create SSH key pairs:
ssh-keygen -t rsa; ssh-keygen -t ed25519

# Config SSH
cat > ~/.ssh/config << EOL
Host *
  UseKeychain yes
EOL

# Install Terraform: https://developer.hashicorp.com/terraform/install

# Essentials
brew install --cask google-chrome
brew install --cask visual-studio-code
brew install --cask slack
brew install --cask spotify
brew install awscli
brew install python
brew install pyenv
brew install tfenv
echo "Install boto3 by best practice way (in virtual env) or: /opt/homebrew/bin/pip3 install boto3 --break-system-packages"

# Copy ~/.zprofile, related files