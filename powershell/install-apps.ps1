# Installs required tools using winget.

# Function to test if a winget package is already installed
function Test-Installed {
    param($packageId)
    $installed = winget list --id $packageId 2>$null
    return $installed -match $packageId
}

# Function to install a winget package if not already installed
function Install-Package {
    param($packageId, $notes)
    Write-Host ""
    Write-Host "Checking: $packageId" -ForegroundColor Cyan
    if (Test-Installed $packageId) {
        Write-Host "$packageId is already installed." -ForegroundColor Green
    }
    else {
        Write-Host "Installing $packageId... $notes" -ForegroundColor Yellow
        try {
            winget install --id $packageId --accept-package-agreements --accept-source-agreements -e
            Write-Host "Successfully installed $packageId." -ForegroundColor Green
        }
        catch {
            $err = $_
            Write-Host ("Failed to install {0}: {1}" -f $packageId, $err) -ForegroundColor Red
        }
    }
}

# --- Winget Package Installations ---
Install-Package "Git.Git"                                        "# git required for lazy plugins"
Install-Package "Microsoft.WindowsTerminal"                      "# Windows Terminal"
Install-Package "DEVCOM.JetBrainsMonoNerdFont"                   "# NerdFont for icons"
Install-Package "DEVCOM.Lua"                                     "# Lua language support"
Install-Package "Neovim.Neovim"                                  "# Neovim editor"
Install-Package "Sharkdp.Fd"                                     "# fd command for Telescope search"
Install-Package "BurntSushi.ripgrep.GNU"                         "# ripgrep search tool"
Install-Package "OpenJS.NodeJS"                                  "# Node.js/npm for plugins"
Install-Package "BrechtSanders.WinLibs.POSIX.UCRT"               "# C compiler for Treesitter"

# --- Python Install ---
Write-Host ""
Write-Host "Checking Python Installation..." -ForegroundColor Cyan
$pythonCheck = Get-Command python -ErrorAction SilentlyContinue
if ($pythonCheck) {
    Write-Host "Python is already installed." -ForegroundColor Green
}
else {
    Write-Host "Installing Python..." -ForegroundColor Yellow
    try {
        winget install python3 --accept-package-agreements --accept-source-agreements
        Write-Host "Successfully installed Python." -ForegroundColor Green
    }
    catch {
        $err = $_
        Write-Host ("Failed to install Python: {0}" -f $err) -ForegroundColor Red
    }
}

# --- Final Notice to Reboot Terminal ---
Write-Host ""
Write-Host "IMPORTANT: Please close and reopen your terminal before running the next script!" -ForegroundColor Red
Write-Host "Also change you windows terminal font to JetBrainsMonoNL Nerd Font in settings/profile/windows powershell/appearace" -ForegroundColor Yellow
exit
