return {
	cmd = {
		"basedpyright-langserver",
		"--stdio",
	},
	filetypes = {
		"python",
	},
	root_markers = {
		".git",
		"Pipfile",
		"pyproject.toml",
		"pyrightconfig.json",
		"requirements.txt",
		"setup.cfg",
		"setup.py",
	},
	settings = {
		pyright = {
			strict = true,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
		basedpyright = {
			disableOrganizeImports = true,
			typeCheckingMode = "standard",
			analysis = { "*" },
		},
	},

	single_file_support = true,
}
