
# pstreesim.ps1
# Copyright (c) 2024, userhwon

# handy tip, if you can't run scripts by default:
#   powershell -ExecutionPolicy Bypass -File .\pstreesim.ps1

$allProcesses = Get-CimInstance -ClassName Win32_Process

# Group sorted processes by their parent process ID
$groupedProcesses = $allProcesses | Group-Object ParentProcessId

# Sort all processes by ProcessId (ascending)
$sortedGroups = $groupedProcesses | Sort-Object {$_.Name -as [int]}

foreach ($group in $sortedGroups) {
  # Sort processes within the group by ProcessId (ascending)
  $sortedGroupProcesses = $group.Group | Sort-Object {$_.ProcessId -as [int]}

  # Display parent info
  $processObject = $allProcesses | Where-Object { $_.ProcessId -eq $group.Name }
  if ($processObject) {
    Write-Host "$($group.Name) $($processObject.Name)"
  } else {
    Write-Host "$($group.Name) <Unknown>"
  }

  # Display sorted processes within the group
  foreach ($process in $sortedGroupProcesses) {
    Write-Host "  $($process.ProcessId) $($process.Name)"
  }
}
