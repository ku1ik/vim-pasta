# vim-pasta

Pasting in Vim with indentation adjusted to destination context.

## About

This plugin remaps `p` and `P` (`put` command) in normal and visual mode to do
context aware pasting. What it means is that indentation of pasted text is
adjusted properly to match indentation of surrounding code.

Basically it opens new, properly indented line (with `o` or `O`) in the place
you're pasting to then it pastes the text with `]p`. The result is nicely
indented code with relative indentation between pasted lines preserved.

### Why is it better than ]p alone?

`]p` (and `]P`) adjusts indentation to the indentation of current line.
Consider following code:

    1  if jola
    2    misio
    3  end

If you paste with `]p` when cursor is in line 1 (`if jola`) you get it pasted
wrong:

    1  if jola
    2  <first pasted text>
    3    misio
    4  end

Now, if you paste with `]P` when cursor is in line 4 (`end`) you also get it
pasted wrong:

    1  if jola
    2  <first pasted text>
    3    misio
    4  <second pasted text>
    5  end

vim-pasta takes care of it.

### Why is it better than nnoremap <leader>p p\`[v\`]= ?

You can achieve "near-pasta experience" with following in you .vimrc:

    nnoremap <leader>p p`[v`]=

It pastes, visually selects pasted text and then re-indents it. In most cases
it works quite well. However when you're pasting hand indented code like this:

    obj = {
           a: 1,
           b: 2,
         foo: 3,
      barbaz: 4
    }

it re-indents it to be like this:

    obj = {
      a: 1,
      b: 2,
      foo: 3,
      barbaz: 4
    }

I hate when it happens. vim-pasta takes care of it.

Additionally vim-pasta detects type of visual selection that was used for
yanking and does its indenting magic only for linewise selections (VISUAL LINE),
contrary to above mapping.

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

By default pasta is disabled for python, coffeescript and markdown because for
these types desired indentation for new lines can't be easily computed from
existing code/text.

To change the list of filetypes for which pasta is enabled you can either
use black-listing or white-listing.

To black-list some filetypes put following in your .vimrc:

    let g:pasta_disabled_filetypes = ['python', 'coffee', 'yaml']

To white-list some filetypes put following in your .vimrc:

    let g:pasta_enabled_filetypes = ['ruby', 'javascript', 'css', 'sh']

*Note: if white list is defined no black list checking is performed.*

If you don't want pasta to override default `p` and `P` mappings you can
change it like this:

    let g:pasta_paste_before_mapping = ',P'
    let g:pasta_paste_after_mapping = ',p'

## Author

Marcin Kulik (@sickill)
