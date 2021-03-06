# dotb + args

$ErrorActionPreference = 'Stop'
$a_args = $PsBoundParameters.Values + $args

write-host -f magenta "c:/bin/dotb/dotb.exe $a_args | $args | sdk\3.0.100-preview4-010386"

$env:DOTNET_CLI_CAPTURE_TIMING=1
$env:MSBUILD_EXE_PATH="c:\bin\dotb\sdk\3.0.100-preview4-010386\MSBuild.dll"
# $env:MSBUILD_EXE_PATH="c:\bin\dotb\MSBuild.dll"
$env:MSBUILDEXTENSIONSPATH="c:\bin\dotb\sdk\3.0.100-preview4-010386"
$env:MSBuildSDKsPath = $env:MSBUILDEXTENSIONSPATH + "\Sdks"
write-host $env:MSBuildSDKsPath

c:/bin/dotb/dotb.exe $a_args