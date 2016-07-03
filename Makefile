STYLESHEETS_DIR = docbook-xsl-1.79.1
BUILD_DIR = build

all: html pdf

html:
	xsltproc -o networkmanager-manual.html $(STYLESHEETS_DIR)/xhtml/docbook.xsl networkmanager-manual.xml

fo:
	# xsltproc -o networkmanager-manual.fo $(STYLESHEETS_DIR)/fo/docbook.xsl networkmanager-manual.xml
	xsltproc -o $(BUILD_DIR)/out.fo \
		--stringparam  body.font.family  Ubuntu \
		--stringparam  title.font.family  "Ubuntu" \
		--stringparam  paper.type  A4 \
		$(STYLESHEETS_DIR)/fo/docbook.xsl src/Spaemann-Robert-Hovorime-o-etike.xml

pdf: fo
	fop -pdf $(BUILD_DIR)/out.pdf -fo out.fo

clean:
	rm -rf networkmanager-manual.html networkmanager-manual.fo networkmanager-manual.pdf