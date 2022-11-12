local has_dap, dap = pcall(require, 'dap')
if not has_dap then
  return
end

Nnoremap('<F5>', [[:lua require('dap').continue()<CR>]])
Nnoremap('<F10>', [[:lua require('dap').step_over()<CR>]])
Nnoremap('<F11>', [[:lua require('dap').step_into()<CR>]])
Nnoremap('<F12>', [[:lua require('dap').step_out()<CR>]])

Nnoremap('<Leader>db', [[:lua require('dap').toggle_breakpoint()<CR>]])
Nnoremap('<Leader>dB', [[:lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>]])
Nnoremap('<Leader>dp', [[:lua require('dap')set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]])
Nnoremap('<Leader>dr', [[:lua require('dap').repl.open()<CR>]])
Nnoremap('<Leader>dl', [[:lua require('dap').run_last()<CR>]])

local wk = require 'which-key'

wk.register {
  ['<Leader><Leader>'] = {
    d = {
      name = 'DAP (F5 = Continue, F10 Step Over, F11 Step Into, F12 Step Out',
      b = { 'Toggle Breakpoint' },
      B = { 'Set Breakpoint - Condition:' },
      p = { 'Set Breakpoint - Log point message:' },
      r = { 'Repl Open' },
      l = { 'Run Last' },
    },
  },
}
