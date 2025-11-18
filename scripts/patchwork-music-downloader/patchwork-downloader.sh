#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <URL>"
  exit 1
fi
url=$1
if [[ ! $url =~ ^https://patchwork\.moekyun\.me/watch\?v=[A-Za-z0-9_-]+$ ]]; then
  echo "The URL format is incorrect. Expected format: https://patchwork.moekyun.me/watch?v=ID"
  exit 1
fi
id=${url#*v=}

echo "Parsed ${id}. Downloading video"
wget "https://cdn.pinapelz.com/VTuber%20Covers%20Archive/${id}.webm"

if [ ! -f "$id.webm" ]; then
    echo "Failed to download the video. Check the URL and is wget installed?"
    exit i
fi

# Convert the video to an mp3
echo "Converting video to MP3"
ffmpeg -i "${id}.webm" "${id}.mp3"

if [ ! -f "$id.mp3" ]; then
    echo "Failed to convert video to MP3 is ffmepg installed?"
    exit 1
fi

echo "Removing ${id}.webm"
rm -rf "${id}.webm"

# Download the thumbnail
echo "Downloading thumbnail from CDN..."
wget "https://content.pinapelz.com/file/vtuber-rabbit-hole-archive/VTuber+Covers+Archive/thumbnails/${id}.jpg"

if [ ! -f "$id.jpg" ]; then
    echo "Failed to download thumbnail. Is wget installed?"
    exit 1
fi

echo "Applying album art using eyeD3"
eyeD3 --add-image "${id}.jpg:FRONT_COVER" "${id}.mp3"

if [ $? -eq 0 ]; then
  echo "Album art has been successfully applied to ${id}.mp3"
else
  echo "Failed to apply album art. Is eyeD3 installed?"
  exit 1
fi

# Final cleanup
rm -rf "${id}.jpg"
