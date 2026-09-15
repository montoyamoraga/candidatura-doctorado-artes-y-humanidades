# candidatura-doctorado-artes-y-humanidades

Candidatura de doctorado  para el programa de Artes y Humanidades del Instituto de Estudios Avanzados, Universidad de Santiago de Chile. Proyecto: "Popusintesíntesis", por Aarón Montoya Moraga.

## Estructura

- `candidatura.tex` — documento principal, arma el formulario a partir de los archivos en `capitulos/` y `secciones-formulario/`.
- `capitulos/` — capítulos de la tesis.
- `secciones-formulario/` — secciones de la tesis (resumen, hipótesis,
  objetivos, metodología, plan de trabajo, fuentes, apéndice, etc.).
- `biblio.bib` — bibliografía en BibLaTeX.
- `imagenes/` — imágenes usadas en el documento de tesis y en las diapositivas.
- `diapos/diapos.tex` — presentación en Beamer de la candidatura.

## Compilar localmente

Requiere una distribución de LaTeX con `latexmk` y `biber` (por ejemplo
TeX Live o MacTeX).

Compilar la tesis:

```sh
latexmk -pdf -interaction=nonstopmode -jobname=candidatura candidatura.tex
```

Compilar las diapositivas:

```sh
cd diapos
latexmk -pdf -interaction=nonstopmode -jobname=diapos diapos.tex
```

## Integración continua y GitHub Pages

El workflow en [.github/workflows/compilar-pdf.yaml](.github/workflows/compilar-pdf.yaml) compila `candidatura.tex` y `diapos/diapos.tex` cada noche (o manualmente vía
`workflow_dispatch`) cuando hay cambios en los archivos fuente, y publica los PDFs resultantes en GitHub Pages.

## Licencia

Ver [LICENSE](LICENSE).
