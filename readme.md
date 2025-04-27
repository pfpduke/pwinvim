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

`winget install --id git.git`                              
`winget install --id Microsoft.WindowsTerminal`            
`winget install --id DEVCOM.JetBrainsMonoNerdFont`         
`winget install --id DEVCOM.Lua`                          
`winget install --id Neovim.Neovim`                       
`winget install --id sharkdp.fd`                          
`winget install --id BurntSushi.ripgrep.GNU`              
`winget install --id OpenJS.NodeJS`                       
`winget install -e --id BrechtSanders.WinLibs.POSIX.UCRT` 
`winget install python3`                                  

`python.exe -m pip install --upgrade pip`                  
`python.exe -m pip install pynvim`                        
`npm install -g neovim`                                   


