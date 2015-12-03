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
FASTA format sequences of Nucleic Acids (`GCA_000027325.1_ASM2732v1_genomic.fna.gz`) and Amino Acids (`GCA_000027325.1_ASM2732v1_protein.faa.gz`) downloaded on 2015-12-03 from <ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000027325.1_ASM2732v1/> into `data/`:

	# MD5 Checksums
	MD5 (data/GCA_000027325.1_ASM2732v1_genomic.fna.gz) = a3e6e5655e4996dc2d49f876be9d1c27
	MD5 (data/GCA_000027325.1_ASM2732v1_protein.faa.gz) = c8b83afee0016c2884b7a88bc1a9ac33

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating subdirectories, downloading data files, and running the R script `scripts/my_analysis.R` that generates two output files (`analysis/plot.pdf` and `analysis/sequence.fasta`).

## Usage

In the `mgen/` directory, we run the driver script `scripts/run.sh` with:

    bash scripts/run.sh > stdout.txt 2> stderr.txt &

----------

## Inspecting Data

    cd data/
    ls -lh

    # Working with Gzipped Compressed Files using zgrep, gzcat, zdiff, zless
    gzcat *.fna.gz | head -n 2
    zgrep '^>' *.faa.gz | tail -n 2
    zgrep -c '^>' *.gz
    zgrep --color -n "ATGATGATG" *.fna.gz
    zless *.fna.gz

----------

## References
- [ncbi_ftp_download](https://github.com/aleimba/bac-genomics-scripts/tree/master/ncbi_ftp_download) 

- [SeqinR](http://pbil.univ-lyon1.fr/software/seqinr/home?lang=eng)
 - [Using the R SeqinR package](http://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/)
 - [Welcome to a Little Book of R for Bioinformatics!](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)
 - [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)

- [Trends Microbiol. 2001 Jul;9(7):335-43. Detecting anomalous gene clusters and pathogenicity islands in diverse bacterial genomes.](http://www.ncbi.nlm.nih.gov/pubmed/11435108)

----------
