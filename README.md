----------

Haruo Suzuki  
Last Update: 2016-03-22  

----------

# *Mycoplasma genitalium* (mgen) Project
Project started 2015-11-15.  

A complete genome of *Mycoplasma genitalium* G37 was retrieved from the NCBI FTP site.
R language was used to assess genome features (length, base composition, and GC content of the DNA sequence, and local variation in GC content and skew).

## Project directories

    mgen/
     README.md: project documentation 
     data/: contains sequence data in FASTA format
     scripts/: contains R and Shell scripts
     analysis/: contains results of data analyses

## Data

FASTA format sequences of Nucleic Acids (`GCF_000027325.1_ASM2732v1_genomic.fna.gz`) and Amino Acids (`GCF_000027325.1_ASM2732v1_protein.faa.gz`) downloaded on 2016-01-22 from <ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF_000027325.1_ASM2732v1/> into `data/`:

    # MD5 Checksums
    MD5 (data/GCF_000027325.1_ASM2732v1_genomic.fna.gz) = 456f609c24abab75d4d593b5c92bd631
    MD5 (data/GCF_000027325.1_ASM2732v1_protein.faa.gz) = 02805a93d8dc783967e0a8fdb4511af5

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating subdirectories, downloading data files, and running the R scripts 
`scripts/my_analysis.R` that calculates length and base composition of a DNA sequence, and 
`scripts/my_sliding_window.R` that generates sliding window plots of GC content and GC skew (`analysis/Rplots_sliding_window.pdf`).

Let's run the driver script in the project's main directory `mgen/` with:

    bash scripts/run.sh > log.txt 2>&1 &

## Inspecting Data

    cd data/
    ls -lh
    # Working with Gzipped Compressed Files using gzcat, zgrep, and zless
    gzcat *.fna.gz | head -n 2
    zgrep -c '^>' *.gz
    zless *.faa.gz

## Updates

- 2016-01-22  
 - Downloaded data from <ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCF_000027325.1_ASM2732v1/>

- 2016-01-11  
 - Created the R script `scripts/my_sliding_window.R`

- 2015-12-04  
 - Downloaded data from <ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000027325.1_ASM2732v1/>

- 2015-11-15  
 - Created the project directory using `mkdir -p mgen/{data,scripts,analysis}`
 - Downloaded data from <ftp://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/>
 - Created the shell script `scripts/run.sh` and R script `scripts/my_analysis.R` 

----------

## References
- Genomes Download FAQ
  - [9. How can I find the sequence and annotation of my genome of interest?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#howtofind) Using the assembly summary files for bacteria or a species under genbank or refseq
    - ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/assembly_summary.txt
    - ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/assembly_summary.txt
    - ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/Mycoplasma_genitalium/assembly_summary.txt
    - ftp://ftp.ncbi.nlm.nih.gov/genomes/refseq/bacteria/Mycoplasma_genitalium/assembly_summary.txt
 - [12. How can I download RefSeq data for all complete bacterial genomes?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#allcomplete)

- Genomic nucleotide composition
 - [Database of genomic compositional skews](http://www.g-language.org/data/oriter/)
 - [Trends Microbiol. 2001 Jul;9(7):335-43. Detecting anomalous gene clusters and pathogenicity islands in diverse bacterial genomes.](http://www.ncbi.nlm.nih.gov/pubmed/11435108)

----------
