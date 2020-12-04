# votesheet-marc
Convert vote result PDF to MARC.

#### Requirements:
[pdftotext](https://www.xpdfreader.com/pdftotext-man.html). `pdftotext` needs to be in the user's PATH

Windows: 
* [Strawberry Perl](http://strawberryperl.com/)

Mac/Linux: 
* Built-in Perl installation should be sufficient.

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

For each file path provided to the script, the user will be prompted to manually enter the resolution symbol for the vote in the file. The user is able to review the results on the screen, to compare with the data in the PDF if they wish. When all the files have been processed, one MARC file (.mrc) is produced containing the MARC data for all the files prcossed as a batch for import into Horizon. 
