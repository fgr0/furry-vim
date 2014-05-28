# Furry-Vim

The fluffiest Vim Configuration out there.

![Look at all this cuteness!](http://lc3dyr.de/images/2012-08-09-furry-vim.png)

## About

_Furry-Vim_ is a modern Vim-Configuration File based around the Plugin-Manager
[Vundle][]. Given some dependencies Furry-Vim can serve as an
everything-you-need Configuration for your favorite Editor, it is easily
extensible and customizable if you don't want to read through the 800 lines of
the vimrc and it can also just be used to cherry-pick parts for your own
personal Vim Configuration. 

## Installation

### Quick

To use _Furry-Vim_, simply clone this repository and Sym-link the vimrc

```bash
git clone --recursive git://github.com/laerador/furry-vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

Fire up your vim, execute a quick `:BundleInstall` to download all plugins and
you are ready to go!

### Step-by-Step 

#### Dependencies
First, be aware that this `vimrc` should only work with at least **Vim 7.3.** It
should warn you about older Versions, but if it does you should consider 
upgrading your Vim.

Other than that, this `vimrc` should run without any problems. But to be able to use
every Feature and Plugin, you will need some other Programs:

- For _ctag_-related Plugins you will need to install [Exuberand
  Ctags](http://ctags.sourceforge.net/)
- To use some Plugins like `VimCalc` and `Gundo` you will need to Install a
  Vim-Version with Python-Interface
- To use _Gist_ in Vim you will need to have curl
- Mac only, for vim-airline you need Powerline fonts https://github.com/Lokaltog/powerline-fonts

#### Installation

To install _Furry-Vim_, use git to clone this repository and create a symlink to 
the `vimrc`

```bash
git clone --recursive git://github.com/laerador/furry-vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

Furry-Vims Package Manager [Vundle][] now needs to install all your wonderful
Plugins by issuing the following command in Vim: `:BundleInstall`. After that,
simply restart Vim.

#### Configuration and Usage
##### Configuration
Furry-Vim is supposed to be used as a Core Configuration and is designed to be
shared over several Systems. (For Example: Your computer at Work, at Home, the
Server you connect too, ...) Because of this, _Furry-Vim_ looks for 2 files in
your Home, `~/.local.vimrc` and `~/.after.local.vimrc`, which are sourced if
found.

1. `.local.vimrc` 
    This file is sourced by vim right after Vundle has been initalized and
    before any Plugins or settings have been set. 

    This enables you to set some of the _Furry-Vim_-Settings (see below) and add
    your own Plugins.

2. `.after.local.vimrc`
    This file is sourced right at the end of the vimrc after every setting has
    been set. 

    This enables you to overwrite some of the settings this vimrc sets

3. `.theme.local.vimrc`
    This file is sourced right before applying the colorsettings.

    It can be used to make sure that plugins have been loaded before setting the 
    colorscheme. (All settings you can do in this vimrc can also be done in the 
    other two files)

##### Settings
At the moment, Furry-Vim has three variables which you can set inside the 
`.local.vimrc`:

* `g:furry_packages` is a List-Style Variable in which you can choose which 
  Plugin-Packages are installed. (see below)
* `g:furry_persistent` is an Integer-Variable with which you can control if 
  Persistent Undo, mksession and swap-settings are used:
    - `0` : Only the global swap-directory is enabled
    - `1` : In addition to `0`, also the stateless views are enabled (see `:h 
      view`)
    - `2` : In addition to `1`, also persistent undo is enabled (see `:h 
      persistent-undo`)

* `g:furry_usertheme` is an Integer-Variable which stops Furry-Vim to set 
  theme-related settings. Set it to `0` to disable Furry-Vims theme settings.


## Plugins

_Furry-Vim_ does only include [Vundle][] as Plugin, which then takes care of 
installing (and updating) all of your Plugins. When you first install this 
vimrc, no Plugins will have been installed and you need to use `:BundleInstall` 
to install the Plugins tracked by Vundle. 

This allows you to control how big your installation is going to be and which 
Plugins you want to use.

### Included Plugins
These are the Plugins Vundle will install when you run `:BundleInstall`. They 
are categorized in 14 _Packages_ to easily choose which Plugins you need and 
which not. To choose the Packages, use the `g:furry_packages`-Variable in your 
`.local.vimrc`. If you do not set this variable, Furry-Vim will install all 
Packages.

##### Example:
```vim
let g:furry_packages = ['colors','environment']
```
This will only install Plugins from the Packages __Color__ and __Environment__. 

#### Packages

1. Color ( 'colors' )
    - Powerline, a fanzy and informative Statusline
    - 4 Colorshemes - Solarized, Tomorrow, Github and Badwolf
    - Golden Ration, a Plugin to Resize Splits

2. Environment ( 'environment' )
    - Gundo, a graphical Tree-Undo (req. Python-Interface)
    - VimCalc, a Calculator in Vim (req. Python-Interface)
    - file-line, allows to Open Files at a specific Line
    - Numbers, a Plugin for _smart_ Linenumbers

3. Utility ( 'utility' )
    - Align, aligns Text
    - tcomment, easily comment code
    - vim-indent-guides
    - Unimpaired
    - Speeddating
    - Surround
    - Autoclose
    - Matchit
    - Togglelist
    - Multiple Cursors (like in Sublime)
    - Ack.vim, a Interface for ack

4. Autocompletion and Snippets ( 'autocompletion' )
    - Neocomplcache, a powerful autocompletion-Engine
    - Neosnippet, a powerful Snippet Engine

5. Views ( 'views' )
    - Restore_view, automatically save and restore Views
    - Vim-Session, Save and Load Sessions

6. Developing ( 'devel' )
    - SingleCompile
    - Syntastic

7. Git ( 'git' )
    - Fugitive, a Gitwrapper for vim
    - Gitv, a Gitk-like Gitbrowser
    - vim-git, Syntax Highlighting
    - Gitgutter, shows Diff-Information in Signs-Column
    - textobj-gitgutter, use humps for motions
    - Gist-vim, View and Publish Gists

8. Markup ( 'markup' )
    - vim-pandoc, Syntax Highlighting for Pandoc Files
    - Vim-liquid, Syntax Highlighting for Liquid Files
    - Vim-Notes, Global Notes Plugin

9. LaTeX ( 'latex' )
    - LaTeX-Box, a Latex-Plugin

10. HTML & CSS ( 'html' )
    - html5, Syntax for HTML5 Tags
    - Sparkup, Zencoding for HTML5
    - Vim-CSS3-Syntax
    - jQuery, Syntax for jQuery Framework
    - vim-haml

11. Python ( 'python' )
    - Jedi-vim

12. Go ( 'go' )
    - Gocode

13. Mac OS X Related ( 'osx' )
    - Applescript.vim, Syntax Highlighting for Applescript
    - Macvim-Skim, pdfsync for latexfiles (only with 'latex' )

14. Ctags ( 'ctags' )
    - Tagbar
    - Easytags, automatically create and highlight ctags

### Installing your own Plugins
You can simply add your own Plugins by using Vundle's `Bundle` statement inside 
your `.local.vimrc` -- here an example adding a new colorscheme 
_vim-distinguished_ from 
[https://github.com/Lokaltog/vim-distinguished](https://github.com/Lokaltog/vim-distinguished)

```vim
Bundle 'Lokaltog/vim-distinguished'
```

That's it!

### Updating Plugins
To update all Plugins, that are installed by Vundle, use the command 
`:BundleInstall!` (note the exclamation-mark). This installes all new Plugins 
_and_ updates your old ones.

## Development
_Furry-Vim_ is mainly my personal configuration for Vim, so most of the settings 
are chosen by my preference. But still, if you find mistakes, have comments or 
different solutions, please let me know -- either via Pull Requests or simply 
Issues.

[Vundle]: http://google.com
