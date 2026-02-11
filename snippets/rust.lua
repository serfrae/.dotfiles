local ls = require("luasnip")
local fmta = require("luasnip.extras.fmt").fmta
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local r = require("luasnip.extras").rep
local s = ls.snippet
local c = ls.choice_node

ls.add_snippets("rust", {
	s(
		{ name = "async main", trig = "asm" },
		fmt(
			[[
          #[tokio::main]
          async fn main() -> Result<()> {{
              Ok(())
          }}
          ]],
			{}
		)
	),

	-- Solana
	s(
		{ name = "Account Meta", trig = "am" },
		fmta([[AccountMeta::<WRITE_TYPE>(<ACCOUNT>.key(), <SIGNER>)]], {
			WRITE_TYPE = c(1, {
				i(nil, "new"),
				i(nil, "new_readonly"),
			}),
			ACCOUNT = i(2, "account"),
			SIGNER = c(3, {
				i(nil, "true"),
				i(nil, "false"),
			}),
		})
	),

	-- Anchor
	s(
		{ name = "#[derive(Account)]", trig = "dac" },
		fmta(
			[[
        #[derive(Account)]
        pub struct <NODE_1><<'info>> {
        }

        impl <NODE_2><<'_>> {
        }
      ]],
			{
				NODE_1 = i(1, "NAME"),
				NODE_2 = r(1),
			}
		)
	),
	s(
		{ trig = "iat", name = "Interface Token Account" },
		fmt([[pub {}: Box<InterfaceAccount<'info, TokenAccount>>,]], { i(1, "name") })
	),
	s(
		{ trig = "iam", name = "Interface Mint Account" },
		fmt([[pub {}: Box<InterfaceAccount<'info, Mint>>,]], { i(1, "name") })
	),
})
