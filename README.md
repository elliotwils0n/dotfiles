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
> pacman -S docker rustup go nvm neovim intellij-idea-community-edition
> ```

| Utilities               | Programming       | Code Editors              |
| ----------------------- | ----------------- | ------------------------- |
| [Docker Engine][docker] | [Rust][rust]      | [Neovim][neovim]          |
|                         | [Go][go]          | [IntelliJ Idea][intellij] |
|                         | [nvm][nvm]        |                           |
|                         | [SDKMAN!][sdkman] |                           |

<!-- Utilities -->
[docker]: https://docs.docker.com/engine/install
<!-- Programming -->
[rust]: https://www.rust-lang.org/tools/install
[go]: https://go.dev/doc/install
[nvm]: https://github.com/nvm-sh/nvm#installing-and-updating
[sdkman]: https://sdkman.io/install
<!-- Code Editors -->
[neovim]: https://github.com/neovim/neovim/blob/master/BUILD.md
[intellij]: https://www.jetbrains.com/help/idea/installation-guide.html

## Shell tools
``` shell
bash-completion gnupg tmux stow ripgrep tree jq
```

## Init for remote servers
```shell
wget -O ~/.vimrc  https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.vimrc
wget -O ~/.bashrc https://raw.githubusercontent.com/elliotwils0n/dotfiles/refs/heads/master/home/.bashrc
```
