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
> [!NOTE]
> For arch linux use pacman:
> ```shell
> pacman -S docker neovim rustup go nvm
> ```

| Utilities                 | Programming       |
|---------------------------|-------------------|
| [Docker Engine][docker]   | [Rust][rust]      |
| [Neovim][neovim]          | [Go][go]          |
| [IntelliJ Idea][intellij] | [nvm][nvm]        |
|                           | [SDKMAN!][sdkman] |

<!-- Utilities -->
[docker]: https://docs.docker.com/engine/install
[neovim]: https://github.com/neovim/neovim/blob/master/BUILD.md
[intellij]: https://www.jetbrains.com/help/idea/installation-guide.html
<!-- Programming -->
[rust]: https://www.rust-lang.org/tools/install
[go]: https://go.dev/doc/install
[nvm]: https://github.com/nvm-sh/nvm#installing-and-updating
[sdkman]: https://sdkman.io/install

## Shell tools
```
bash-completion gnupg tmux stow ripgrep tree jq
```

## Remote servers
```shell
wget -O ~/.vimrc  https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.vimrc
wget -O ~/.bashrc https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.bashrc
```
