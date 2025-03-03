# Run NVIDIA SMI to get GPU temperature
$gpuTempC = & nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader

# Check if the output is a valid number
if ($gpuTempC -match "^\d+$") {
    # Convert to Fahrenheit and Kelvin
    $gpuTempF = ($gpuTempC * 9/5) + 32
    $gpuTempK = $gpuTempC + 273.15

    # Display results
    Write-Host "`nGPU Temperature:"
    Write-Host "  - $gpuTempC°C"
    Write-Host "  - $gpuTempF°F"
    Write-Host "  - $gpuTempK K"
} else {
    Write-Host "❌ Unable to retrieve GPU temperature. Possible reasons:"
    Write-Host "   - No NVIDIA GPU detected."
    Write-Host "   - Outdated or missing drivers."
    Write-Host "   - Running inside a virtual machine."
}

# Keep the window open
Write-Host "`nPress Enter to exit..."
$null = Read-Host
