require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'c_sharp',
    'cmake',
    'cpp',
    'css',
    'csv',
    'dockerfile',
    'go',
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
  },
  -- ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
