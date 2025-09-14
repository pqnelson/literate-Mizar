FILE=parser
TEX=pdftex
GALLEY=galley

all: extract images labels pdf

pdf: labels
	weave -p $(FILE) - $(FILE)
	bash cleanindex.sh
	$(TEX) $(FILE)
	$(TEX) $(FILE)
	cp labels.tex labels2.tex

extract:
	cat intro.web base/mizenv.web base/mconsole.web base/pcmizver.web base/mstate.web base/monitor.web base/errhan.web base/mtime.web base/numbers.web base/mobjects.web base/xml_dict.web base/librenv.web base/librenv.web base/info.web base/xml_parser.web base/xml_inout.web  base/dicthan.web base/scanner.web base/_format.web base/syntax.web base/mscanner.web base/abstract_syntax.web base/wsmarticle.web base/pragmas.web base/parseraddition.web base/parser.web index.web > parser.web

# Transcribe one file at a time, then append the results to "esmprocessor.web"
galley: labels next
	@:

next: labels
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