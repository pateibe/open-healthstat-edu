## Prerequisites

- https://en.wikipedia.org/wiki/Make_(software) - to easily render HTMLs and PDFs (see below)
- https://quarto.org/ - turn QMD into HTML presentations
- https://github.com/astefanutti/decktape - to turn the html rendered through Quarto into nice looking PDFs

## Rendering slides

``` shell
# Build all output
make    # same as: make all

# Build the light PDFs (faster if you need only them)
make light

# Build just the dark PDFs
make dark

# Remove all output
make clean
```
