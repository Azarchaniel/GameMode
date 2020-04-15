#module for controlling sound
if (!(Get-Module -ListAvailable -Name AudioDeviceCmdlets)) {(Install-Module AudioDeviceCmdlets -Scope CurrentUser)}	#if there is not module, install it
$sleepTime = 1.5

try {
    Set-AudioDevice -Index 2 > $null # >$null, so it won't write output
    Set-AudioDevice -PlaybackVolume 18
    Write-Host "+ Sound output changed to headphones and volume to 20"
} catch {
    Write-Host "--- ERROR while setting up sound" -ForegroundColor red
    $sleepTime = 3
}

function terminateProcess {
    param($processes)
    try{
        foreach($process in $processes) {
            if (-not ( $(Get-Process -name $process -ErrorAction SilentlyContinue) -eq $null )) {
                Stop-Process -Name $process -Force
                Write-Host "+" $process "stopped"
            }
        }
    } catch {
        Write-Host "--- ERROR while stopping" $process -ForegroundColor red
        $sleepTime = 3
    }
}

$processesToStop = @("boinc", "boincmgr", "boinctray", "SkypeApp", "SkypeBackgroundHost", "FAHClient", "utweb", "YourPhone", "YourPhoneServer", "Slack", "HWiNFO64", "TaskMgr", "TeamViewer_Service")
terminateProcess($processesToStop)

try {
    if ( $(Get-Process -name TaskMgr -ErrorAction SilentlyContinue) -eq $null ) {
        Write-Host "+ Running Task Manager"
        C:\Windows\System32\Taskmgr.exe
    }
} catch {
    Write-Host "--- TaskManager is not running" -ForegroundColor red
    $sleepTime = 3
}

try {
    if ( $(Get-Process -name HWiNFO64 -ErrorAction SilentlyContinue) -eq $null ) {
        Write-Host "+ Running HWiNFO"
        C:\Program` Files\HWiNFO64\HWiNFO64.EXE
    }
} catch {
    Write-Host "--- HWiNFO is not running" -ForegroundColor red
    $sleepTime = 3
}

Start-Sleep -s $sleepTime
