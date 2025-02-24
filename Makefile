## jhnoll@gmail.com
ROOT:=$(shell $(HOME)/bin/findup .sgrc)
SOURCE_DIR=.
BIB=references.bib
# Set these if there is a rubric.
RUBRIC.src=
RUBRIC=

include $(ROOT)/tools/Makefile.in

# This is used by tools/Makefile.in to create 'all:' target.
INSTALL_OBJECTS=README.txt instructions.txt instructions.pdf instructions.html $(RUBRIC)

all: $(INSTALL_OBJECTS)

README.txt: ${TOOLS.dir}/templates/lab-README.md
	$(PP) -Dcomponent=${*} $(META_DATA) $< | $(PANDOC) --standalone -t plain -o $@

README.md: ${TOOLS.dir}/templates/lab-README.md
	$(PP) $< > $@

rubric.xlsx: $(RUBRIC.src)
	cp $< $@


include $(ROOT)/tools/Make.rules
clean:
	rm README.md  *.html *.pdf


