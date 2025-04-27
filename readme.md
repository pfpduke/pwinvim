Open windows terminal/powershell and run

winget install --id git.git                                       #git is required for lazy plugins
winget install --id Microsoft.WindowsTerminal                     #this config was built for windows terminal
winget install --id DEVCOM.JetBrainsMonoNerdFont                  #changing windows terminal font to a nerdFont is required for icons
winget install --id DEVCOM.Lua                                    #this config was built with lua
winget install --id Neovim.Neovim                                 #neovim is required in order to use neovim lol
winget install --id sharkdp.fd                                    #fd will be required for telescope find dir
winget install --id BurntSushi.ripgrep.GNU                        #ripgrep may be required later
winget install --id OpenJS.NodeJS                                 #npm is required for some extentions
winget install -e --id BrechtSanders.WinLibs.POSIX.UCRT           #c compiler needed for treesitter
winget install python3                                            #latest version of python3 needed for pynvim
python.exe -m pip install --upgrade pip
python -m pip install pynvim                                      #needed for full UltiSnips
npm install -g neovim                                             #makes sure Node.js-based plugins (like Coc.nvim extensions) can properly communicate with Neovim



After cloning launch nvim and run


:InstallPSES
:CocInstall coc-powershell
:TSInstall powershell