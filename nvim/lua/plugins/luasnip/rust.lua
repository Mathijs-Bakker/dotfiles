local M = {}

local M.Rust = {
  s('struct', {
    t { '#[derive(Debug)]', '' },
    t { 'struct ' },
    i(1),
    t { ' {', '' },
    i(0),
    t { '}', '' },
  }),
  s('test', t '#[test]'),
  s('testcfg', t '#[cfg(test)]'),
}

return M.Rust
