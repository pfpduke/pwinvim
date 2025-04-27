--Run :InstallPSES to install the latest PowerShellEditorServices

return {
    dir = vim.fn.stdpath("config") .. "/lua/plugins/pses", -- Load plugin locally
    name = "pses-installer",
    lazy = true, -- Optional: Only load when the command is called
    cmd = { "InstallPSES" }, -- Lazy load only when you run :InstallPSES
    config = function()
      vim.api.nvim_create_user_command('InstallPSES', function()
        local zip_path = "C:/Users/User/Downloads/PSES.zip"
        local extract_path = "C:/dev/PSES-Release"
  
        print("Fetching latest PowerShellEditorServices release info...")
        local release_info = vim.fn.system({
          "curl", "-s", "https://api.github.com/repos/PowerShell/PowerShellEditorServices/releases/latest"
        })
  
        local download_url = release_info:match('"browser_download_url":%s-"(https://.-PowerShellEditorServices%.zip)"')
        local version = release_info:match('"tag_name":%s-"(.-)"')
  
        if not download_url then
          print("Failed to find PowerShellEditorServices.zip in latest release!")
          return
        end
  
        if version then
          print("Latest PowerShellEditorServices version: " .. version)
        else
          print("Version number not found.")
        end
  
        print("Downloading PowerShellEditorServices...")
        vim.fn.system({ "curl", "-L", "-o", zip_path, download_url })
  
        print("Unblocking the downloaded zip...")
        vim.fn.system({ "powershell.exe", "-Command", "Unblock-File -Path '" .. zip_path .. "'" })
  
        print("Cleaning old extracted folder (if exists)...")
        vim.fn.system({ "powershell.exe", "-Command", "if (Test-Path '" .. extract_path .. "') { Remove-Item -Path '" .. extract_path .. "' -Recurse -Force }" })
  
        print("Extracting zip...")
        vim.fn.system({ "powershell.exe", "-Command", "Expand-Archive -Path '" .. zip_path .. "' -DestinationPath '" .. extract_path .. "' -Force" })
  
        print("Done! PowerShellEditorServices installed at " .. extract_path)
      end, {})
    end,
  }
  