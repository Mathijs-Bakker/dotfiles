let g:lightline = {
        \   'colorscheme': 'base16',
        \   'active': {
        \       'left': [ [ 'mode', 'paste' ],
        \               [ 'gitbranch' ],
        \               [ 'readonly', 'filetype', 'filename' ]],
        \       'right': [ [ 'percent' ], [ 'lineinfo' ],
        \               [ 'fileformat', 'fileencoding' ],
        \               [ 'gitblame', 'currentfunction',  'cocstatus', 'linter_errors', 'linter_warnings' ]]
        \   },
        \   'component_expand': {
        \   },
        \   'component_type': {
        \       'readonly': 'error',
        \       'linter_warnings': 'warning',
        \       'linter_errors': 'error'
        \   },
        \   'component_function': {
        \       'fileencoding': 'helpers#lightline#fileEncoding',
        \       'filename': 'helpers#lightline#fileName',
        \       'fileformat': 'helpers#lightline#fileFormat',
        \       'filetype': 'helpers#lightline#fileType',
        \       'gitbranch': 'helpers#lightline#gitBranch',
        \       'cocstatus': 'coc#status',
        \       'currentfunction': 'helpers#lightline#currentFunction',
        \       'gitblame': 'helpers#lightline#gitBlame'
        \   },
        \   'tabline': {
        \       'left': [ [ 'tabs' ] ],
        \       'right': [ [ 'close' ] ]
        \   },
        \   'tab': {
        \       'active': [ 'filename', 'modified' ],
        \       'inactive': [ 'filename', 'modified' ],
        \   },
        \   'separator': { 'left': '', 'right': '' },
        \   'subseparator': { 'left': '', 'right': '' }
    \ }
