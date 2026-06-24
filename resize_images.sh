#!/usr/bin/env bash
set -euo pipefail

if command -v magick >/dev/null 2>&1; then
  magick_cmd=(magick)
elif command -v convert >/dev/null 2>&1; then
  magick_cmd=(convert)
else
  echo "Error: ImageMagick is required (magick or convert)." >&2
  exit 1
fi

if ! command -v identify >/dev/null 2>&1; then
  if command -v magick >/dev/null 2>&1; then
    identify_cmd=(magick identify)
  else
    echo "Error: ImageMagick identify is required." >&2
    exit 1
  fi
else
  identify_cmd=(identify)
fi

resolve_inputs() {
  local items=()
  for arg in "$@"; do
    if [[ -d "$arg" ]]; then
      while IFS= read -r -d '' file; do
        items+=("$file")
      done < <(find "$arg" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" -o -iname "*.tif" -o -iname "*.tiff" \) -print0)
    elif [[ -f "$arg" ]]; then
      items+=("$arg")
    fi
  done
  printf '%s\n' "${items[@]}"
}

if (($# == 0)); then
  echo "Usage: $0 <image-or-directory> [image-or-directory ...]" >&2
  exit 1
fi

mapfile -t files < <(resolve_inputs "$@")

if ((${#files[@]} == 0)); then
  echo "No image files found." >&2
  exit 0
fi

for file in "${files[@]}"; do
  [[ -f "$file" ]] || continue
  dims=$("${identify_cmd[@]}" -format '%w %h' "$file")
  read -r width height <<< "$dims"

  if (( width > height )); then
    target_geom="x250"
  else
    target_geom="250x"
  fi

  tmp_file="${file}.tmp"
  "${magick_cmd[@]}" "$file" -resize "$target_geom" "$tmp_file"
  mv "$tmp_file" "$file"
done

# identify -format "%f: %wx%h\n" *.*
