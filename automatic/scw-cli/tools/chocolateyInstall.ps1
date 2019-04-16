$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/scaleway/scaleway-cli/releases/download/v1.19/scw-windows-amd64.exe'
$checksum32      = '55eb14959aff9374e282b3dbdd0e17fe84a604c91bf9b5b6507cb02ecddc0c25'
$checksumType32  = 'sha256'
$url64 = 'https://github.com/scaleway/scaleway-cli/releases/download/v1.19/scw-windows-i386.exe'
$checksum64    = '883c8a66cd5a35d85fa89b1ff5705a38cbb7ac6cadb592bd404dc7c52c3e54d3'
$checksumType64= 'sha256'

Get-ChocolateyWebFile -PackageName 'scaleway-cli' -FileFullPath "$toolsDir\scw.exe" -Url $url32 -Url64 $url64 -Checksum $checksum32 -ChecksumType $checksumType32 -Checksum64 $checksum64 -ChecksumType64 $checksumType64
