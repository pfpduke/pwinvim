local M = {}

local pses_dir = vim.fn.stdpath("data") .. "/pses"
local session_file = pses_dir .. "/session.json"
local job_id = nil

function M.install()
  if vim.fn.isdirectory(pses_dir) == 0 then
    vim.fn.system({
      "git", "clone",
      "--depth", "1",
      "https://github.com/PowerShell/PowerShellEditorServices",
      pses_dir
    })
    print("[PSES] Installed PowerShellEditorServices!")
  else
    print("[PSES] PowerShellEditorServices already installed.")
  end
end

function M.start()
  if job_id then
    print("[PSES] Already running (job ID: " .. job_id .. ")")
    return
  end

  local start_script = pses_dir .. "/module/PowerShellEditorServices/Start-EditorServices.ps1"
  if vim.fn.filereadable(start_script) == 0 then
    print("[PSES] Start-EditorServices.ps1 not found! Run :PSESInstall first.")
    return
  end

  local command = string.format(
    "& '%s' -BundledModulesPath '%s/module' -SessionDetailsPath '%s' -HostName 'nvim' -HostProfileId '0' -HostVersion '1.0.0' -Stdio",
    start_script, pses_dir, session_file
  )

  print("[PSES] Starting PSES with command:")
  print(command)

  job_id = vim.fn.jobstart({
    "powershell.exe",
    "-NoLogo",
    "-NoProfile",
    "-ExecutionPolicy", "Bypass",
    "-Command", command
  }, {
    rpc = true,
    on_exit = function(_, code, _)
      print("[PSES] Server exited with code:", code)
      job_id = nil
    end,
    on_stderr = function(_, data, _)
      if data then
        print("[PSES] stderr: " .. table.concat(data, "\n"))
      end
    end,
  })

  if job_id > 0 then
    print("[PSES] Server started (job ID: " .. job_id .. ")")
  else
    print("[PSES] Failed to start server!")
  end
end

function M.stop()
  if job_id then
    vim.fn.jobstop(job_id)
    print("[PSES] Stopped server (job ID: " .. job_id .. ")")
    job_id = nil
  else
    print("[PSES] Server is not running.")
  end
end

function M.status()
  if job_id then
    print("[PSES] Status: RUNNING (job ID: " .. job_id .. ")")
  else
    print("[PSES] Status: STOPPED")
  end

  print("[PSES] Powershell path: powershell.exe")
  print("[PSES] Session file: " .. session_file)
end

return M
