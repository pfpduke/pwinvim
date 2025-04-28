
#Show all running powershell processes, im looking for Powershell lsp servers
Get-CimInstance Win32_Process | Where-Object { $_.Name -like "powershell.exe" } | Select-Object ProcessId, ParentProcessId, CommandLine | Format-Table -AutoSize
#Stop process
Stop-Process -Id 16116 -Force
#find out what the full cmd line is for a PID
(Get-CimInstance Win32_Process -Filter "ProcessId = 15984").CommandLine


