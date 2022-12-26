cd .\vue
try {
    # package.json is in root folder, while version.ps1 runs in .pipelines folder.
    $version = (Get-Content "package.json") -join "`n" | ConvertFrom-Json | Select -ExpandProperty "version"

    $buildNumber = "$version"

    Write-Host "Build Number is" $buildNumber

    Write-Host "##vso[task.setvariable variable=CustomBuildNumber]${buildNumber}"
    Write-Host "##vso[build.updatebuildnumber]${buildNumber}"

  }
  catch {
    Write-Error $_.Exception
    exit 1;
  }
