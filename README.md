<div style="text-align:center"><a href="https://github.com/laerador/furry-vim"><img src="http://f.lc3dyr.de/furry-vim.png" width=150px /></a></div>

# Furry VIM 2.0

*This repository is a personal Vim configuration and not intended for widespread
use. While it is highly adaptable, it is recommended that one cherry-picks the
parts they want and understand.*

## Installation

```
$ git clone --recursive https://github.com/laerador/furry-vim ~/.vim
$ ln -s ~/.vim/vimrc ~/.vimrc
$ vim -c ":set nomore" +NeoBundleInstall +q
```

## Structure

The Idea behind this Vim configuration was to create a system that is easy to
configure and extend. To achieve that, all settings are split up into individual
files and sourced at startup. 

### Standard configuration files

At startup, *Furry VIM* sources all `*.vim` files inside the `~/.vim/config`
directory. These files are used to set the different options for Vim and load
additional parts of this config, e.g. the plugin-config.

### Plugin configuration files

The plugin configuration files are grouped together and stored inside
`~/.vim/bundles/`. For example, all colorscheme-bundles are found under
`~/.vim/bundles/color/*.vim`. Inside of these configuration files, NeoBundle is
used to install the plugin and settings for it can be set.

### Source order

In general, the files are sourced in no guaranteed order: The config simply
sources all files inside `~/.vim/config/` and the `bundles.vim` then sources and
loads all plugins inside `~/.vim/bundles/`. But since some things need to be set
*after* all plugins have been loaded, *Furry VIM* uses a simple mechanism to
defer files from being loaded right away and instead last: Whenever this
configuration finds a file named `*.after.vim` it will queue it instead of
sourcing it. After all other (non-after-)files have been sourced, the remaining
files will be.

## Settings and local configuration

Currently, *Furry VIM* only understands one option:

```
let g:furry_ignore_bundle_groups = []
```

This array specifies the subdirectories inside `~/.vim/bundles/` that will be
ignored by *Furry VIM*. This allows to easily control, which and how many
plugins will be used. For example, linux computer could set this option to
`[osx]` to prevent any OS X related plugins from being installed.

To set this option without changing the `.vimrc`, *Furry VIM* looks for two
*local* configuration files. These files should be used for system-dependent
configuration--if you which to make broader changes, add a config file to the
`~/.vim/config` or `~/.vim/bundles/*/` directory or change the appropriate parts. 

The first file is the `~/.vimrc.bundles.local` and it is used to set the
configuration option `g:furry_ignore_bundle_groups` and to add additional plugin
bundles. 

The second file is the `~/.vimrc.local` and it is always the last thing sourced
by *Furry VIM*. That means, that you can use it, to overwrite any settings set
by the default configuration.

*For both files you can find samples inside the `~/.vim/samples/` directory.*
