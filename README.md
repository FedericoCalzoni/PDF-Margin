# PDF-Margin
Small script to resize and add a margin to the right side of a PDF file. 

An example usecase is to use the generated PDF with some handwriting notetaking APP like Xournalpp
and take your notes to the side of the pdf. 

It uses pdfjam to perform the adjustments. [see pdfjam](https://github.com/rrthomas/pdfjam).
Usually shipped with texlive package.

## Usage
To use the script, pass the path to the input PDF file as an argument:

``` bash
./PDF-Margin.sh <input.pdf>
```
The script will create a new PDF file with the desired dimensions.  
