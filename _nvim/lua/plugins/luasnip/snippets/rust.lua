-- Rust snippets for LuaSnip...

-- I created these snips for smart (read: lazy) coding in Neovim (duh!).

-- Some are inspired by:
-- https://github.com/rafamadriz/friendly-snippets/blob/main/snippets/rust.json
-- Not all made it to this list. Because rust-analyzer gets smarter every month
-- and there's no need for any duplicates (only when they are supersmart).

-- You are free to yank these snippets into your own Neovim config.
-- And if you have created some awesome snippets yourself (or upgraded some of mine),
-- send a pr, or keep me posted.

-- Cheers!
-- Mathijs

return {
  -- ::<TurboFish>
  s({ trig = ':turbofish', dscr = 'Turbofish\n `::<_>`' }, { t { '::<' }, i(0), t { '>' } }),

  -- Atributes:
  s('derivedebug', t '#[derive(Debug)]'),

  -- Attributes, 'Smart' Diagnostics:
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

  -- Flow of Control:

  s({ trig = 'for', dscr = '`for _ in _` loop', priority = 5000 }, {
    t { 'for ' },
    i(1, 'pat'),
    t { ' in ' },
    i(2, 'expr'),
    t { ' {', '\t' },
    -- t { '	' },
    i(0),
    t { '', '}' },
  }),

  s('if', {
    t { 'if ' },
    i(1, 'expr'),
    t { ' {', '\t' },
    i(0),
    t { '', '}' },
  }),

  s('else', {
    t { 'else {', '\t' },
    i(0),
    t { '', '}' },
  }),

  s({ trig = 'match', dscr = '`match` with two matching arms.' }, {
    t { 'match ' },
    i(1, 'expr'),
    t { ' {', '\t' },
    i(2, 'Some(expr)'),
    t { ' => ' },
    i(3, 'expr'),
    t { ',', '\t' },
    i(4, 'None'),
    t { ' => ' },
    i(4, 'expr'),
    t { ',', '' },
    t { '}' },
  }),

  s({ trig = 'while-let', dscr = 'while-let' }, {
    t { 'while let ' },
    i(1, 'Some(pat)'),
    t { ' = ' },
    i(2, 'expr'),
    t { '', '' },
    t { '{', '\t' },
    i(3, 'unimplemented!();'),
    t { '', '' },
    t { '}' },
  }),
  -- Custom Types:

  s({ trig = 'struct', dscr = 'Classic `struct` that implements `std::fmt::Debug`' }, {
    t { '#[derive(Debug)]', '' },
    t { 'struct ' },
    i(1, 'Name'),
    t { ' {', '\t' },
    i(0),
    t { '', '' },
    t { '}', '' },
  }),

  s({ trig = 'fnreturn', dscr = 'Return function' }, {
    t { 'fn ' },
    i(1, 'name'),
    t { '(' },
    i(2, 'arg'),
    t { ') -> ' },
    i(3, 'ret_type'),
    t { ' {', '\t' },
    i(4, 'unimplemented!();'),
    t { '', '}' },
  }),

  -- Formatted print:

  s({ trig = 'format_outer_args', dscr = '`format!("Some text {:?}", arg)`\nFormat `String` with outside args' }, {
    t { 'format!("' },
    i(1),
    t { ' {' },
    t { ':?}", ' },
    i(0, 'args'),
    t { ');' },
  }),

  s({ trig = 'format_inner_args', dscr = '`format!("Some text {arg:?}")`,\nFormat `String` with inside args' }, {
    t { 'format!("' },
    i(1),
    t { ' {' },
    i(0),
    t { ':?}");' },
  }),

  s({ trig = 'print_outer_args', dscr = '`print!("Some text {:?}", arg)`\nFormatted `print!` with outside args' }, {
    t { 'print!("' },
    i(1),
    t { ' {' },
    t { ':?}", ' },
    i(0),
    t { ');' },
  }),

  s({ trig = 'print_inner_args', dscr = '`print!("Some text {arg:?}")`,\nFormatted `print!` with inside args' }, {
    t { 'println!("' },
    i(1),
    t { ' {' },
    i(0),
    t { ':?}");' },
  }),

  s({
    trig = 'println_outer_args',
    dscr = '`println!("Some text {:?}", arg)`\nFormatted `println!` with outside args',
  }, {
    t { 'println!("' },
    i(1),
    t { ' {' },
    t { ':?}", ' },
    i(0),
    t { ');' },
  }),

  s({
    trig = 'eprintln_outer_args',
    dscr = '`eprintln!("Some text {:?}", arg)`\nFormatted `eprintln!` with outside args',
  }, {
    t { 'eprintln!("' },
    i(1),
    t { ' {' },
    t { ':?}", ' },
    i(0),
    t { ');' },
  }),

  s({ trig = 'eprint_inner_args', dscr = '`eprint!("Some text {arg:?}")`,\nFormatted `eprint!` with inside args' }, {
    t { 'eprintln!("' },
    i(1),
    t { ' {' },
    i(0),
    t { ':?}");' },
  }),

  s({ trig = 'eprintln_inner_args', dscr = '`eprintln("Some text {arg:?}")`,\nFormatted `eprintln!` with inside args' }, {
    t { 'eprintln!("' },
    i(1),
    t { ' {' },
    i(0),
    t { ':?}");' },
  }),

  s({
    trig = 'eprintln_outer_args',
    dscr = '`eprintln!("Some text {:?}", arg)`\nFormatted `eprintln!` with outside args',
  }, {
    t { 'eprintln!("' },
    i(1),
    t { ' {' },
    t { ':?}", ' },
    i(0),
    t { ');' },
  }),

  s({ trig = 'println_inner_args', dscr = '`println("Some text {arg:?}")`,\nFormatted `println!` with inside args' }, {
    t { 'println!("' },
    i(1),
    t { ' {' },
    i(0),
    t { ':?}");' },
  }),

  -- Testing:

  s('test', {
    t { '#[test]', '' },
    t { 'fn ' },
    i(1, 'test'),
    t { '() {', '\t' },
    t { 'assert!(' },
    i(0, 'bool'),
    t { ');', '' },
    t { '}' },
  }),

  s('testmod', {
    t { '#[cfg(test)]', '' },
    t { 'mod ' },
    i(1, 'mod_test'),
    t { ' {', '\t' },
    t { 'use super::*;', '\t' },
    t { '', '\t' },
    t { '#[test]', '\t' },
    t { 'fn ' },
    i(2, 'test'),
    t { '() {', '\t\t' },
    t { 'assert!(' },
    i(0, 'bool'),
    t { ');', '\t' },
    t { '}', '' },
    t { '}' },
  }),
}
