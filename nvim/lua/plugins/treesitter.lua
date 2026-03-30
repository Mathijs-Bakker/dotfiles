return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local languages = {
      'bash',
      'c',
      'c_sharp',
      'cmake',
      'cpp',
      'css',
      'csv',
      'dockerfile',
      'go',
      'gdscript',
      'godot_resource',
      'gdshader',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'ocaml',
      'ocaml_interface',
      'php',
      'python',
      'regex',
      'regex',
      'rust',
      'sql',
      'toml',
      'typescript',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
      'zig',
    }

    local treesitter = require 'nvim-treesitter'
    treesitter.setup {
      install_dir = vim.fn.stdpath 'data' .. '/site',
    }
    treesitter.install(languages)
  end,
}
