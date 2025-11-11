# PowerShell script for Lab Work H3, all C, S1, O6
# Creates folders and executes all steps for all images

# ---- 0. Create folders for results ----
$folders = @("hist", "hrayleigh", "slowpass", "oll")
foreach ($f in $folders) {
    if (-not (Test-Path $f)) {
        New-Item -ItemType Directory -Name $f
    }
}

# ---- 1. Define all images ----
$images_gray = @{
    "original" = "lena_small.bmp"
    "normal_noise" = "lena_normal2_small.bmp"
    "uniform_noise" = "lena_uniform2_small.bmp"
    "impulse_noise" = "lena_impulse2_small.bmp"
}

$images_color = @{
    "original" = "lenac_small.bmp"
    "normal_noise" = "lenac_normal2_small.bmp"
    "uniform_noise" = "lenac_uniform2_small.bmp"
    "impulse_noise" = "lenac_impulse2_small.bmp"
}

# ---- STEP 5: Linear filtration S1 (Low-pass) ----
Write-Host "`n===== STEP 5: Low-pass Filtering (S1) =====`n"
foreach ($key in $images_gray.Keys) {
    $input = $images_gray[$key]
    $output = "slowpass/" + $input + "_slowpass.bmp"
    Write-Host "Applying low-pass filter on $input"
    python main.py --slowpass -input="$input" -output="$output"
}