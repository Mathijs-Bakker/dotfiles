require'rooter'.setup {
    manual = false,
    echo = false,
    patterns = {
      '.git',    -- same as patterns passed to nvim_lsp.util.root_pattern(patterns...)
      '.sln',
      'Assets',
    },
    cd_command = 'lcd',
    non_project_files = 'current',

    -- the start path to pass to nvim_lsp.util.root_pattern(patterns...)
    start_path = function()
      return vim.fn.expand [[%:p:h]]
    end,
}
