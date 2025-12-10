# PowerShell script to transcode hero video into iPhone-friendly MP4, WebM and generate a poster image
# Requires ffmpeg to be installed and available in PATH

param(
  [string]$Input = "hero-vid\VN20251204_113353.mp4",
  [string]$OutMp4 = "hero-vid\VN20251204_113353-ios.mp4",
  [string]$OutWebm = "hero-vid\VN20251204_113353.webm",
  [string]$Poster = "hero-vid\hero-poster.jpg"
)

if (-not (Test-Path $Input)) {
  Write-Error "Input file not found: $Input"
  exit 1
}

Write-Host "Generating iPhone-friendly MP4 -> $OutMp4"
ffmpeg -i "$Input" -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p -preset slow -crf 22 -movflags +faststart -c:a aac -b:a 128k "$OutMp4"

Write-Host "Generating WebM fallback -> $OutWebm"
ffmpeg -i "$Input" -c:v libvpx-vp9 -b:v 0 -crf 30 -c:a libopus "$OutWebm"

Write-Host "Generating poster image -> $Poster"
ffmpeg -i "$Input" -ss 00:00:01.000 -vframes 1 -q:v 2 "$Poster"

Write-Host "Done. Place the generated files in hero-vid/ and update index.html if needed."