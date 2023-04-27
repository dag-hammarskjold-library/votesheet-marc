# votesheet-marc
Convert vote result PDF to MARC.

#### Requirements:
The `pdftotext` executable that is part of [Xpdf](https://www.xpdfreader.com/pdftotext-man.html) needs to be in the user's PATH. One way to do this is [download and extract the command line tools](https://www.xpdfreader.com/download.html), find the `pdftotext` exectuable file, and copy it into the root of this repository.

Windows: 
* [Strawberry Perl](http://strawberryperl.com/)

Mac/Linux: 
* ~Built-in Perl installation should be sufficient.~ This script is only suported for Windows at the moment.

#### Installation:
> `git clone https://github.com/dag-hammarskjold-library/votesheet-marc`

Change directory into the repository.
> `cd votesheet-marc`

Install the dependencies using the `cpanm` Perl package installer (included with Strawberry Perl)
> `cpanm --installdeps .`

#### Usage:

```bash
perl votesheet-marc.pl file1.pdf file2.pdf
```

For convenience, the batch file `votesheet-marc.bat` can be used to invoke the script. This method provides a GUI file chooser for selecting the votesheet file(s). The batch file can be run view command line, or by double-clicking.

For each file path provided to the script, the user will be prompted to manually enter the resolution symbol for the vote in the file. The user is able to review the results on the screen, to compare with the data in the PDF if they wish. When all the files have been processed, one MARC file (.mrc) is produced containing the MARC data for all the files prcossed as a batch for import into Horizon. 
