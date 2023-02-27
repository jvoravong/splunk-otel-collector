<#
.PARAMETER Target
    Build target to run (bundle)
#>
param(
    [Parameter(Mandatory=$true, Position=1)][string]$Target,
    [Parameter(Mandatory=$false, ValueFromRemainingArguments=$true)]$Remaining
)

Set-PSDebug -Trace 1
$BUNDLE_NAME = "agent-bundle"
$COLLECTD_VERSION = "5.8.0-sfx0"
$COLLECTD_COMMIT = "4d3327b14cf4359029613baf4f90c4952702105e"
$ErrorActionPreference = "Stop"

$scriptDir = split-path -parent $MyInvocation.MyCommand.Definition
$repoDir = "$scriptDir\..\..\..\..\..\.."

. "$scriptDir\common.ps1"
. "$scriptDir\bundle.ps1"

# make the build bundle
function bundle (
        [string]$buildDir="$repoDir\build",
        [string]$outputDir="$repoDir\dist",
        [bool]$DOWNLOAD_PYTHON=$false,
        [bool]$DOWNLOAD_COLLECTD=$false,
        [bool]$DOWNLOAD_COLLECTD_PLUGINS=$false) {
    mkdir "$buildDir\$BUNDLE_NAME" -ErrorAction Ignore
    Remove-Item -Recurse -Force "$buildDir\$BUNDLE_NAME\*" -ErrorAction Ignore

    if ($DOWNLOAD_PYTHON -Or !(Test-Path -Path "$buildDir\python")) {
        Remove-Item -Recurse -Force "$buildDir\python" -ErrorAction Ignore
        download_nuget -outputDir $buildDir
        install_python -buildDir $buildDir
    }

    if ($DOWNLOAD_COLLECTD_PLUGINS -Or !(Test-Path -Path "$buildDir\collectd-python")) {
        Remove-Item -Recurse -Force "$buildDir\collectd-python" -ErrorAction Ignore
        bundle_python_runner -buildDir "$buildDir"
        get_collectd_plugins -buildDir "$buildDir"
    }

    if ($DOWNLOAD_COLLECTD -Or !(Test-Path -Path "$buildDir\collectd")) {
        Remove-Item -Recurse -Force "$buildDir\collectd" -ErrorAction Ignore
        mkdir "$buildDir\collectd" -ErrorAction Ignore
        download_collectd -collectdCommit $COLLECTD_COMMIT -outputDir "$buildDir"
        unzip_file -zipFile "$buildDir\collectd.zip" -outputDir "$buildDir\collectd"
    }

    # copy python into agent-bundle directory
    Copy-Item -Path "$buildDir\python" -Destination "$buildDir\$BUNDLE_NAME\python" -recurse -Force
    # copy Python plugins into agent-bundle directory
    Copy-Item -Path "$buildDir\collectd-python" -Destination "$buildDir\$BUNDLE_NAME\collectd-python" -recurse -Force
    # copy types.db file into agent-bundle directory
    Copy-Item -Path "$buildDir\collectd\collectd-$COLLECTD_COMMIT\src\types.db" "$buildDir\$BUNDLE_NAME\types.db" -Force

    # remove unnecessary files and directories
    Get-ChildItem -recurse -path "$buildDir\$BUNDLE_NAME\*" -include __pycache__ | Remove-Item -force -Recurse
    Get-ChildItem -recurse -path "$buildDir\$BUNDLE_NAME\*" -include *.key,*.pem | Where-Object { $_.Directory -match 'test' } | Remove-Item -force
    Get-ChildItem -recurse -path "$buildDir\$BUNDLE_NAME\*" -include *.pyc,*.pyo,*.whl | Remove-Item -force

    # clean up empty directories
    remove_empty_directories -buildDir "$buildDir\$BUNDLE_NAME"

    mkdir "$outputDir" -ErrorAction Ignore
    Remove-Item -Force "$outputDir\$BUNDLE_NAME-win64.zip" -ErrorAction Ignore
    zip_file -src "$buildDir\$BUNDLE_NAME" -dest "$outputDir\$BUNDLE_NAME-win64.zip"
}

if ($REMAINING.length -gt 0) {
    $sb = [scriptblock]::create("$Target $REMAINING")
    Invoke-Command -ScriptBlock $sb
} else {
    &$Target
}
