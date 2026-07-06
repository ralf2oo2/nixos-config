{
	programs.nixvim.plugins = {
		treesitter = {
			enable = true;
			nixvimInjections = true;
			folding = true;
			indent = true;
		};

		treesitter-refactor = {
			enable = true;
			highlightDefinitions = {
				enable = true;
				clearOnCursorMove = false;
			};
		};

		hmts.enable = true;

		lsp = {
			enable = true;
			servers = {
				nil_ls.enable = true;
			};
		};
	};
}
