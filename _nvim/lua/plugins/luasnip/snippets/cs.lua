return {
  s('ctor', {
    t { 'public ' },
    i(1),
    t { '(' },
    i(2),
    t { ' ' },
    i(3),
    t { ')', '' },
    t { '{', '' },
    i(0),
    t { '', '}' },
  }),

  s('cw', {
    t { 'System.Console.WriteLine(' },
    i(0),
    t { ');' },
  }),

  s('class', {
    c(1, {
      t 'public ',
      t 'private ',
    }),
    t { 'class ' },
    i(1),
    t { '' },
    t { '{', '' },
    i(0),
    t { '}' },
  }),
}
