# Installs Python pip packages and Node.js packages after a terminal reboot.

# Verify Python and NPM are available
Write-Host ""
Write-Host "Checking for Python and NPM availability..." -ForegroundColor Cyan

$pythonCheck = Get-Command python -ErrorAction SilentlyContinue
$npmCheck = Get-Command npm -ErrorAction SilentlyContinue

if (-not $pythonCheck) {
    Write-Host "ERROR: Python not found. Please make sure Python was installed correctly." -ForegroundColor Red
    exit
}

if (-not $npmCheck) {
    Write-Host "ERROR: NPM (Node.js) not found. Please make sure Node.js was installed correctly." -ForegroundColor Red
    exit
}

# --- Upgrade pip ---
Write-Host ""
Write-Host "Upgrading pip..." -ForegroundColor Cyan
try {
    python.exe -m pip install --upgrade pip
    Write-Host "Pip upgraded successfully." -ForegroundColor Green
}
catch {
    $err = $_
    Write-Host ("Failed to upgrade pip: {0}" -f $err) -ForegroundColor Red
}

# --- Install pynvim ---
Write-Host ""
Write-Host "Installing pynvim Python module..." -ForegroundColor Cyan
try {
    python.exe -m pip install pynvim
    Write-Host "pynvim installed successfully." -ForegroundColor Green
}
catch {
    $err = $_
    Write-Host ("Failed to install pynvim: {0}" -f $err) -ForegroundColor Red
}

# --- Install neovim npm package ---
Write-Host ""
Write-Host "Installing Neovim npm package globally..." -ForegroundColor Cyan
try {
    npm install -g neovim
    Write-Host "Neovim npm package installed successfully." -ForegroundColor Green
}
catch {
    $err = $_
    Write-Host ("Failed to install Neovim npm package: {0}" -f $err) -ForegroundColor Red
}

# --- Completion Message ---
Write-Host ""
Write-Host "Environment setup complete!" -ForegroundColor Magenta
