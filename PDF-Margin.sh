#!/bin/bash

# Check if an input PDF file is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input.pdf>"
    exit 1
fi

input_pdf="$1"

# Check if the input PDF file exists
if [ ! -f "$input_pdf" ]; then
    echo "Error: The input PDF file '$input_pdf' does not exist."
    exit 1
fi

# Extract the base name of the input file (without the extension)
inputname=$(basename "$input_pdf" .pdf)

# Check if the output PDF file already exists
if [ -f "${inputname}-wide.pdf" ]; then
    echo "Error: The output PDF file '${inputname}-wide.pdf' already exists."
    exit 1
fi

# Use pdfjam to resize and translate the content of the PDF
pdfjam --outfile "${inputname}-wide.pdf" --papersize '{367mm,210mm}' --scale '0.95' --offset '-40mm 0' "$input_pdf"

echo "Output PDF: ${inputname}-wide.pdf"



