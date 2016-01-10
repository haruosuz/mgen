
# Set Working Directory
#setwd("~/projects/mgen/")

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
lna <- read.fasta(file = "data/GCA_000027325.1_ASM2732v1_genomic.fna.gz")

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
