return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
  
      local has_cmp, cmp = pcall(require, "cmp_nvim_lsp")
      local capabilities = has_cmp and cmp.default_capabilities()
        or vim.lsp.protocol.make_client_capabilities()
  
      local user = os.getenv("USERPROFILE"):gsub("\\", "/")
      local start_script = user .. "/PowerShell/Modules/PowerShellEditorServices/Start-EditorServices.ps1"
      local bundled_path = user .. "/PowerShell/Modules"
  
      local powershell_cmd = {
        "powershell.exe",
        "-NoLogo",
        "-NoProfile",
        "-ExecutionPolicy", "Bypass",
        "-Command",
        "& '" .. start_script .. "'" ..
        " -BundledModulesPath '" .. bundled_path .. "'" ..
        " -LogPath '$env:TEMP/powershell_es.log'" ..
        " -SessionDetailsPath '$env:TEMP/powershell_es.session.json'" ..
        " -FeatureFlags @()" ..
        " -AdditionalModules @()" ..
        " -HostName nvim" ..
        " -HostProfileId 0" ..
        " -HostVersion 1.0.0" ..
        " -Stdio" ..
        " -LogLevel Normal"
      }
  
      lspconfig.powershell_es.setup({
        cmd = powershell_cmd,
        capabilities = capabilities,
        filetypes = { "ps1", "psm1", "psd1" },
        root_dir = util.find_git_ancestor or util.path.dirname,
      })
    end,
  }
  
