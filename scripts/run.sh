#!/bin/bash
set -euo pipefail

# Creating directories

mkdir -p ./{data,analysis/results-$(date +%F)}

# Downloading data
# In the assembly summary file ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/Mycoplasma_genitalium/assembly_summary.txt # The field named "ftp_path" provides the path to the FTP directory containing the data for each assembly.

URL=ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000027325.1_ASM2732v1/
wget -P data/ $URL/{README.txt,md5checksums.txt,*.fna.gz,*.faa.gz}

echo "MD5 Checksums"
md5 data/*.gz

# Running R scripts

Rscript --vanilla scripts/my_analysis.R

# Print operating system characteristics

uname -a

echo "[$(date)] Done"
