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

```
git clone --recursive git://github.com/laerador/furry-vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

Fire up your vim, execute a quick `:BundleInstall` to download all plugins and
you are ready to go!

### Step-by-Step 

#### Dependencies
First, be aware that this `vimrc` should only work with at least Vim 7.3. It
should just ignore older Versions, but if it does you should upgrade your Vim.

Other than that, this `vimrc` should run without any problems. But to be able to use
every Feature and Plugin, you will need some other Programms:

- For _ctag_-Related Plugins you will need to install [Exuberand
  Ctags](http://ctags.sourceforge.net/)
- To use _Gist_ in Vim you will need to have curl
- To use some Plugins like `VimCalc` and `Gundo` you will need to Install a
  Vim-Version with Python-Interface

#### Installation

To install _Furry-Vim_, use git and create a symlink to the `vimrc`

```
git clone --recursive git://github.com/laerador/furry-vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
```

_Furry-Vims_ Package Manager [Vundle][] now needs to install all your wonderful
Plugins by issuing the following Command in Vim `:BundleInstall`. After that,
simply restart Vim.

#### Configuration and Usage
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

At the moment, Furry-Vim has two settings which you can set in the. `g:furry_persistent` is an Integer-Variable with which you can controll if Persistent Undo, mksession and swap-settings are used. 

`g:furry_packages` is a List-Style Variable in which you can choose which
Plugin-Packages are installed.

## Included Plugins

_Furry-Vim_ includes several Plugins which are Categorized in 12 Packages to
easily choose which Plugins you need and which not. To choose the Packages, use
the `g:furry_persistent`-Variable in your .local.vimrc

The 12 Packages:
1. Color ( 'colors' )
    - Powerline, a fanzy and informative Statusline
    - 3 Colorshemes - Solarized, Tomorrow and Badwolf
    - Golden Ration, a Plugin to Resize Splits

2. Environment ( 'environment' )
    - CtrlP, a Fuzzy File Finder
    - Gundo, a graphical Tree-Undo (req. Python-Interface)
    - VimCalc, a Calculator in Vim (req. Python-Interface)
    - file-line, allows to Open Files at a specific Line
    - ZoomWin, to zoom Splits

3. Utility ( 'utility' )
    - Align, aligns Text
    - Commentary, easily comment Text
    - Unimpaired
    - Surround
    - Autoclose
    - Matchit
    - vim-space

4. Autocompletion and Snippets ( 'autocompletion' )
    - Neocomplcache, a powerful autocompletion-Engine
    - vim-snipmate, a powerful Snippet Engine

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
    - Gist-vim, View and Publish Gists

8. Markup ( 'markup' )
    - vim-markdown, Github-Flavoured Markdown Syntax Highlighting
    - Vim-liquid, Syntax Highlighting for Liquid Files

9. LaTeX ( 'latex' )
    - LaTeX-Box, a Latex-Plugin

10. HTML & CSS ( 'html' )
    - html5, Syntax for HTML5 Tags
    - Sparkup, Zencoding for HTML5
    - Vim-CSS3-Syntax
    - jQuery, Syntax for jQuery Framework
    - colorv, show Colors

11. Python ( 'python' )
    - python-mode

12. Ctags ( 'ctags' )
    - Tagbar
    - Easytags

[Vundle]: http://google.com
