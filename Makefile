DOCBOOK_XSL_DIR = docbook-xsl
CUSTOM_XSL_DIR = custom-xsl
BUILD_DIR = build

all: html pdf

html:
	xsltproc -o networkmanager-manual.html $(STYLESHEETS_DIR)/xhtml/docbook.xsl networkmanager-manual.xml

epub: clean
	xsltproc \
		--stringparam base.dir $(BUILD_DIR)/epub-source/ \
		$(CUSTOM_XSL_DIR)/custom-style-epub.xsl \
		src/Spaemann-Robert-Hovorime-o-etike.xml
	zip -r -X $(BUILD_DIR)/mybook.epub $(BUILD_DIR)/epub-source/mimetype \
		$(BUILD_DIR)/epub-source/META-INF \
		$(BUILD_DIR)/epub-source/OEBPS

fo:
	xsltproc -o $(BUILD_DIR)/out.fo \
		$(CUSTOM_XSL_DIR)/custom-style-pdf.xsl src/Spaemann-Robert-Hovorime-o-etike.xml

pdf: fo
	fop -pdf $(BUILD_DIR)/out.pdf -fo $(BUILD_DIR)/out.fo -c fop-cfg.xml

clean:
	rm -rf $(BUILD_DIR)/*

# This will regenarate custom XSL for title page
titlepage:
	xsltproc -o $(CUSTOM_XSL_DIR)/booktitlepage.xsl \
		$(DOCBOOK_XSL_DIR)/template/titlepage.xsl $(CUSTOM_XSL_DIR)/booktitlepage.xml
