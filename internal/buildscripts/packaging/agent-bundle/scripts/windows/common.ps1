Set-PSDebug -Trace 1
$MY_SCRIPT_DIR = $scriptDir = split-path -parent $MyInvocation.MyCommand.Definition

# https://blog.jourdant.me/post/3-ways-to-download-files-with-powershell
function download_file([string]$url, [string]$outputDir, [string]$fileName) {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (New-Object System.Net.WebClient).DownloadFile($url, "$outputDir\$fileName")
}

function unzip_file($zipFile, $outputDir){
    # this requires .net 4.5 and above
    Add-Type -assembly "system.io.compression.filesystem"
    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $outputDir)
}

function zip_file($src, $dest) {
    # this requires .net 4.5 and above
    Add-Type -assembly "system.io.compression.filesystem"
    $SRC = Resolve-Path -Path $src
    [System.IO.Compression.ZipFile]::CreateFromDirectory($SRC, "$dest", 1, $true)
}

function remove_empty_directories ($buildDir) {
    Set-PSDebug -Trace 0
    do {
        $dirs = gci $buildDir -directory -recurse | Where { (gci $_.fullName -Force).count -eq 0 } | select -expandproperty FullName
        $dirs | Foreach-Object { Remove-Item $_ }
    } while ($dirs.count -gt 0)
    Set-PSDebug -Trace 1
}

function replace_text([string]$filepath, [string]$find, [string]$replacement) {
    (Get-Content $filepath).replace($find, $replacement) | Set-Content $filepath
}
