write-host 'AVD Optimization: Downloading Script'
$appName = 'optimize'
$drive = 'C:\'
New-Item -Path $drive -Name $appName  -ItemType Directory -ErrorAction SilentlyContinue
$LocalPath = $drive + '\' + $appName 

$scriptName = 'Windows_VDOT.ps1'
$scriptURL = 'https://raw.githubusercontent.com/rider-amidas/Virtual-Desktop-Optimization-Tool/main/' + $scriptName
$outputPath = $LocalPath + '\' + $scriptName
Invoke-WebRequest -Uri $scriptURL -OutFile $outputPath
set-Location $LocalPath

write-host 'AVD Optimization: Start Running Script'
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force -Verbose
.\\Windows_VDOT.ps1 -Optimizations All -AdvancedOptimizations All -Verbose
write-host 'AVD Optimization: Finished' 
