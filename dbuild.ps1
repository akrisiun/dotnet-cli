
$Configuration="Debug"
$ArchitectureParam="/p:Architecture=x64"
$ConfigurationParam="-configuration $Configuration"
# Invoke-Expression "$RepoRoot\eng\common\build.ps1 -restore -build $ConfigurationParam $ArchitectureParam $ExtraParameters"
# https://dotnetcli.azureedge.net/dotnet/Sdk/3.0.100-preview4-010615/

# .dotnet/dotnet build src/dotnet -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0
# ./eng/common/build.ps1 -build /p:Architecture=x64
$dotc = ".dotnet/dotnet.exe"

& $dotc restore src/dotnet
& $dotc restore build/RestoreDependency.proj
& $dotc restore build\sdks\sdks.csproj 
& $dotc restore src/redist

& $dotc build src/dotnet
& $dotc publish src/dotnet -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0  -f netcoreapp3.0
& $dotc publish src/Microsoft.DotNet.Configurer  -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0
& $dotc publish src/Microsoft.DotNet.InternalAbstractions  -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0
& $dotc publish src/Microsoft.DotNet.Cli.Utils  -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0 -f netcoreapp3.0
& $dotc publish src/Microsoft.DotNet.Cli.Sln.Internal -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0

# .dotnet/dotnet.exe msbuild src/dotnet/dotnet.csproj /t:build /v:d
& $dotc restore DotNet.Cli.sln
& $dotc build src/redist
& $dotc publish src/redist -o .\artifacts\bin\dotnet\Debug\netcoreapp3.0

# ./eng/common/build.ps1 -pack    $ConfigurationParam $ArchitectureParam
# ./eng/common/build.ps1 -publish    $ConfigurationParam $ArchitectureParam

# Success?
# 3.0.100-preview4-010615

./artifacts/tmp/Debug/dotnet/dotnet --info
