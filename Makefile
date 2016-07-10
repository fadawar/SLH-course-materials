STYLESHEETS_DIR = docbook-xsl-1.79.1
BUILD_DIR = build

all: html pdf

html:
	xsltproc -o networkmanager-manual.html $(STYLESHEETS_DIR)/xhtml/docbook.xsl networkmanager-manual.xml

fo:
	# xsltproc -o networkmanager-manual.fo $(STYLESHEETS_DIR)/fo/docbook.xsl networkmanager-manual.xml
	xsltproc -o $(BUILD_DIR)/out.fo \
		--stringparam  paper.type  A4 \
		--stringparam  title.fontset  OpenSans,normal,bold \
		--stringparam  body.fontset  OpenSans \
		$(STYLESHEETS_DIR)/fo/docbook.xsl src/Spaemann-Robert-Hovorime-o-etike.xml

pdf: fo
	fop -pdf $(BUILD_DIR)/out.pdf -fo $(BUILD_DIR)/out.fo -c fop-cfg.xml

clean:
	rm -rf networkmanager-manual.html networkmanager-manual.fo networkmanager-manual.pdf