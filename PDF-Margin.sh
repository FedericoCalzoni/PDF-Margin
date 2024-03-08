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

# Step 1: Create temp_a4.pdf
gs -o temp_a4.pdf -sDEVICE=pdfwrite -sPAPERSIZE=a4 -dPDFFitPage -f "$input_pdf"

# Wait for temp_a4.pdf to be created
while [ ! -f temp_a4.pdf ]; do
    sleep 1
done

# Create output.pdf with increased width and content translated 20mm to the left
gs -o "${inputname}-wide.pdf" -sDEVICE=pdfwrite -dDEVICEWIDTHPOINTS=595 -dDEVICEHEIGHTPOINTS=1100 -dFIXEDMEDIA -dPDFFitPage -c "<</Install {0 0 translate 0 -140 translate}>> setpagedevice" -f temp_a4.pdf


# Cleanup temp_a4.pdf
rm temp_a4.pdf

echo "Output PDF: ${inputname}-wide.pdf"

