#!/bin/bash

# Criar diretório de assets se não existir
mkdir -p client/public/assets

# Converter SVG para PNG em diferentes tamanhos
convert client/public/assets/logo.svg -resize 16x16 client/public/assets/favicon-16x16.png
convert client/public/assets/logo.svg -resize 32x32 client/public/assets/favicon-32x32.png
convert client/public/assets/logo.svg -resize 96x96 client/public/assets/favicon-96x96.png
convert client/public/assets/logo.svg -resize 180x180 client/public/assets/apple-touch-icon-180x180.png
convert client/public/assets/logo.svg -resize 192x192 client/public/assets/android-chrome-192x192.png
convert client/public/assets/logo.svg -resize 512x512 client/public/assets/android-chrome-512x512.png

# Criar ícone maskable (com padding para área segura)
convert client/public/assets/logo.svg -resize 192x192 \
        -gravity center -background "#003428" -extent 240x240 \
        client/public/assets/maskable-icon.png

# Criar favicon.ico multi-tamanho
convert client/public/assets/favicon-16x16.png \
        client/public/assets/favicon-32x32.png \
        client/public/assets/logo.svg -resize 48x48 \
        client/public/assets/favicon.ico

# Otimizar PNGs
find client/public/assets -name "*.png" -exec optipng -o7 {} \;

echo "Ícones gerados com sucesso!" 