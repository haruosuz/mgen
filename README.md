----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2015-11-29  

----------

# *Mycoplasma genitalium* (mgen) Project
Project started 2015-11-15.  

A complete genome of *Mycoplasma genitalium* G37 was retrieved from the NCBI FTP site. I used R to assess genome features (length, base composition, GC content of the DNA sequence, and local variation in GC content), and obtained a 16S rRNA gene sequence of the genome.

## Project directories

    mgen/
     README.md: project documentation 
     data/: contains all raw and intermediate data
     scripts/: contains general project-wide scripts
     analysis/: contains results of data analyses

## Data
FASTA format sequences of Nucleic Acids (.fna) and Amino Acids (.faa) downloaded on 2015-11-15 from <ftp://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/Mycoplasma_genitalium_G37_uid57707/> into `data/`:

	data/NC_000908.faa
	data/NC_000908.fna

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating directories (`data/` and `analysis/`), downloading data files, and running the R script `scripts/my_analysis.R` that generates two output files (`analysis/plot.pdf` and `analysis/sequence.fasta`).

## Run environment

    $uname -a
    Darwin localhost 13.4.0 Darwin Kernel Version 13.4.0: Wed Mar 18 16:20:14 PDT 2015; root:xnu-2422.115.14~1/RELEASE_X86_64 x86_64

R

    > sessionInfo()
    R version 3.2.2 (2015-08-14)
    Platform: x86_64-apple-darwin13.4.0 (64-bit)
    Running under: OS X 10.9.5 (Mavericks)
    
    locale:
    [1] C
    
    attached base packages:
    [1] stats     graphics  grDevices utils     datasets  methods   base     
    
    other attached packages:
    [1] seqinr_3.1-3 ade4_1.7-2  
    
----------

## Steps

You can run the shell script `scripts/run.sh` that carries out the entire steps (in the `mgen/` directory):

    bash scripts/run.sh > stdout.txt 2> stderr.txt &

#### Creating the project directory

    mkdir -p mgen/{data,scripts,analysis}

#### Downloading data

    Genus_Species_Strain="Mycoplasma_genitalium_G37"
    wget -b -P data/ -nd -cNr -t 45 -A "*.faa,*.fna" "ftp://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/${Genus_Species_Strain}*"

#### Running R Scripts

You can run the R script `scripts/my_analysis.R` from R:

    setwd("mgen/") # set the working directory
    source("scripts/my_analysis.R") # execute the R script

Alternatively, you can execute the R script in batch mode from the command line (in the `mgen/` directory):

    Rscript --vanilla scripts/my_analysis.R

----------

## Inspecting Data

Inspecting and Manipulating Text Data with Unix Tools

    cd data/

    # `ls -lh` reports human-readable file sizes
    ls -lh NC_000908.*

    # Inspecting Data with Head and Tail
    head -n 2 NC_000908.*
    tail -n 2 NC_000908.*

    # use `grep` to extract lines of a file that match a pattern
    grep '^>' NC_000908.faa
    # count how many lines match a pattern
    grep -c '^>' NC_000908.*
    # the matching part of a pattern is colored, using:
    grep --color 'ATG' NC_000908.fna 

    # To search text and highlights matches, open a file in `less`, and 
    # then press / and enter text (e.g. "ATG"). To quit `less`, press q.
    less NC_000908.fna

----------

## References
- [ncbi_ftp_download](https://github.com/aleimba/bac-genomics-scripts/tree/master/ncbi_ftp_download) 

- [Trends Microbiol. 2001 Jul;9(7):335-43. Detecting anomalous gene clusters and pathogenicity islands in diverse bacterial genomes.](http://www.ncbi.nlm.nih.gov/pubmed/11435108)

----------
