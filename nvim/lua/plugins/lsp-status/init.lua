-- return {

  -- 'nvim-lua/lsp-status.nvim',
  -- enabled = true,

  -- config = function() 

    local lsp_status = require('lsp-status')
    lsp_status.register_progress()
   
    local status = {}
   
    status.activate = function()
      lsp_status.config {
	select_symbol = status.select_symbol,
   
	indicator_errors = '',
	indicator_warnings = '',
	indicator_info = '',
	indicator_hint = '',
	indicator_ok = '',
	spinner_frames = {'⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷'},
      }
  
      lsp_status.register_progress()
    end

    status.select_symbol = function(cursor_pos, symbol)
      if symbol.valueRange then
	local value_range = {
	  ["start"] = {
	    character = 0,
	    line = vim.fn.byte2line(symbol.valueRange[1])
	  },
	  ["end"] = {
	    character = 0,
	    line = vim.fn.byte2line(symbol.valueRange[2])
	  }
	}
    
	return require("lsp-status.util").in_range(cursor_pos, value_range)
      end
    end
    
    status.on_attach = function(client)
      lsp_status.on_attach(client)
    
      vim.cmd [[augroup lsp_status]]
      vim.cmd [[  autocmd CursorHold,BufEnter <buffer> lua require('lsp-status').update_current_function()]]
      vim.cmd [[augroup END]]
    end
    
    status.statusline = function()
      -- local lsp = lsp_status.status()
      local errors = lsp_status.status_errors()
      local warnings = lsp_status.status_warnings()
      local info = lsp_status.status_info()
      local hints = lsp_status.status_hints()
      -- local capabilities = lsp_status.capabilities()
    
      if not errors or errors == '' then
	  errors = ' ∘'
      else
	errors = '%#ErrorMsg# ' .. errors .. ' %*'
      end
    
      if not warnings or warnings == '' then
	  warnings = ' ∘'
      else
	warnings = '%#GruvboxBlue# ' .. warnings .. '%*'
      end
    
      if not info or info == '' then
	  info = ' ∘'
      else
	  info = '%#GruvboxBlue# ' .. info .. '%*'
      end
    
      if not hints or hints == '' then
	  hints = ' ∘'
      else
	hints = '%#GruvboxBlue# ' .. hints .. ' %*'
      end
    
      return errors .. ' ' .. warnings .. ' '  .. info .. ' ' .. hints
    end 

    return status
  -- end
-- }
