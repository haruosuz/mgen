#!/bin/bash
set -euo pipefail

# Creating directories

mkdir -p ./{data,analysis/results-$(date +%F)}

# Downloading data

Genus_Species_Strain="Mycoplasma_genitalium_G37"
wget -P data/ -nd -cNr -t 45 -A "*.faa,*.fna" "ftp://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/${Genus_Species_Strain}*"

# Running R scripts

ACCESSION="NC_000908"
Rscript --vanilla scripts/my_analysis.R $ACCESSION

# Print operating system characteristics

uname -a

echo "[$(date)] Thank you, come again."

