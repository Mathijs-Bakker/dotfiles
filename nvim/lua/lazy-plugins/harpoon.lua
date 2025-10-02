return {
  -- 'ThePrimeagen/harpoon',
  -- branch = 'harpoon2',
  dir = '~/Repositories/harpoon/',
  branch = 'fix/325-swap-file',
  dependencies = { 'nvim-lua/plenary.nvim' },
  enabled = true,
  settings = {
    -- save_on_toggle = true,
    sync_on_ui_close = true,
  },

  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {
      settings = {
        save_on_toggle = true,
        -- sync_on_ui_close = true,
      },
    }
    local list = function()
      return harpoon:list()
    end

    -- base mappings (always available)
    vim.keymap.set('n', ',m', function()
      list():add()
    end, { desc = 'Harpoon mark file' })
    vim.keymap.set('n', ',e', function()
      harpoon.ui:toggle_quick_menu(list())
    end, { desc = 'Harpoon quick menu' })
    vim.keymap.set('n', ',p', function()
      list():prev()
    end, { desc = 'Harpoon previous mark' })
    vim.keymap.set('n', ',n', function()
      list():next()
    end, { desc = 'Harpoon next mark' })

    -- KEEBS:

    -- layouts
    local layouts = {
      glove80 = { 'h', 't', 'n', 's', 'f' },
      qwerty = { 'a', 's', 'd', 'f', 'g' },
    }

    -- local current_layout = 'glove80'
    local current_layout = 'qwerty'

    --- apply layout
    local function apply_layout(name)
      -- remove previous layout
      for _, key in ipairs(layouts[current_layout]) do
        pcall(vim.keymap.del, 'n', ',' .. key .. '')
      end

      -- apply new one
      for i, key in ipairs(layouts[name]) do
        vim.keymap.set('n', ',' .. key .. '', function()
          list():select(i)
        end, { desc = 'Harpoon to file ' .. i })
      end
      current_layout = name
      vim.notify('Harpoon keys set to ' .. name, vim.log.levels.INFO)
    end

    -- user command to toggle
    vim.api.nvim_create_user_command('HarpoonKeysToggle', function()
      if current_layout == 'glove80' then
        apply_layout 'qwerty'
      else
        apply_layout 'glove80'
      end
    end, {})

    -- apply default
    apply_layout(current_layout)
  end,
}
