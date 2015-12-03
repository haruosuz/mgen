----------

Haruo Suzuki (haruo[at]g-language[dot]org)  
Last Update: 2015-12-03  

----------

# *Mycoplasma genitalium* (mgen) Project
Project started 2015-11-15.  

A complete genome of *Mycoplasma genitalium* G37 was retrieved from the NCBI FTP site. I used R to assess genome features (length, base composition, GC content of the DNA sequence, and local variation in GC content).

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

The shell script `scripts/run.sh` automatically carries out the entire steps: creating subdirectories, downloading data files, and running the R script `scripts/my_analysis.R` that generates two output files (`analysis/plot.pdf` and `analysis/sequence.fasta`).

## Usage

In the `mgen/` directory, we run the driver script `scripts/run.sh` with:

    bash scripts/run.sh > stdout.txt 2> stderr.txt &

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

- [SeqinR](http://pbil.univ-lyon1.fr/software/seqinr/home?lang=eng)
 - [Using the R SeqinR package](http://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/)
 - [Welcome to a Little Book of R for Bioinformatics!](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)
 - [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)

- [Trends Microbiol. 2001 Jul;9(7):335-43. Detecting anomalous gene clusters and pathogenicity islands in diverse bacterial genomes.](http://www.ncbi.nlm.nih.gov/pubmed/11435108)

----------
