# My Dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
brew install git
```

### Stow

```
brew install stow
```

### Alias Dependencies

You can either install these to use all commands in the zshrc file but it is not required

```
brew install eza zeitfetch lazygit
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:AidanWickes/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

### Video Example

["Stow has forever changed the way I manage my dotfiles" - Dreams of Autonomy](https://www.youtube.com/watch?v=y6XCebnB9gs)
