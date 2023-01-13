local ls = require 'luasnip'
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require('luasnip.extras').lambda
local r = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.expand_conditions'

-- Every unspecified option will be set to the default.
ls.config.set_config {
  history = true,
  -- Update more often, :h events for more info.
  updateevents = 'TextChanged,TextChangedI',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { 'choiceNode', 'Comment' } },
      },
    },
  },
  -- treesitter-hl has 100, use something higher (default is 200).
  ext_base_prio = 300,
  -- minimal increase in priority.
  ext_prio_increase = 1,
  enable_autosnippets = true,
}

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args)
  return args[1]
end

-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local rec_ls
rec_ls = function()
  return sn(
    nil,
    c(1, {
      -- Order is important, sn(...) first would cause infinite loop of expansion.
      t '',
      sn(nil, { t { '', '\t\\item ' }, i(1), d(2, rec_ls, {}) }),
    })
  )
end

-- complicated function for dynamicNode.
local function jdocsnip(args, _, old_state)
  local nodes = {
    t { '/**', ' * ' },
    i(1, 'A short Description'),
    t { '', '' },
  }

  -- These will be merged with the snippet; that way, should the snippet be updated,
  -- some user input eg. text can be referred to in the new snippet.
  local param_nodes = {}

  if old_state then
    nodes[2] = i(1, old_state.descr:get_text())
  end
  param_nodes.descr = nodes[2]

  -- At least one param.
  if string.find(args[2][1], ', ') then
    vim.list_extend(nodes, { t { ' * ', '' } })
  end

  local insert = 2
  for indx, arg in ipairs(vim.split(args[2][1], ', ', true)) do
    -- Get actual name parameter.
    arg = vim.split(arg, ' ', true)[2]
    if arg then
      local inode
      -- if there was some text in this parameter, use it as static_text for this new snippet.
      if old_state and old_state[arg] then
        inode = i(insert, old_state['arg' .. arg]:get_text())
      else
        inode = i(insert)
      end
      vim.list_extend(nodes, { t { ' * @param ' .. arg .. ' ' }, inode, t { '', '' } })
      param_nodes['arg' .. arg] = inode

      insert = insert + 1
    end
  end

  if args[1][1] ~= 'void' then
    local inode
    if old_state and old_state.ret then
      inode = i(insert, old_state.ret:get_text())
    else
      inode = i(insert)
    end

    vim.list_extend(nodes, { t { ' * ', ' * @return ' }, inode, t { '', '' } })
    param_nodes.ret = inode
    insert = insert + 1
  end

  if vim.tbl_count(args[3]) ~= 1 then
    local exc = string.gsub(args[3][2], ' throws ', '')
    local ins
    if old_state and old_state.ex then
      ins = i(insert, old_state.ex:get_text())
    else
      ins = i(insert)
    end
    vim.list_extend(nodes, { t { ' * ', ' * @throws ' .. exc .. ' ' }, ins, t { '', '' } })
    param_nodes.ex = ins
    insert = insert + 1
  end

  vim.list_extend(nodes, { t { ' */' } })

  local snip = sn(nil, nodes)
  -- Error on attempting overwrite.
  snip.old_state = param_nodes
  return snip
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
  local file = io.popen(command, 'r')
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

-- Returns a snippet_node wrapped around an insert_node whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, state, fmt)
  local fmt = fmt or '%Y-%m-%d'
  return sn(nil, i(1, os.date(fmt)))
end
-- require 'ls-snips.ft-test'

-- stylua: ignore
ls.add_snippets(nil, {
  all = {
    -- s('trigger',
    -- {
    --   t { '', 'After expanding, the cursor is here ->' },
    --   i(1),
    --   t { 'After jumping forward once, cursor is here ->' },
    --   i(2),
    --   t { '', 'After jumping once more, the snippet is exited there ->' },
    --   i(0),
    -- }),

    s('{', { t { '{' }, i(0), t {'}'} }), -- {}
    s('[', { t { '[' }, i(0), t {']'} }), -- []
    s('(', { t { '(' }, i(0), t {')'} }), -- ()
    s('"', { t { '"' }, i(0), t {'"'} }), -- ""
    s('\'', { t { '\'' }, i(0), t {'\''} }), -- ''
    s('<', { t { '<' }, i(0), t {'>'} }), -- <>
    s('`', { t { '`' }, i(0), t {'`'} }), -- ` `
    s('```', { t { '```' }, i(0), t {'```'} }), -- ``` ```
  },

  rust = {

    s('derivedebug', t '#[derive(Debug)]'),
    s('deadcode', t '#[allow(dead_code)]'),
    s('allowfreedom', t '#![allow(clippy::disallowed_names, unused_variables, dead_code)]'),

    s('clippypedantic', t '#![warn(clippy::all, clippy::pedantic)]'),

    s('print', {
      -- t {'println!("'}, i(1), t {' {:?}", '}, i(0), t {');'}}),
      t {'println!("'}, i(1), t {' {'}, i(0), t {':?}");'}}),

    s('for',
    {
	t {'for '}, i(1), t {' in ' }, i(2), t {' {', ''},
	      i(0),
	t {'}', ''},
    }),

    s('struct',
    {
      t {'#[derive(Debug)]', ''},
      t {'struct '}, i(1), t {' {', ''},
	    i(0),
      t {'}', ''},
    }),

    s('test',
    {
    	t {'#[test]', ''},
        t {'fn '}, i(1), t {'() {', ''},
        t {'	assert'}, i(0), t {'', ''},
        t {'}'},
    }),

    s('testcfg',
    {
      t {'#[cfg(test)]', ''},
      t {'mod '}, i(1), t {' {', ''},
      t {'	#[test]', ''},
      t {'	fn '}, i(2), t {'() {', ''},
      t {'		assert'}, i(0), t {'', ''},
      t {'	}', ''},
      t {'}'},
    }),

    -- s('if',
    -- {
    --   t {'if '}, i(1), t {' {', ''},
	   -- i(0),
    --   t {'}'},
    -- }),
  },

  lua = {
    s('stylelua', t '-- stylua: ignore'),
  },
  cs = {
    s('ctor',
    {
      t { 'public ' }, i(1), t { '(' }, i(2), t {' ' }, i(3), t { ')', '' },
      t { '{', '' },
	i(0),
      t { '', '}' },
    }),
    s('cw',
    {
      t { 'System.Console.WriteLine('}, i(0), t { ');' },
    }),
    s('class',
    {
      c(1, {
	    t 'public ',
	    t 'private ',
      }),
      t { 'class ' }, i(1), t { '' },
      t { '{', ''},
	i(0),
      t { '}' },
    }),
  },
  -- When trying to expand a snippet, luasnip first searches the tables for
  -- each filetype specified in 'filetype' followed by 'all'.
  -- If ie. the filetype is 'lua.c'
  --     - luasnip.lua
  --     - luasnip.c
  --     - luasnip.all
  -- are searched in that order.
  -- all = global_snips.All,
})

-- local all = require 'ls-snips.all'
-- local all = {

--   ls.snippet('fn', {
--     -- Simple static text.
--     t '//Parameters: ',
--     -- function, first parameter is the function, second the Placeholders
--     -- whose text it gets as input.
--     f(copy, 2),
--     t { '', 'function ' },
--     -- Placeholder/Insert.
--     t(1),
--     t '(',
--     -- Placeholder with initial text.
--     i(2, 'int foo'),
--     -- Linebreak
--     t { ') {', '\t' },
--     -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
--     i(0),
--     t { '', '}' },
--   }),
-- }

-- for k, v in ipairs(all) do
--   print(k, v[1])
--   table.insert(ls.snippets, v)
-- end

-- autotriggered snippets have to be defined in a separate table, luasnip.autosnippets.
ls.autosnippets = {
  all = {
    s('autotrigger', {
      t 'autosnippet',
    }),
  },
}

-- in a lua file: search lua-, then c-, then all-snippets.
ls.filetype_extend('lua', { 'c' })
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
ls.filetype_set('cs', { 'csharp' })
ls.filetype_set('lua', { 'lua' })
ls.filetype_set('rs', { 'rust' })
-- ls.filetype_extend('csharp', { 'cs' })
-- ls.filetype_set('csharp', { 'cs' })
--[[
-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.
-- Mind that this will extend  `ls.snippets` so you need to do it after your own snippets or you
-- will need to extend the table yourself instead of setting a new one.
]]

-- require('luasnip/loaders/from_vscode').load { include = { 'python' } }
-- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
-- a similar `package.json`)
require('luasnip/loaders/from_vscode').load { paths = { './snippets' } }

-- You can also use lazy loading so you only get in memory snippets of languages you use
-- require('luasnip/loaders/from_vscode').lazy_load() -- You can pass { paths = "./my-snippets/"} as well
