require'rooter'.setup {
    manual = false, -- weather to setup autocommand to root every time a file is opened
    echo = false, -- echo every time rooter is triggered
    patterns = { -- the patterns to find
      '.git',    -- same as patterns passed to nvim_lsp.util.root_pattern(patterns...)
      'Cargo.toml',
      'go.mod',
    },
    cd_command = 'lcd', -- the cd command to use, possible values are 'lcd', 'cd', and 'tcd'
    -- what to do when the rooter pattern is not found
    -- if this is 'current', will cd to the parent directory of current file
    -- if this is 'home', will cd to the home directory
    -- if this is 'none', will not do anything
    non_project_files = 'current',

    -- the start path to pass to nvim_lsp.util.root_pattern(patterns...)
    start_path = function()
      return vim.fn.expand [[%:p:h]]
    end,
}
