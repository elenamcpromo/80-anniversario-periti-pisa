# Brand spec - 80 Anniversario Ordine Periti Industriali Pisa

Fonte: https://periti-industriali.pisa.it/ e pagina sede https://www.smyhotels.com/smy-pisa-plaza.html

## Token colore

```css
:root {
  --bg: oklch(98% 0.006 255);
  --surface: oklch(100% 0 0);
  --fg: oklch(24% 0.06 270);
  --muted: oklch(47% 0.02 260);
  --border: oklch(88% 0.008 255);
  --accent: oklch(45% 0.19 25);
  --red-soft: oklch(94% 0.034 22);
  --red-wash: oklch(97% 0.018 24);
  --red-gradient: linear-gradient(110deg, #d93a44 0%, #f0737d 28%, #e55a66 52%, #f28a91 78%, #d93a44 100%);
  --red-page-gradient: linear-gradient(180deg, #ffffff 0%, #fbfbfc 48%, #ffffff 100%);
}
```

## Font

- Display: "Iowan Old Style", "Charter", Georgia, serif.
- Body: -apple-system, BlinkMacSystemFont, "Segoe UI", system-ui, sans-serif.
- Mono: "IBM Plex Mono", ui-monospace, Menlo, monospace.

## Regole di postura

- Tono istituzionale: gerarchia chiara, poco ornamento, molto spazio tra blocchi.
- Colore principale ispirato al sito dell'Ordine: rosso istituzionale estratto da CSS `#b00e15` / `#BE0015`, usato su CTA e dettagli cerimoniali.
- Gradiente rosso ufficiale del tema WordPress, rilevato su `.lista_prodotti_bg_header:before` / `.separatore:before`: `linear-gradient(to right, #b00e15 0%, #dc3545 0%, #6c3b35 21%, #482a26 52%, #dc3545 78%, #b00e15 100%)`.
- Variante usata in landing: fondo bianco/neutro con una velatura rossa minima; il rosso resta concentrato su CTA, card evento e chiusura.
- Logo usato dalla landing: `assets/logo-periti-pittogramma.png`, pittogramma ufficiale scaricato da `https://periti-industriali.pisa.it/wp-content/uploads/2022/01/cropped-pittogramma_periti-e1643190985921.png`.
- Uso grafico del pittogramma: solo marchio in testata; niente sigilli, filigrane, pattern ripetuti o decorazioni verticali.
- Testata: barra continua a tutta larghezza, senza CTA in alto, con pittogramma più visibile e nota istituzionale compatta.
- Sfumature di pagina: fondo neutro con accenti rossi controllati su fasce e card principali; nessuna riga verticale o pattern decorativo ripetuto.
- Logo completo conservato in progetto: `assets/logo-appi.png`, non usato come marchio principale in questa versione.
- Asset celebrativo PDF conservato in progetto: `assets/logo-periti-spilla-2026.png`, non usato come marchio principale.
- Foto territoriale usata nel hero: `assets/pisa-piazza-miracoli.png`, immagine di Piazza dei Miracoli allegata al progetto e usata per personalizzare la landing con un riferimento visivo a Pisa.
- Foto sede usata nella landing: `assets/smy-pisa-plaza-facciata.jpg`, immagine ad alta qualità presa dallo slider ufficiale dello Smy Pisa Plaza e usata nella sezione Smy Pisa Plaza.
- Blu profondo estratto da CSS `#202D5F` / `#222F61` come testo e fondo di pannelli celebrativi.
- Bordi sottili e angoli contenuti, senza card decorative sovrapposte.
- Tipografia elegante: serif solo per headline/numero anniversario, sans pulito per testo informativo.
