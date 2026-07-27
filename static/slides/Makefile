# ============================================================
#  INTERNAL VARIABLES – you normally do NOT edit these
# ============================================================

# *.qmd source files for slides
QMDSRC := $(wildcard *.qmd)

# -------------------------------------------------
#  Derive names for each variant
# -------------------------------------------------
#   e.g.   report.qmd → report-light.html, report-dark.html
LIGHT_HTML := $(patsubst %.qmd,%-light.html,$(QMDSRC))
DARK_HTML  := $(patsubst %.qmd,%-dark.html,$(QMDSRC))

LIGHT_PDF  := $(patsubst %.qmd,%-light.pdf,$(QMDSRC))
DARK_PDF   := $(patsubst %.qmd,%-dark.pdf,$(QMDSRC))

# the *_files folders create during revealjs render
HTML_LIB_DIR := $(patsubst %.qmd,%_files,$(QMDSRC))

# -------------------------------------------------
# Keep the dark HTML files after the PDF is built
# -------------------------------------------------
.PRECIOUS: $(DARK_HTML)

# ============================================================
# #  PHONY TARGETS
# ============================================================

# -------------------------------------------------
# Default target - build both variants for all QMDs
# -------------------------------------------------
.PHONY: all
all: $(LIGHT_PDF) $(DARK_PDF)

# -------------------------------------------------
# Optional shortcuts
# -------------------------------------------------
light: $(LIGHT_PDF)
dark:  $(DARK_PDF)

# -------------------------------------------------
# List what will be built
# -------------------------------------------------
.PHONY: list
list:
	@echo "Quarto source files : $(QMDSRC)"
	@echo "Output html files   : $(LIGHT_HTML) $(DARK_HTML)"
	@echo "Output pdf files    : $(LIGHT_PDF) $(DARK_PDF)"

# -------------------------------------------------
# Clean up generated PDFs and HTMLs
# -------------------------------------------------
.PHONY: clean
clean:
	@echo "Removing generated *.html and *.pdf files..."
	rm -f $(LIGHT_HTML) $(DARK_HTML)
	rm -f $(LIGHT_PDF) $(DARK_PDF)
	rm -rf $(HTML_LIB_DIR)

# ============================================================
# Build targets
# ============================================================

# -------------------------------------------------
#  Render light‑theme HTML
# -------------------------------------------------
# Quarto can be asked to use a specific format via the
#   --to flag, which overrides the default in _quarto.yml.
# Assuming your _quarto.yml defines a format named "revealjs-light",
# the command below forces that format.
%-light.html: %.qmd
	quarto render $< --to revealjs-light --output $@

# -------------------------------------------------
#  Render dark‑theme HTML
# -------------------------------------------------
%-dark.html: %.qmd
	quarto render $< --to revealjs-dark --output $@

# -------------------------------------------------
# Convert each HTML version to PDF with decktape
# -------------------------------------------------
%-light.pdf: %-light.html
	decktape $< $@

%-dark.pdf: %-dark.html
	decktape $< $@
