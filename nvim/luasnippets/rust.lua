local ls = require "luasnip"
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local r = require("luasnip.extras").rep
local s = ls.snippet
local c = ls.choice_node


ls.add_snippets("rust", {
    s(
        { name = "Print Test", trig = "luapt" },
        fmta(
            [[
    println!("<NODE_1> = {:?}", <NODE_2>);
    ]],
            {
                NODE_1 = i(1, "NAME"),
                NODE_2 = r(1),
            }
        )
    )
})

ls.add_snippets("rust", {
    s(
        { name = "Account Meta", trig = "am" },
        fmta(
            [[AccountMeta::<WRITE_TYPE>(<ACCOUNT>.key(), <SIGNER>)]],
            {
                WRITE_TYPE = c(1, {
                    i(nil, "new"),
                    i(nil, "new_readonly"),
                }),
                ACCOUNT = i(2, "account"),
                SIGNER = c(3, {
                    i(nil, "true"),
                    i(nil, "false"),
                }),
            }
        )
    )
})
