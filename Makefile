.PHONY: main clean FORCE

main: thesis.pdf clean

thesis.pdf: FORCE
	hindent  sortacronyms.hs
	runghc sortacronyms.hs 
	cat refs/* > refs.bib
	latexmk -auxdir=tmp -outdir=tmp -pdflatex='texfot lualatex -interaction nonstopmode' -pdf -f thesis.tex
	mv tmp/thesis.pdf .

clean:
	rm -rf tmp
