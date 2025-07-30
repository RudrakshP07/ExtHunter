#!/bin/bash

# Set input and output directories
TARGET_DIR="./Target"
RESULT_DIR="./Result"

# Create output directory if not exists
mkdir -p "$RESULT_DIR"

# Prompt user for filename inside Target directory
read -p "📥 Enter the name of the target file (inside Target/): " FILENAME
INPUT_FILE="$TARGET_DIR/$FILENAME"

# Check if file exists
if [[ ! -f "$INPUT_FILE" ]]; then
  echo "❌ File not found: $INPUT_FILE"
  exit 1
fi

# Regex pattern for sensitive or interesting extensions
EXT_PATTERN="\.(xls|xlsx|csv|json|xml|sql|db|mdb|sqlite|pdf|doc|docx|ppt|pptx|txt|rtf|conf|cfg|ini|env|log|bak|old|sh|ps1|py|php|js|jsp|asp|aspx|zip|tar|tar\.gz|tgz|rar|7z|html?|css|jpeg|jpg|png|gif|svg|mp3|wav|mp4|avi|mov|pem|key|csr|crt|swp|DS_Store)$"

# Output file with timestamp
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
OUTPUT_FILE="$RESULT_DIR/matched_$TIMESTAMP.txt"

# Perform the grep and save results
echo "🔍 Searching for endpoints with interesting extensions..."
grep -iE "$EXT_PATTERN" "$INPUT_FILE" | tee "$OUTPUT_FILE"

# Summary
MATCH_COUNT=$(wc -l < "$OUTPUT_FILE")
echo -e "\n✅ Done. Found $MATCH_COUNT matches."
echo "📄 Results saved to: $OUTPUT_FILE"
