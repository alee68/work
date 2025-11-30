# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#####################
### START GENERIC ###
#####################

# python alias
alias python="python3"

# kubectl alias
alias k="kubectl"

# Git remove file from MR
git-rm-file-from-mr() {
    local filename="$1"

    if [[ -z "$filename" ]]; then
        echo "Usage: git-rm-file-from-mr <filename>" >&2
        return 1
    fi

    git rm --cached "$filename" || return 1
}

# Check K8s cert expiration; see if rotation needed
k8s-cert-check(){
    cat ~/.kube/config | grep 'client-certificate-data' | cut -f2 -d: | tr -d ' ' | base64 -d | openssl x509 -nooout -enddate
}

# # Docker login
# login-docker() {
#     docker login <registry:repository> -u alee
# }

# # Docker image: retag, push to new registry/repoistory
# dockerretagpush() {
#   local repo_prefix="$1"
#   local old_image="$2"

#   if [[ -z "$repo_prefix" || -z "$old_image" ]]; then
#     echo "Usage: dockerretagpush <repo_prefix> <old_image>" >&2
#     return 1
#   fi      

#   # Extract <image_name> and <image_tag>
#   local image_name_tag="${old_image##*/}" # <image_name>:<image_tag>
#   local image_name="${image_name_tag%%:*}" # <image_name>
#   local image_tag="${image_name_tag##*:}" # <image_tag>

#   # # If no tag is supplied, default to "latest"
#   # [[ "$image_tag" == "$image_name_tag" ]] && image_tag="latest"

#   local new_prefix="registry/repository"
#   local new_image="${new_prefix}/${repo_prefix}/${image_name}:${image_tag}"

#   echo "Tagging $old_image -> $new_image"
#   docker tag "$old_image" "$new_image" || return 1

#   echo "Pushing $new_image"
#   docker push "$new_image" || return 1

#   echo "✅ Successfully pushed $new_image"
# }

# # Docker: Get image ID
# docker-get-image-id() {
#     docker images -q <registry/repository/image>:<tag>
# }

# # Docker Entrypoint test
# docker-entrypoint-test() {
#     docker build . -t <registry/repository/image>:<tag> --no-cache; docker run -e TEST_BASE_PATH=/my-new-path --rm -it --entrypoint /bin/sh "$(docker images -q <registry/repository/image>:<tag> | head -n1)"

#     # Note: Need to manually run entrypoint script after logging in
# }

### Git Rebase
# Assumptions: Feature branch is "fbranch"; assume remote fbranch is already in rebase hell, where it shows a huge number of commits and changes... 

# git checkout <commit-hash> # commit where you actually want to rebase on
# git switch -c fbranch #this branch already existing in remote but re-create it locally anyway
# git fetch origin
# git rebase main
# git add .; git commit -m "Commit message"
# git push --force-with-lease origin fbranch
###################
### END GENERIC ###
###################