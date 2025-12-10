#!/usr/bin/env bash
# Bash script to transcode hero video into iPhone-friendly MP4, WebM and generate a poster image
# Requires ffmpeg to be installed

INPUT="hero-vid/VN20251204_113353.mp4"
OUT_MP4="hero-vid/VN20251204_113353-ios.mp4"
OUT_WEBM="hero-vid/VN20251204_113353.webm"
POSTER="hero-vid/hero-poster.jpg"

if [ ! -f "$INPUT" ]; then
  echo "Input file not found: $INPUT"
  exit 1
fi

echo "Generating iPhone-friendly MP4 -> $OUT_MP4"
ffmpeg -i "$INPUT" -c:v libx264 -profile:v baseline -level 3.0 -pix_fmt yuv420p -preset slow -crf 22 -movflags +faststart -c:a aac -b:a 128k "$OUT_MP4"

echo "Generating WebM fallback -> $OUT_WEBM"
ffmpeg -i "$INPUT" -c:v libvpx-vp9 -b:v 0 -crf 30 -c:a libopus "$OUT_WEBM"

echo "Generating poster image -> $POSTER"
ffmpeg -i "$INPUT" -ss 00:00:01.000 -vframes 1 -q:v 2 "$POSTER"

echo "Done. Place the generated files in hero-vid/ and update index.html if needed."