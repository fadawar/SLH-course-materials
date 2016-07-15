DOCBOOK_XSL_DIR = /vagrant/docbook-xsl
CUSTOM_XSL_DIR = /vagrant/custom-xsl
BUILD_DIR = /vagrant/build
SRC_DIR = /vagrant/src

all: pdf epub

epub:
	vagrant ssh -c "\
        xsltproc \
            --stringparam base.dir $(BUILD_DIR)/epub-source/ \
            $(CUSTOM_XSL_DIR)/custom-style-epub.xsl \
            $(SRC_DIR)/$(file).xml; \
        zip -r -X $(BUILD_DIR)/$(file).epub $(BUILD_DIR)/epub-source/mimetype \
            $(BUILD_DIR)/epub-source/META-INF \
            $(BUILD_DIR)/epub-source/OEBPS"

fo:
	vagrant ssh -c "\
		xsltproc -o $(BUILD_DIR)/$(file).fo \
			$(CUSTOM_XSL_DIR)/custom-style-pdf.xsl \
			$(SRC_DIR)/$(file).xml"

pdf: fo
	vagrant ssh -c "\
		fop -pdf $(BUILD_DIR)/$(file).pdf -fo $(BUILD_DIR)/$(file).fo -c /vagrant/fop-cfg.xml; \
		rm $(BUILD_DIR)/$(file).fo;"

clean:
	vagrant ssh -c "\
		rm -rf $(BUILD_DIR)/*"

# This will regenarate custom XSL for title page
titlepage:
	vagrant ssh -c "\
		xsltproc -o $(CUSTOM_XSL_DIR)/booktitlepage.xsl \
			$(DOCBOOK_XSL_DIR)/template/titlepage.xsl $(CUSTOM_XSL_DIR)/booktitlepage.xml"
