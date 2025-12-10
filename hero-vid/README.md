Hero assets

This folder is used for the hero video and its derived assets.

Expected files (use the scripts in `scripts/` to generate them):

- `VN20251204_113353.mp4`  (original source video - place it here)
- `VN20251204_113353-ios.mp4`  (H.264 baseline MP4 suitable for iPhone)
- `VN20251204_113353.webm`  (optional WebM fallback)
- `hero-poster.jpg` or `hero-poster.svg`  (poster image shown before playback)

How to generate (PowerShell):

```powershell
# from repository root (PowerShell)
cd .\scripts
.\convert-hero.ps1 -Input "..\hero-vid\VN20251204_113353.mp4"
```

How to generate (bash):

```bash
# from repository root
chmod +x scripts/convert-hero.sh
./scripts/convert-hero.sh
```

After generating the files, make sure `index.html` references the produced filenames (the default `index.html` references `VN20251204_113353.mp4` and `VN20251204_113353.webm` and `hero-poster.jpg`).

If you want me to add the generated files to the repo, upload the generated files here or allow me to access them and I'll commit them for you.