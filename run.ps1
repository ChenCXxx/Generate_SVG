$inputPath = "inputs"
if (-not (Test-Path $inputPath)) { Write-Error "No inputs folder"; exit }

# 取得檔案
$allFiles = Get-ChildItem -Path "$inputPath\*.txt"
$files = $allFiles | Where-Object {
    $name = $_.BaseName.Trim()
    if ($name -match '^\d+$') {
        if ([int]$name -ge 21 -and [int]$name -le 40) { return $true } else { return $false }
    }
    return $true
}

# 執行迴圈
if ($null -eq $files) { 
    Write-Host "No files found." 
} else {
    foreach ($f in $files) {
        $idx = $f.BaseName
        Write-Host "--- Processing: $idx ---"
        python autofigure2.py --method_file "$($f.FullName)" --output_dir "outputs\$idx" --provider gemini --api_key "AIzaSyCGCmEy4FyYkCU2vVW7OBIRB5GeOlf3XUA" --sam_backend roboflow --sam_api_key "vdC5opyaIIbSWzQXhEAQ"
    }
}
Write-Host "Success!"