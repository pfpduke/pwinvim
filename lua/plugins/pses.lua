return {
    dir = vim.fn.stdpath("config") .. "/lua/pses",
    lazy = true,
    dev = true,
    cmd = { "PSESInstall", "PSESStart", "PSESStop", "PSESStatus" },
    config = function()
      local pses = require("pses")
  
      vim.api.nvim_create_user_command("PSESInstall", pses.install, {})
      vim.api.nvim_create_user_command("PSESStart", pses.start, {})
      vim.api.nvim_create_user_command("PSESStop", pses.stop, {})
      vim.api.nvim_create_user_command("PSESStatus", pses.status, {})
    end,
  }
  


