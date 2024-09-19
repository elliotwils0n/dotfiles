# dotfiles
Configuration files.

## Installation
Configuration files are managed with GNU Stow.
```shell
stow -t $HOME -Sv <package>
```

## Downloads

| Utilities               | Programming       | Code Editors              | Others                        |
| ----------------------- | ----------------- | ------------------------- | ----------------------------- |
| [Docker Engine][docker] | [Rust][rust]      | [Neovim][neovim]          | [Nerd fonts][nerd-fonts]      |
|                         | [Go][go]          | [Sublime Text][sublime]   | [Roboto font][roboto-font]    |
|                         | [SDKMAN!][sdkman] | [IntelliJ Idea][intellij] |                               |
|                         | [nvm][nvm]        |                           |                               |

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
<!-- Others -->
[nerd-fonts]: https://www.nerdfonts.com/font-downloads
[roboto-font]: https://fonts.google.com/specimen/Roboto

## Apps
``` shell
gnupg tmux stow ripgrep tree
```
