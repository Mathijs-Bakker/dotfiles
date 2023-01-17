-- stylua: ignore
local ext_opts = {
  -- these ext_opts are applied when the node is active (e.g. it has been
  -- jumped into, and not out yet).
  -- this is the table actually passed to `nvim_buf_set_extmark`.
  active = {
    -- highlight the text inside the node red.
    hl_group = 'GruvboxRed',
  },
  -- these ext_opts are applied when the node is not active, but
  -- the snippet still is.

  -- passive = {
  -- add virtual text on the line of the node, behind all text.
  -- virt_text = { { 'virtual text!!', 'GruvboxBlue' } },
  -- },
  -- visited or unvisited are applied when a node was/was not jumped into.
  visited = {
    hl_group = 'GruvboxGreen',
  },
  unvisited = {
    hl_group = 'GruvboxBlue',
  },
  -- and these are applied when both the node and the snippet are inactive.
  snippet_passive = {},
}

return {
  s('derivedebug', t '#[derive(Debug)]'),
  s('deadcode', t '#[allow(dead_code)]'),
  s('allowfreedom', t '#![allow(clippy::disallowed_names, unused_variables, dead_code)]'),

  s('clippypedantic', t '#![warn(clippy::all, clippy::pedantic)]'),

  s(':turbofish', { t { '::<' }, i(0), t { '>' } }),

  s('print', {
    -- t {'println!("'}, i(1), t {' {:?}", '}, i(0), t {');'}}),
    t { 'println!("' },
    i(1),
    t { ' {' },
    i(0),
    t { ':?}");' },
  }),

  s('for', {
    t { 'for ' },
    i(1),
    t { ' in ' },
    i(2),
    t { ' {', '' },
    i(0),
    t { '', '' },
    t { '}', '' },
  }),

  s('struct', {
    t { '#[derive(Debug)]', '' },
    t { 'struct ' },
    i(1),
    t { ' {', '' },
    i(0),
    t { '}', '' },
  }),

  s('test', {
    t { '#[test]', '' },
    t { 'fn ' },
    i(1),
    t { '() {', '' },
    t { '	assert' },
    i(0),
    t { '', '' },
    t { '}' },
  }),

  s('testcfg', {
    t { '#[cfg(test)]', '' },
    t { 'mod ' },
    i(1),
    t { ' {', '' },
    t { '	#[test]', '' },
    t { '	fn ' },
    i(2),
    t { '() {', '' },
    t { '		assert' },
    i(0),
    t { '', '' },
    t { '	}', '' },
    t { '}' },
  }),

  s('else', {
    t { 'else {' },
    t { '', '' },
    t { '	' },
    i(0, 'unimplemented!();', { node_ext_opts = ext_opts }),
    t { '', '' },
    t { '}' },
  }),

  s('match', {
    t { 'match ' },
    i(1, 'expr', { node_ext_opts = ext_opts }),
    t { ' {', '' },
    t { '	' },
    i(2, 'Some(expr)', { node_ext_opts = ext_opts }),
    t { ' => ' },
    i(3, 'expr', { node_ext_opts = ext_opts }),
    t { ',', '' },
    t { '	' },
    i(4, 'None', { node_ext_opts = ext_opts }),
    t { ' => ' },
    i(5, 'expr', { node_ext_opts = ext_opts }),
    t { ',', '' },
    t { '}' },
  }),

  -- s('if',
  -- {
  --   t {'if '}, i(1), t {' {', ''},
  -- i(0),
  --   t {'}'},
  -- }),
}
