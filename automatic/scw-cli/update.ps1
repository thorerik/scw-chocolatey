import-module au

$releases = 'https://github.com/scaleway/scaleway-cli/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    #tidy-5.1.25-win64.zip
    $re  = "scw-windows-(i386|amd64).exe"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version_temp = $download_page.links | ? href -match "scw_(\d*\.\d*)_amd64.deb"
    $version = $version_temp[0] -split '_' | select -Last 1 -Skip 1
    $url32 = 'https://github.com' + $url[0]
    $url64 = 'https://github.com' + $url[1]

    $Latest = @{ URL32 = $url32; URL64 = $url64; Version = $version }
    return $Latest
}

update
