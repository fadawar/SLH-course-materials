DOCBOOK_XSL_DIR = docbook-xsl
CUSTOM_XSL_DIR = custom-xsl
BUILD_DIR = build

all: html pdf

epub:
	xsltproc \
		--stringparam base.dir $(BUILD_DIR)/epub-source/ \
		$(CUSTOM_XSL_DIR)/custom-style-epub.xsl \
		src/$(file).xml
	zip -r -X $(BUILD_DIR)/$(file).epub $(BUILD_DIR)/epub-source/mimetype \
		$(BUILD_DIR)/epub-source/META-INF \
		$(BUILD_DIR)/epub-source/OEBPS

fo:
	xsltproc -o $(BUILD_DIR)/$(file).fo \
		$(CUSTOM_XSL_DIR)/custom-style-pdf.xsl src/$(file).xml

pdf: fo
	fop -pdf $(BUILD_DIR)/$(file).pdf -fo $(BUILD_DIR)/$(file).fo -c fop-cfg.xml
	rm $(BUILD_DIR)/$(file).fo

clean:
	rm -rf $(BUILD_DIR)/*

# This will regenarate custom XSL for title page
titlepage:
	xsltproc -o $(CUSTOM_XSL_DIR)/booktitlepage.xsl \
		$(DOCBOOK_XSL_DIR)/template/titlepage.xsl $(CUSTOM_XSL_DIR)/booktitlepage.xml
