#! /usr/bin/env bash

# zathura-word-counter.sh
# A script to count words in the current PDF viewed in Zathura

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pdf_file>"
    exit 1
fi

PDF_FILE="$1"

# Check if the file exists
if [ ! -f "$PDF_FILE" ]; then
    echo "Error: File '$PDF_FILE' not found."
    exit 1
fi

# Check if pdftotext is installed
if ! command -v pdftotext &> /dev/null; then
    echo "Error: pdftotext is not installed. Please install poppler-utils."
    exit 1
fi

# Extract text from PDF
TEMP_TEXT=$(mktemp)
pdftotext "$PDF_FILE" "$TEMP_TEXT"

# Count words
WORD_COUNT=$(wc -w < "$TEMP_TEXT")

# Count pages
PAGE_COUNT=$(pdfinfo "$PDF_FILE" | grep "Pages" | awk '{print $2}')

# Calculate average words per page
AVG_WORDS_PER_PAGE=$(echo "scale=2; $WORD_COUNT / $PAGE_COUNT" | bc)

# Display results in a notification
notify-send "PDF Word Count" "File: $(basename "$PDF_FILE")\nTotal Words: $WORD_COUNT\nPages: $PAGE_COUNT\nAvg Words/Page: $AVG_WORDS_PER_PAGE"

# Clean up
rm "$TEMP_TEXT"
