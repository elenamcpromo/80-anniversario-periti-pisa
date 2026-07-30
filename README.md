# 80° Anniversario Periti Industriali Pisa

Landing page per l'80° Anniversario dell'Ordine dei Periti Industriali di Pisa.

## Dettagli evento

- Data: 30 ottobre 2026
- Orario: 10:00-14:30
- Luogo: Smy Pisa Plaza, Via Caduti del lavoro 46, Pisa
- Nota: ex Tower Plaza

## File principali

- `index.html` - pagina principale
- `landing-80-anniversario-periti-pisa.html` - copia nominata della landing
- `assets/` - logo e immagini usate nella pagina
- `brand-spec.md` - note visive e fonti asset
- `80-anniversario-periti-pisa.pdf` - locandina A3 generata dalla landing

## Rigenerare la locandina PDF

Il blocco `@media print` in `index.html` riduce la pagina a un'unica locandina A3
(solo il blocco hero). Per rigenerare il PDF:

```sh
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless --disable-gpu --no-pdf-header-footer \
  --window-size=1400,1900 --virtual-time-budget=15000 \
  --print-to-pdf=raw.pdf "file://$PWD/index.html"

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.7 -dNOPAUSE -dBATCH -dQUIET \
  -dDetectDuplicateImages=true \
  -dAutoFilterColorImages=false -dColorImageFilter=/DCTEncode -dJPEGQ=90 \
  -dColorImageDownsampleType=/Bicubic -dColorImageResolution=220 \
  -dAutoFilterGrayImages=false -dGrayImageFilter=/DCTEncode -dGrayImageResolution=220 \
  -sOutputFile=80-anniversario-periti-pisa.pdf raw.pdf
```

Due accortezze, entrambe necessarie per ottenere un PDF leggero e veloce da aprire:

- `--window-size=1400,1900` serve perche' con la viewport di default (800px)
  si attiva il breakpoint `max-width: 860px` e la foto hero in versione desktop
  non viene mai scaricata: il PDF uscirebbe senza immagine di sfondo.
- Le regole di stampa usano solo colori opachi piu' un'unica velatura ad alpha
  costante (`.hero::before`). Ombre e gradienti semitrasparenti costringono Chrome
  a incorporare soft mask a piena pagina da decine di megapixel, che gonfiano il
  file e rallentano l'apertura. Il passaggio con `gs` ricomprime in JPEG le
  immagini, che Chrome esporta come bitmap non compressi.
