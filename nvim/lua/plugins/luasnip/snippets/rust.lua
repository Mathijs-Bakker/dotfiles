return {
  -- Atributes:
  s('derivedebug', t '#[derive(Debug)]'),

  -- Attributes, Smart Diagnostics:
  s('deadcode', t '#[allow(dead_code)]'),
  s('allowfreedom', t '#![allow(clippy::disallowed_names, unused_variables, dead_code)]'),
  s('clippypedantic', t '#![warn(clippy::all, clippy::pedantic)]'),

  -- Clippy:
  s({ trig = 'clippy_allow', dscr = 'Clippy allow lint' }, {
    t { '#[allow(' },
    c(1, {
      t { 'clippy::all' },
      t { 'clippy::cargo' },
      t { 'clippy::complexity' },
      t { 'clippy::correctness' },
      t { 'clippy::nursery' },
      t { 'clippy::pedantic' },
      t { 'clippy::perf' },
      t { 'clippy::style' },
      t { 'clippy::suspicious' },
    }),
    t { ')]' },
  }),

  s({ trig = 'clippy_deny', dscr = 'Clippy deny lint' }, {
    t { '#[deny(' },
    c(1, {
      t { 'clippy::all' },
      t { 'clippy::cargo' },
      t { 'clippy::complexity' },
      t { 'clippy::correctness' },
      t { 'clippy::nursery' },
      t { 'clippy::pedantic' },
      t { 'clippy::perf' },
      t { 'clippy::style' },
      t { 'clippy::suspicious' },
    }),
    t { ')]' },
  }),

  s({ trig = 'clippy_warn', dscr = 'Clippy warn lint' }, {
    t { '#![warn(' },
    c(1, {
      t { 'clippy::all' },
      t { 'clippy::cargo' },
      t { 'clippy::complexity' },
      t { 'clippy::correctness' },
      t { 'clippy::nursery' },
      t { 'clippy::pedantic' },
      t { 'clippy::perf' },
      t { 'clippy::style' },
      t { 'clippy::suspicious' },
    }),
    t { ')]' },
  }),

  -- Attributes, Common Diagnostics:
  s({ trig = 'allow', dscr = 'Outer attribute: allow' }, {
    t { '#[allow(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'allow!', dscr = 'Inner attribute: allow' }, {
    t { '#![allow(' },
    i(0),
    t { ')]' },
  }),

  s({
    trig = 'allow_rustc',
    dscr = 'Attribute: allow Rust compiler lints\n\nContains most commonly used lints.',
  }, {
    t { '#![deny(' },
    c(1, {
      t { 'bad_style' },
      t { 'const_err' },
      t { 'dead_code' },
      t { 'improper_ctypes' },
      t { 'no_mangle_generic_items' },
      t { 'non_shorthand_field_patterns' },
      t { 'overflowing_literals' },
      t { 'path_statements' },
      t { 'patterns_in_fns_without_body' },
      t { 'private_in_public' },
      t { 'unconditional_recursion' },
      t { 'unused' },
      t { 'unused_allocation' },
      t { 'unused_comparisons' },
      t { 'unused_parens' },
      t { 'while_true' },
    }),
    t { ')]' },
  }),

  s({ trig = 'deny', dscr = 'Attribute: deny' }, {
    t { '#![deny(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'warn', dscr = 'Attribute: warn' }, {
    t { '#![warn(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'no_std', dscr = 'Attribute: no_std' }, {
    t { '#![no_std(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'no_core', dscr = 'Attribute: no_core' }, {
    t { '#![no_core(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'feature', dscr = 'Attribute: feature' }, {
    t { '#![feature(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'macro_use', dscr = 'Attribute: macro_use' }, {
    t { '#![macro_use(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'repr', dscr = 'Attribute: repr' }, {
    t { '#![repr(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'cfg', dscr = 'Attribute: cfg' }, {
    t { '#![cfg(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'cfg_attr', dscr = 'Attribute: cfg_attr' }, {
    t { '#![cfg_attr(' },
    i(0),
    t { ')]' },
  }),

  s({ trig = 'cfg!', dscr = 'Attribute: cfg!' }, {
    t { '#![cfg!(' },
    i(0),
    t { ')]' },
  }),

  -- Common:

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
    i(0, 'unimplemented!();'),
    t { '', '' },
    t { '}' },
  }),

  s('match', {
    t { 'match ' },
    i(1, 'expr'),
    t { ' {', '' },
    t { '	' },
    i(2, 'Some(expr)'),
    t { ' => ' },
    i(3, 'expr'),
    t { ',', '' },
    t { '	' },
    i(4, 'None'),
    t { ' => ' },
    i(0, 'expr'),
    t { ',', '' },
    t { '}' },
  }),

  -- "body": ["#![allow(${1})]"],
  -- s('if',
  -- {
  --   t {'if '}, i(1), t {' {', ''},
  -- i(0),
  --   t {'}'},
  -- }),
}
