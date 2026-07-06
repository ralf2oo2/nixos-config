{ config, lib, ... }: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
    };

    keymaps = let
      normal = 
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<leader>n" = ":Neotree<CR>";
          "<esc>" = ":noh<CR>";
          "<C-x>" = ":close<CR>";
        };
      visual = 
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {

        };
      in
        config.nixvim.helpers.keymaps.mkKeymaps
        {options.silent = true;}
        (normal ++ visual);
  };
}
