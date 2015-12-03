#!/bin/bash
set -euo pipefail

# Creating directories

mkdir -p ./{data,analysis/results-$(date +%F)}

# Downloading data

URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000027325.1_ASM2732v1/
wget -P data/ $URL/{README.txt,md5checksums.txt,*.fna.gz,*.faa.gz}

echo "MD5 Checksums"
md5 data/*.gz

# Running R scripts

Rscript --vanilla scripts/my_analysis.R

# Print operating system characteristics

uname -a

echo "[$(date)] Done"
