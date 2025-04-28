# 📦 Applications recommended for a healthy nvim

You can always run :checkhealth inside nvim

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

## 2. Clone repo

Now clone the Neovim config repository into your local Neovim folder:

```powershell
git clone https://github.com/pfpduke/pwinvim.git "$env:LOCALAPPDATA\nvim"
```
This will place your Neovim configuration where Neovim expects it:  
`C:\Users\<YourName>\AppData\Local\nvim`

---


## 4. Final Neovim Setup

Open Neovim and run the following commands:

```shell
:lazy sync
:CocInstall coc-powershell coc-snippets coc-json
:TSInstall powershell
```

                          

