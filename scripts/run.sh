#!/bin/bash
set -e
set -u
set -o pipefail

# Creating directories
mkdir -p ./{data/$(date +%F),analysis}

# Downloading data
URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF_000027325.1_ASM2732v1
wget -nv -P data/ $URL/{README.txt,md5checksums.txt,*.fna.gz,*.faa.gz}

echo "MD5 Checksums"
md5 data/*.gz

# Running R scripts
Rscript --vanilla scripts/my_analysis.R
Rscript --vanilla scripts/my_sliding_window.R

# Print operating system characteristics
uname -a

echo "[$(date)] Thank you, come again."
