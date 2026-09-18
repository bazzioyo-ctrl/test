# Run this ONCE on the Windows PC (right-click -> Run with PowerShell, or from a terminal).
# It registers a scheduled task that pulls the latest conversation every 10 minutes.
$ErrorActionPreference = "Stop"
$repoDir = Split-Path -Parent $PSScriptRoot   # the folder containing this script's parent (C:\apple_bazzi)
$bat = Join-Path $PSScriptRoot "auto-pull.bat"
$taskName = "BionicConversationSync"

$action  = New-ScheduledTaskAction -Execute "cmd.exe" -Argument "/c `"$bat`""
$trigger = New-ScheduledTaskTrigger -Once -At (Get-Date) -RepetitionInterval (New-TimeSpan -Minutes 10)
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries -ExecutionTimeLimit ([TimeSpan]::Zero)

Register-ScheduledTask -TaskName $taskName -Action $action -Trigger $trigger -Settings $settings -Force | Out-Null
Write-Host "OK: scheduled task '$taskName' registered. Conversation will auto-sync to $repoDir every 10 minutes." -ForegroundColor Green
Write-Host "To remove later:  Unregister-ScheduledTask -TaskName $taskName -Confirm:`$false"
