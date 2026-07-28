create: demoslides.pdf

demoslides.pdf: demoslides.html
	decktape demoslides.html demoslides.pdf

demoslides.html: demoslides.qmd
	quarto render demoslides.qmd --to revealjs

clean:
	rm -f demoslides.html
	rm -f demoslides.pdf
