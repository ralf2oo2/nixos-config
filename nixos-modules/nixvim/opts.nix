{
	programs.nixvim = {
		opts = {
			updatetime = 100;

			relativenumber = true;
			number = true;

			hidden = true;

			mouse = "a";
			mousemodel = "extend";

			undofile = true;

			incsearch = true;

			inccommand = "split";
			ignorecase = true;
			smartcase = true;

			cursorline = false;
			cursorcolumn = false;
			signcolumn = "yes";
			colorcolumn = "100";

			fileencoding = "utf-8";

			termguicolors = false;
			spell = false;

			tabstop = 2;
			shiftwidth = 2;
			expandtab = true;
			autoindent = true;

			textwidth = 0;

			foldlevel = 99;
		};
	};
}
