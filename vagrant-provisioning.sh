#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install fop docbook-xsl-doc-pdf xsltproc unzip

# Download Open Sans font
wget https://www.fontsquirrel.com/fonts/download/open-sans
unzip open-sans -d OpenSans/
rm -f open-sans

# Download Docbook XSL styles
wget http://downloads.sourceforge.net/docbook/docbook-xsl-1.79.1.zip
unzip docbook-xsl-1.79.1.zip -d /vagrant/
mv /vagrant/docbook-xsl-1.79.1/ /vagrant/docbook-xsl/
rm -f docbook-xsl-1.79.1.zip
