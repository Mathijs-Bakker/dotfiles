local ls = require 'luasnip'
-- some shorthands...
local snippet = ls.snippet
local snippet_node = ls.snippet_node
local text_node = ls.text_node
local insert_node = ls.insert_node
local function_node = ls.function_node
local choice_node = ls.choice_node
local dynamic_node = ls.dynamic_node
local lambda = require('luasnip.extras').lambda
local r = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
local m = require('luasnip.extras').match
local n = require('luasnip.extras').nonempty
local dl = require('luasnip.extras').dynamic_lambda
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local types = require 'luasnip.util.types'
local conds = require 'luasnip.extras.expand_conditions'

-- -- local M = {}

-- -- M.All = {
return {
  --   -- trigger is fn.
  snippet('fn', {
    -- Simple static text.
    text_node '//Parameters: ',
    -- function, first parameter is the function, second the Placeholders
    -- whose text it gets as input.
    function_node(copy, 2),
    text_node { '', 'function ' },
    -- Placeholder/Insert.
    insert_node(1),
    text_node '(',
    -- Placeholder with initial text.
    insert_node(2, 'int foo'),
    -- Linebreak
    text_node { ') {', '\t' },
    -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
    insert_node(0),
    text_node { '', '}' },
  }),
  -- snippet('class', {
  --     -- choice: switch between two different nodes, first parameter is its position, second a list of nodes.
  --     choice_node(1, {
  --         text_node 'public ',
  --         text_node 'private ',
  --     }),
  --     text_node 'class ',
  --     insert_node(2),
  --     text_node ' ',
  --     choice_node(3, {
  --         text_node '{',
  --         -- snippet_node: nested snippet. instead of a trigger, it has a position, just like insert-nodes. !!! these don't expect a 0-node!!!!
  --         -- inside choices, nodes don't need a position as the choice node is the one being jumped to.
  --         snippet_node(nil, {
  --             text_node 'extends ',
  --             insert_node(1),
  --             text_node ' {',
  --         }),
  --         snippet_node(nil, {
  --             text_node 'implements ',
  --             insert_node(1),
  --             text_node ' {',
  --         }),
  --     }),
  --     text_node { '', '\t' },
  --     insert_node(0),
  --     text_node { '', '}' },
  -- }),
  --   }),
  -- Use a dynamic_node to interpolate the output of a
  --   -- function (see date_input above) into the initial
  --   -- value of an insert_node.
  --   snippet('novel', {
  --     text_node 'It was a dark and stormy night on ',
  --     dynamic_node(1, date_input, {}, '%A, %B %d of %Y'),
  --     text_node ' and the clocks were striking thirteen.',
  --   }),
  --   -- Parsing snippets: First parameter: Snippet-Trigger, Second: Snippet body.
  --   -- Placeholders are parsed into choices with 1. the placeholder text(as a snippet) and 2. an empty string.
  --   -- This means they are not SELECTed like in other editors/Snippet engines.
  --   ls.parser.parse_snippet('lspsyn', 'Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}'),

  --   -- When wordTrig is set to false, snippets may also expand inside other words.
  --   ls.parser.parse_snippet({ trig = 'te', wordTrig = false }, '${1:cond} ? ${2:true} : ${3:false}'),

  --   -- When regTrig is set, trig is treated like a pattern, this snippet will expand after any number.
  --   ls.parser.parse_snippet({ trig = '%d', regTrig = true }, 'A Number!!'),
  --   -- Using the condition, it's possible to allow expansion only in specific cases.
  --   snippet('cond', {
  --     text_node 'will only expand in c-style comments',
  --   }, {
  --     condition = function(line_to_cursor, matched_trigger, captures)
  --       -- optional whitespace followed by //
  --       return line_to_cursor:match '%s*//'
  --     end,
  --   }),
  --   -- there's some built-in conditions in "luasnip.extras.expand_conditions".
  --   snippet('cond2', {
  --     text_node 'will only expand at the beginning of the line',
  --   }, {
  --     condition = conds.line_begin,
  --   }),
  --   -- The last entry of args passed to the user-function is the surrounding snippet.
  --   snippet(
  --     { trig = 'a%d', regTrig = true },
  --     function_node(function(_, snip)
  --       return 'Triggered with ' .. snip.trigger .. '.'
  --     end, {})
  --   ),
  --   -- It's possible to use capture-groups inside regex-triggers.
  --   snippet(
  --     { trig = 'b(%d)', regTrig = true },
  --     function_node(function(_, snip)
  --       return 'Captured Text: ' .. snip.captures[1] .. '.'
  --     end, {})
  --   ),
  --   snippet({ trig = 'c(%d+)', regTrig = true }, {
  --     text_node 'will only expand for even numbers',
  --   }, {
  --     condition = function(line_to_cursor, matched_trigger, captures)
  --       return tonumber(captures[1]) % 2 == 0
  --     end,
  --   }),
  --   -- Use a function to execute any shell command and print its text.
  --   snippet('bash', function_node(bash, {}, 'ls')),
  --   -- Short version for applying String transformations using function nodes.
  --   snippet('transform', {
  --     insert_node(1, 'initial text'),
  --     text_node { '', '' },
  --     -- lambda nodes accept an lambda._1,2,3,4,5, which in turn accept any string transformations.
  --     -- This list will be applied in order to the first node given in the second argument.
  --     lambda(lambda._1:match('[^insert_node]*$'):gsub('insert_node', 'o'):gsub(' ', '_'):upper(), 1),
  --   }),
  --   snippet('transform2', {
  --     insert_node(1, 'initial text'),
  --     text_node '::',
  --     insert_node(2, 'replacement for e'),
  --     text_node { '', '' },
  --     -- Lambdas can also apply transforms USING the text of other nodes:
  --     lambda(lambda._1:gsub('e', lambda._2), { 1, 2 }),
  --   }),
  --   snippet({ trig = 'trafo(%d+)', regTrig = true }, {
  --     -- env-variables and captures can also be used:
  --     lambda(lambda.CAPTURE1:gsub('1', lambda.TM_FILENAME), {}),
  --   }),
  --   -- Set store_selection_keys = "<Tab>" (for example) in your
  --   -- luasnip.config.setup() call to access TM_SELECTED_TEXT. In
  --   -- this case, select a URL, hit Tab, then expand this snippet.
  --   snippet('link_url', {
  --     text_node '<a href="',
  --     function_node(function(_, snip)
  --       return snip.env.TM_SELECTED_TEXT[1] or {}
  --     end, {}),
  --     text_node '">',
  --     insert_node(1),
  --     text_node '</a>',
  --     insert_node(0),
  --   }),
  --   -- Shorthand for repeating the text in a given node.
  --   snippet('repeat', { insert_node(1, 'text'), text_node { '', '' }, r(1) }),
  --   -- Directly insert the ouput from a function evaluated at runtime.
  --   snippet('part', p(os.date, '%Y')),
  --   -- use matchNodes to insert text based on a pattern/function/lambda-evaluation.
  --   snippet('mat', {
  --     insert_node(1, { 'sample_text' }),
  --     text_node ': ',
  --     m(1, '%d', 'contains a number', 'no number :('),
  --   }),
  --   -- The inserted text defaults to the first capture group/the entire
  --   -- match if there are none
  --   snippet('mat2', {
  --     insert_node(1, { 'sample_text' }),
  --     text_node ': ',
  --     m(1, '[abc][abc][abc]'),
  --   }),
  --   -- It is even possible to apply gsubs' or other transformations
  --   -- before matching.
  --   snippet('mat3', {
  --     insert_node(1, { 'sample_text' }),
  --     text_node ': ',
  --     m(1, lambda._1:gsub('[123]', ''):match '%d', "contains a number that isn't 1, 2 or 3!"),
  --   }),
  --   -- `match` also accepts a function, which in turn accepts a string
  --   -- (text in node, \n-concatted) and returns any non-nil value to match.
  --   -- If that value is a string, it is used for the default-inserted text.
  --   snippet('mat4', {
  --     insert_node(1, { 'sample_text' }),
  --     text_node ': ',
  --     m(1, function(text)
  --       return (#text % 2 == 0 and text) or nil
  --     end),
  --   }),
  --   -- The nonempty-node inserts text depending on whether the arg-node is
  --   -- empty.
  --   snippet('nempty', {
  --     insert_node(1, 'sample_text'),
  --     n(1, 'insert_node(1) is not empty!'),
  --   }),
  --   -- dynamic lambdas work exactly like regular lambdas, except that they
  --   -- don't return a textNode, but a dynamicNode containing one insertNode.
  --   -- This makes it easier to dynamically set preset-text for insertNodes.
  --   snippet('dl1', {
  --     insert_node(1, 'sample_text'),
  --     text_node { ':', '' },
  --     dl(2, lambda._1, 1),
  --   }),
  --   -- Obviously, it's also possible to apply transformations, just like lambdas.
  --   snippet('dl2', {
  --     insert_node(1, 'sample_text'),
  --     insert_node(2, 'sample_text_2'),
  --     text_node { '', '' },
  --     dl(3, lambda._1:gsub('\n', ' linebreak ') .. lambda._2, { 1, 2 }),
  --   }),
  --   -- Alternative printf-like notation for defining snippets. It uses format
  --   -- string with placeholders similar to the ones used with Python's .format().
  --   snippet(
  --     'fmt1',
  --     fmt('To {title} {} {}.', {
  --       insert_node(2, 'Name'),
  --       insert_node(3, 'Surname'),
  --       title = choice_node(1, { text_node 'Mr.', text_node 'Ms.' }),
  --     })
  --   ),
  --   -- To escape delimiters use double them, e.g. `{}` -> `{{}}`.
  --   -- Multi-line format strings by default have empty first/last line removed.
  --   -- Indent common to all lines is also removed. Use the third `opts` argument
  --   -- to control this behaviour.
  --   snippet(
  --     'fmt2',
  --     fmt(
  --       [[
  -- 			foo({1}, {3}) {{
  -- 				return {2} * {4}
  -- 			}}
  -- 			]],
  --       {
  --         insert_node(1, 'x'),
  --         r(1),
  --         insert_node(2, 'y'),
  --         r(2),
  --       }
  --     )
  --   ),
  --   -- Empty placeholders are numbered automatically starting from 1 or the last
  --   -- value of a numbered placeholder. Named placeholders do not affect numbering.
  --   snippet(
  --     'fmt3',
  --     fmt('{} {a} {} {1} {}', {
  --       text_node '1',
  --       text_node '2',
  --       a = text_node 'A',
  --     })
  --   ),
  --   -- The delimiters can be changed from the default `{}` to something else.
  --   snippet('fmt4', fmt('foo() { return []; }', insert_node(1, 'x'), { delimiters = '[]' })),
  --   -- `fmta` is a convenient wrapper that uses `<>` instead of `{}`.
  --   snippet('fmt5', fmta('foo() { return <>; }', insert_node(1, 'x'))),
  --   -- By default all args must be used. Use strict=false to disable the check
  --   snippet('fmt6', fmt('use {} only', { text_node 'this', text_node 'not this' }, { strict = false })),
}

-- -- return M
