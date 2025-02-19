local ls = require "luasnip"
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local s = ls.snippet

ls.add_snippets("typescript", {
    s(
        { name = "Describe Test", trig = "td" },
        fmt(
            [[
            describe("{}", () => {{
                it("{}", async () => {{
                }});
            }})
            ]],
            {
                i(1, "Test Name"),
                i(2, "Test Description")
            }
        )
    ),
    s(
        { name = "Test 'it'", trig = "ti" },
        fmt(
            [[
            it("{}", async () => {{
            }});
            ]],
            {
                i(i, "Test Description")
            }
        )
    )
})
