# GameMode
Single-purpose PowerShell script for preparing PC for gaming

## What it does?
It's using library [frgnca/AudioDeviceCmdlets](https://github.com/frgnca/AudioDeviceCmdlets) for setting up sound output and volume.
Then it's stopping annoying and performance consuming processes.
And then it starts TaskMng and HWiNFO for checking temperatures and performance.

## Usage
Script needs Powershell v. 5 and admin rights (some processes are protected against turning off).
