# dotfiles
Configuration files are managed with GNU Stow.

## Installation
```shell
stow -t $HOME -Sv home nvim
stow -t $HOME -Sv --no-folding gpg
```

## Uninstalling
```shell
stow -t $HOME -Dv home nvim gpg
```

## Downloads

| Utilities               | Programming       | Code Editors              |
| ----------------------- | ----------------- | ------------------------- |
| [Docker Engine][docker] | [Rust][rust]      | [Neovim][neovim]          |
|                         | [Go][go]          | [Sublime Text][sublime]   |
|                         | [SDKMAN!][sdkman] | [IntelliJ Idea][intellij] |
|                         | [nvm][nvm]        |                           |

<!-- Utilities -->
[docker]: https://docs.docker.com/engine/install
<!-- Programming -->
[rust]: https://www.rust-lang.org/tools/install
[go]: https://go.dev/doc/install
[sdkman]: https://sdkman.io/install
[nvm]: https://github.com/nvm-sh/nvm#installing-and-updating
<!-- Code Editors -->
[neovim]: https://github.com/neovim/neovim/blob/master/BUILD.md
[sublime]: https://www.sublimetext.com/download
[intellij]: https://www.jetbrains.com/help/idea/installation-guide.html

## Apps
``` shell
gnupg tmux stow ripgrep tree
```

## Init for remote servers
```shell
wget -O ~/.vimrc  https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.vimrc
wget -O ~/.bashrc https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.bashrc
```
