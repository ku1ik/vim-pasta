# vim-pasta

Pasting in Vim with indentation adjusted to destination context.

## About

This plugin remaps `p` and `P` (`put` command) in normal and visual mode to do
context aware pasting. What it means is that indentation of pasted text is
adjusted properly to match indentation of surrounding code.

Basically it opens new, properly indented line (with `o` or `O`) in the place
you're pasting to then it pastes the text with `]p`. The result is nicely
indented code with relative indentation between pasted lines preserved.

### Why is it better than "]p" alone?

### Why is it better than "nnoremap <leader>p p`[v`]=" ?

## Installation

* With [pathogen.vim](https://github.com/tpope/vim-pathogen):

    cd ~/.vim/bundle
    git clone git://github.com/sickill/vim-pasta.git

* With [Vundle](https://github.com/gmarik/vundle):

    " .vimrc
    Bundle 'sickill/vim-pasta'

## Usage

Just paste as usual with `p` and `P`. Enjoy!

## Configuration

By default pasta is disabled for python and coffeescript because
syntax of these languages relies on indentation and desired indentation for
new lines can't be easily computed from existing code.

To change the list of filetypes for which pasta is enabled you can either
use black-listing or white-listing.

To black-list some filetypes put following in your .vimrc:

    let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml']

To white-list some filetypes put following in your .vimrc:

    let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']

*Note: if white list is defined no black list checking is performed.*

## Author

Marcin Kulik (@sickill)
