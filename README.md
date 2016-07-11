SLH-course-materials
====================
Materials for course from The Ladislav Hanus Fellowship

Usage
-----
Create pdf:
`make pdf file=Spaemann-Robert-Hovorime-o-etike`

Create epub:
`make epub file=Spaemann-Robert-Hovorime-o-etike`

Setup
-----
Install packages `sudo apt install fop docbook-xsl-doc-pdf xsltproc`

Download XSLT from https://sourceforge.net/projects/docbook/files/docbook-xsl/ (tested with version 1.79.1)
and put it into directory `docbook-xsl`

Path to fonts must be defined in `fop-cfg.xml` and you then can change font that will be used in `Makefile`

ToDo
----
Add vagrant
Add SLH logo to title page