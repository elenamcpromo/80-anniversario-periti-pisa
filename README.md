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
- `80-anniversario-periti-pisa.pdf` - PDF A4 verticale, 2 pagine (copertina + sede)
- `80-anniversario-periti-pisa-one-page.pdf` - A3 orizzontale, 1 pagina
- `build-pdf.sh` - genera entrambi i PDF
- `print-poster.css` - override di stampa per la sola locandina A3

## Rigenerare i PDF

```sh
./build-pdf.sh
```

Servono Google Chrome e Ghostscript (`brew install ghostscript`).

Il blocco `@media print` in `index.html` impagina la landing su due pagine A4
verticali (copertina e scheda sede): e' anche cio' che si ottiene con Cmd+P dal
sito. La locandina A3 orizzontale su pagina singola nasce dallo stesso HTML con
in piu' `print-poster.css`, iniettato solo dallo script: il file non e'
collegato a `index.html`, quindi non cambia il comportamento della pagina online.

Due accortezze, entrambe necessarie per ottenere PDF leggeri e veloci da aprire:

- `--window-size=1400,1900` serve perche' con la viewport di default (800px)
  si attiva il breakpoint `max-width: 860px` e la foto hero in versione desktop
  non viene mai scaricata: il PDF uscirebbe senza immagine di sfondo.
- Le regole di stampa usano solo colori opachi piu' un'unica velatura ad alpha
  costante (`.hero::before`). Ombre e gradienti semitrasparenti costringono Chrome
  a incorporare soft mask a piena pagina da decine di megapixel, che gonfiano il
  file e rallentano l'apertura. Il passaggio con `gs` ricomprime in JPEG le
  immagini, che Chrome esporta come bitmap non compressi.
- `-sColorConversionStrategy=sRGB` nel comando `gs` non e' opzionale: senza,
  Ghostscript riscrive il profilo ICC di Chrome come stream vuoto e Anteprima,
  WhatsApp e in generale i visualizzatori basati su Quartz non disegnano le
  immagini che lo referenziano. Chrome e Ghostscript ripiegano su DeviceRGB,
  quindi il difetto non si nota provando il PDF nel browser.
