# votesheet-marc
Convert vote result PDF to MARC.

#### Requirements:
* [Strawberry Perl](http://strawberryperl.com/) 
> Install using using the `.msi` installer from the website.

* [pdftotext](https://www.xpdfreader.com/download.html) command line executable.
> Download the zip file and copy the `pdftotext` executable (located in the zipped folder at `<root>\bin64\pdftotext.exe`) into the root of this repo or add it to your [PATH](https://en.wikipedia.org/wiki/PATH_(variable))

#### Installation:
> `git clone https://github.com/dag-hammarskjold-library/votesheet-marc`

Change directory into the repository.
> `cd votesheet-marc`

Install the dependencies using the `cpanm` Perl package installer (included with Strawberry Perl)
> `cpanm --installdeps .`

#### Usage:
It's a good idea to run `git pull` before using, to make sure you have the latest source code.<br>

Double click "run.bat" or run from the command line

> `perl run.pl`