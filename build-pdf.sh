#!/bin/sh
# Genera i due PDF a partire dalla landing.
#
#   80-anniversario-periti-pisa.pdf          A4 verticale, 2 pagine (copertina + sede)
#   80-anniversario-periti-pisa-one-page.pdf A3 orizzontale, 1 pagina (due pannelli)
#
# Il primo usa il blocco @media print di index.html, il secondo ci sovrappone
# print-poster.css. Serve Google Chrome e Ghostscript (brew install ghostscript).
set -eu

cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
TMP_HTML=".build-poster.html"
TMP_PDF=".build-raw.pdf"
trap 'rm -f "$TMP_HTML" "$TMP_PDF"' EXIT

# --window-size e' obbligatorio: con la viewport di default (800px) si attiva il
# breakpoint max-width:860px e la foto hero desktop non viene mai scaricata,
# quindi il PDF uscirebbe senza immagine di sfondo.
render() { # $1 = file html, $2 = pdf di destinazione
  "$CHROME" --headless --disable-gpu --no-pdf-header-footer \
    --window-size=1400,1900 --virtual-time-budget=15000 \
    --print-to-pdf="$TMP_PDF" "file://$PWD/$1" >/dev/null 2>&1

  # Chrome esporta le immagini come bitmap non compressi: gs le ricomprime in JPEG.
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dNOPAUSE -dBATCH -dQUIET \
    -dDetectDuplicateImages=true \
    -dAutoFilterColorImages=false -dColorImageFilter=/DCTEncode -dJPEGQ=90 \
    -dColorImageDownsampleType=/Bicubic -dColorImageResolution=220 \
    -dAutoFilterGrayImages=false -dGrayImageFilter=/DCTEncode -dGrayImageResolution=220 \
    -sOutputFile="$2" "$TMP_PDF"
  echo "  $2 ($(($(wc -c <"$2") / 1024)) KB)"
}

echo "PDF A4 su due pagine:"
render index.html 80-anniversario-periti-pisa.pdf

echo "Locandina A3 orizzontale:"
# print-poster.css va dopo lo <style> della pagina per vincere nella cascata.
sed 's#</head>#  <link rel="stylesheet" media="print" href="print-poster.css">\n</head>#' \
  index.html >"$TMP_HTML"
render "$TMP_HTML" 80-anniversario-periti-pisa-one-page.pdf
