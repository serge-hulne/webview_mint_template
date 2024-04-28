#!/bin/bash

# Name of your application
APP_NAME="Counter"

# Directory where your executable and icon.png are located
SOURCE_DIR="../"

# Create the App bundle directories
mkdir -p "${APP_NAME}.app/Contents/MacOS"
mkdir -p "${APP_NAME}.app/Contents/Resources"

# Copy the executable and rename it to the app name
cp "${SOURCE_DIR}/App" "${APP_NAME}.app/Contents/MacOS/${APP_NAME}"

# Copy the icon file
cp "${SOURCE_DIR}/icon.png" "${APP_NAME}.app/Contents/Resources/icon.png"

# Create the Info.plist file
cat <<EOF >"${APP_NAME}.app/Contents/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDisplayName</key>
    <string>${APP_NAME}</string>
    <key>CFBundleExecutable</key>
    <string>${APP_NAME}</string>
    <key>CFBundleIdentifier</key>
    <string>com.example.${APP_NAME}</string>
    <key>CFBundleVersion</key>
    <string>1.0.0</string>
    <key>CFBundleIconFile</key>
    <string>icon</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
</dict>
</plist>
EOF

echo "App bundle created successfully."
