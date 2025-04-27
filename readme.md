# pwinvim Setup Guide

This will set up Neovim along with all necessary dependencies.

---

## 1. Install Required Applications

Open **PowerShell** or **Windows Terminal** and run:

```powershell
irm https://raw.githubusercontent.com/pfpduke/pwinvim/refs/heads/master/powershell/install-apps.ps1 | iex
```

After it finishes, **change your Windows Terminal font** to a Nerd Font (such as JetBrains Mono Nerd Font).

---

## 2. Reopen Terminal and Continue Setup

Close and reopen your terminal, then run:

```powershell
irm https://raw.githubusercontent.com/pfpduke/pwinvim/refs/heads/master/powershell/Install-PostReboot.ps1 | iex
```

---

## 3. Clone Neovim Config

Now clone the Neovim config repository into your local Neovim folder:

```powershell
git clone git@github.com:pfpduke/pwinvim.git "$env:LOCALAPPDATA\nvim"
```

This will place your Neovim configuration where Neovim expects it:  
`C:\Users\<YourName>\AppData\Local\nvim`

---

## 4. Final Neovim Setup

Open Neovim and run the following commands:

```shell
:InstallPSES
:CocInstall coc-powershell
:TSInstall powershell
```

These will install additional plugins and language support for PowerShell development inside Neovim.

---

# 📦 Applications Installed by the Scripts

The two scripts (`install-apps.ps1` and `install-postreboot.ps1`) will install the following:

| Command                                                   | Purpose
|--------------------------------------------------------------------------------------------------
| `winget install --id git.git`                             | Git is required for lazy plugins 
| `winget install --id Microsoft.WindowsTerminal`           | Windows Terminal setup 
| `winget install --id DEVCOM.JetBrainsMonoNerdFont`        | NerdFont needed for icons 
| `winget install --id DEVCOM.Lua`                          | Lua language support for Neovim 
| `winget install --id Neovim.Neovim`                       | Neovim itself 
| `winget install --id sharkdp.fd`                          | `fd` is used for Telescope search functionality 
| `winget install --id BurntSushi.ripgrep.GNU`              | `ripgrep` is used for fast searching 
| `winget install --id OpenJS.NodeJS`                       | `npm` is required for some extensions 
| `winget install -e --id BrechtSanders.WinLibs.POSIX.UCRT` | C compiler needed for Treesitter support 
| `winget install python3`                                  | Python 3 is required for Python plugins 
|---------------------------------------------------------------------------------------------------
| `python.exe -m pip install --upgrade pip`                 | Upgrades pip 
| `python.exe -m pip install pynvim`                        | Required for full UltiSnips and Python plugins 
| `npm install -g neovim`                                   | Ensures Node.js-based plugins (like Coc.nvim extensions) work


