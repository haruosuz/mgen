----------

Haruo Suzuki  
Last Update: 2016-01-07  

----------

# *Mycoplasma genitalium* (mgen) Project
Project started 2015-11-15.  

A complete genome of *Mycoplasma genitalium* G37 was retrieved from the NCBI FTP site. We use R to assess genome features (length, base composition, GC content of the DNA sequence, and local variation in GC content).

## Project directories

    mgen/
     README.md: project documentation 
     data/: contains sequence data in FASTA format
     scripts/: contains R and Shell scripts
     analysis/: contains results of data analyses

## Data

FASTA format sequences of Nucleic Acids (`GCA_000027325.1_ASM2732v1_genomic.fna.gz`) and Amino Acids (`GCA_000027325.1_ASM2732v1_protein.faa.gz`) downloaded on 2015-12-03 from <ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA_000027325.1_ASM2732v1/> into `data/`:

	# MD5 Checksums
	MD5 (data/GCA_000027325.1_ASM2732v1_genomic.fna.gz) = a3e6e5655e4996dc2d49f876be9d1c27
	MD5 (data/GCA_000027325.1_ASM2732v1_protein.faa.gz) = c8b83afee0016c2884b7a88bc1a9ac33

## Scripts

The shell script `scripts/run.sh` automatically carries out the entire steps: creating subdirectories, downloading data files, and running the R script `scripts/my_analysis.R` that generates two output files (`analysis/plot.pdf` and `analysis/sequence.fasta`).
The R script `scripts/my_sliding_window.R` generates sliding window plots of GC content, GC skew, and AT skew (`analysis/plot_sliding_window.pdf`).

## Usage

In the `mgen/` directory, we run the shell script `scripts/run.sh` with:

    bash scripts/run.sh > log.txt 2>&1 &

----------

## Inspecting Data

    cd data/
    ls -lh

    # Working with Gzipped Compressed Files using gzcat, zgrep, and zless
    gzcat *.fna.gz | head -n 2
    zgrep -c '^>' *.gz
    zless *.faa.gz

----------

## References
- [Genomes Download FAQ | 12. How can I download RefSeq data for all complete bacterial genomes?](http://www.ncbi.nlm.nih.gov/genome/doc/ftpfaq/#allcomplete)
 - Using the assembly summary file: i.e. ftp://ftp.ncbi.nlm.nih.gov/genomes/genbank/bacteria/Mycoplasma_genitalium/assembly_summary.txt
 - The field named "ftp_path" provides the path to the FTP directory containing the data for each assembly.

- [SeqinR](http://pbil.univ-lyon1.fr/software/seqinr/home?lang=eng)
 - [Using the R SeqinR package](http://davetang.org/muse/2013/05/09/using-the-r-seqinr-package/)
 - [Welcome to a Little Book of R for Bioinformatics!](http://a-little-book-of-r-for-bioinformatics.readthedocs.org/en/latest/index.html)
 - [Applied Statistics for Bioinformatics using R](https://cran.r-project.org/doc/contrib/Krijnen-IntroBioInfStatistics.pdf)

- Genomic nucleotide composition
 - [Database of genomic compositional skews](http://www.g-language.org/data/oriter/)
 - [Trends Microbiol. 2001 Jul;9(7):335-43. Detecting anomalous gene clusters and pathogenicity islands in diverse bacterial genomes.](http://www.ncbi.nlm.nih.gov/pubmed/11435108)
 - [Genome Res. 2001 Apr;11(4):540-6. Genome-scale compositional comparisons in eukaryotes.](http://www.ncbi.nlm.nih.gov/pubmed/11282969) [Table 1](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC311039/table/T1/)
 - [Proc Natl Acad Sci U S A. 1999 Aug 3;96(16):9184-9. Genome signature comparisons among prokaryote, plasmid, and mitochondrial DNA.](http://www.ncbi.nlm.nih.gov/pubmed/10430917) [Figure 1](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC17754/figure/F1/)

----------
