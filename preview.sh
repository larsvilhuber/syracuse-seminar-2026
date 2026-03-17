#!/bin/bash

# Quarto preview with default port and host
# Usage: ./preview.sh [index.qmd]

FILE=${1:-index.qmd}

quarto preview "$FILE" --port 3456 --host 0.0.0.0
