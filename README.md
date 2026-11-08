# dotfiles
Configuration files are managed with GNU Stow.

## Installation
```shell
stow -t $HOME -Sv home
```

## Uninstalling
```shell
stow -t $HOME -Dv home
```

## Shell tools
```
vim git clang gnupg scdaemon bash-completion tmux stow fzf ripgrep tree jq xclip tree-sitter-cli
```

## Downloads
__Utilities__:
[Docker Engine][docker] | [Neovim][neovim] |  [IntelliJ Idea][intellij]

__Programming__:
[Rust][rust] | [Go][go] | [SDKMAN!][sdkman] | [nvm][nvm]

<!-- Utilities -->
[docker]: https://docs.docker.com/engine/install
[neovim]: https://github.com/neovim/neovim/blob/master/BUILD.md
[intellij]: https://www.jetbrains.com/help/idea/installation-guide.html
<!-- Programming -->
[rust]: https://www.rust-lang.org/tools/install
[go]: https://go.dev/doc/install
[sdkman]: https://sdkman.io/install
[nvm]: https://github.com/nvm-sh/nvm#install--update-script


## Remote servers
```shell
wget -O ~/.vimrc  https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.vimrc
wget -O ~/.bashrc https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.bashrc
```
