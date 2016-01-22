cat("\n  This R script calculates length and base composition of a DNA sequence.\n\n")

# Loading seqinr package
library(seqinr)

# Set Working Directory
#setwd("~/projects/mgen/")

# List files in a directory
files <- list.files(path="data", pattern="genomic.fna.gz", full.names=TRUE)

# Reading sequence data into R
lna <- read.fasta(file = files[1], seqtype = c("DNA"))

cat("# How many sequences\n")
length(lna)

# Access the 1st element of the list
dna <- lna[[1]]

cat("# Length of a DNA sequence\n")
length(dna)

cat("# Base composition of a DNA sequence\n")
cat("# Absolute frequencies\n")
( x <- table(dna) )
cat("# Relative frequencies\n")
x / sum(x)

cat("# GC Content\n")
#(x["g"] + x["c"]) / (x["a"] + x["t"] + x["g"] + x["c"])
#(x["g"] + x["c"]) / sum(x)
GC(dna)
#GC(s2c("acgt")) # 0.5

cat("# Dinucleotide counts\n")
count(dna, 2)
#count(s2c("atg"), 2) # "at" and "tg"

# Print R version and packages
sessionInfo()
