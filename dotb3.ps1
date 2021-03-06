# dotb + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

$sdk = "2.2.104"
write-host -f magenta "c:/bin/dotb/dotb.exe $a_args | $args | sdk\2.2.104"

$env:DOTNET_CLI_CAPTURE_TIMING=1
$env:MSBUILD_EXE_PATH="c:\Program Files\dotnet\sdk\2.2.104\MSBuild.dll"
# $env:MSBUILD_EXE_PATH="c:\bin\dotb\MSBuild.dll"
$env:MSBUILDEXTENSIONSPATH="c:\Program Files\dotnet\sdk\2.2.104"
$env:MSBuildSDKsPath = $env:MSBUILDEXTENSIONSPATH + "\Sdks"
write-host $env:MSBuildSDKsPath

c:/bin/dotb/dotb.exe $a_args