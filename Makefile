FILE=parser
TEX=pdftex
GALLEY=galley

all: images labels
	weave -p $(FILE) - $(FILE)
	bash cleanindex.sh
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	cp labels.tex labels2.tex

# Transcribe one file at a time, then append the results to "esmprocessor.web"
galley: labels next
	@:

next: images labels
	weave -p $(GALLEY) - $(GALLEY)
	bash cleanindex.sh
	$(TEX) $(GALLEY)
	$(TEX) $(GALLEY)

dvi: images labels
	weave $(FILE) - $(FILE)
	bash cleanindex.sh
	tex $(FILE)
	tex $(FILE)

classic: dvi
	dvipdfmx $(FILE).dvi

twill: images labels
	twill $(FILE).web - $(FILE)
	twill $(FILE).web - $(FILE)
	tex $(FILE)
	twill-refs < $(FILE).ref > $(FILE).sref
	tex $(FILE)

labels:
	touch labels.tex

images:
	cd img && make && cd ..

clean:
	rm *.log CONTENTS.tex