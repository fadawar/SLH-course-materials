SLH-course-materials
====================
Materials for course from The Ladislav Hanus Fellowship

Usage
-----
First:
`vagrant up`

Create pdf:
`make pdf file=Spaemann-Robert-Hovorime-o-etike`

Create epub:
`make epub file=Spaemann-Robert-Hovorime-o-etike`

Setup
-----
Install Vagrant and run `vagrant up`

### Info
Docbook XSL is downloaded from https://sourceforge.net/projects/docbook/files/docbook-xsl/
and then is placed into directory `docbook-xsl`. Tested with version 1.79.1. You can provide new version.

Path to fonts is defined in `fop-cfg.xml`.

ToDo
----
Add SLH logo to title page