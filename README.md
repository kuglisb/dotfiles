# Dotfiles

## Installation

- Clone the repository
- The bootstrapper script will pull in the latest version and copy the files to the home folder

```bash
git clone git@github.com:kuglisb/dotfiles && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

## Install Homebrew formulae

```bash
./brew.sh
```
