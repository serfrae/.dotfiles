local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("go", {
	s(
		{ "go error", trig = "ge" },
		fmt(
			[[
        {}, err := {}
        if err != nil {{
            {}
        }}
      ]],
			{ i(1, "val"), i(2, "func()"), i(3, "return err") }
		)
	),
})
