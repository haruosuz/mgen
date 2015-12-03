
# Set Working Directory
#setwd("~/projects/mgen/")

#install.packages("seqinr")
# Loading seqinr package
library(seqinr)

# Reading sequence data into R
args <- commandArgs(trailingOnly = TRUE) # print(args)
ld <- read.fasta(file = paste0("data/",args[1],".fna") )
ld <- read.fasta(file = "data/NC_000908.fna") # mgen
d <- ld[[1]]

cat("# Length of a DNA sequence\n")
length(d)

cat("# Base composition of a DNA sequence\n")
( x <- table(d) )
x / sum(x)

cat("# GC Content of DNA\n")
(x["g"] + x["c"]) / sum(x)
#GC(s2c("acgt")) # 0.5
GC(d)

# DNA words
cat("# Dinucleotide count\n")
#count(s2c("atg"), 2) # "at" and "tg"
count(d, 2)

# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC17754/figure/F1/
cat("# Dinucleotide relative abundances (Rho)\n")
rho(d, 2)

cat("# Local variation in GC content\n")
GC(d[1:100000])
GC(d[100001:200000])
GC(d[200001:300000])
GC(d[300001:400000])
GC(d[400001:500000])
GC(d[500001:580076])

cat("# A sliding window analysis of GC content\n")
library(zoo)
rollapply(data = d, width = 100000, by = 100000, FUN = GC)

# A sliding window plot of GC content
windowsize <- 10000
x <- seq(from = 1, to = length(d)-windowsize, by = windowsize)
y <- rollapply(data = d, width = windowsize, by = windowsize, FUN = GC)
pdf(file="analysis/plot_GCwin.pdf")
plot(x, y, type="l", xlab="Position (bp)", ylab="GC content")
dev.off()

# Writing sequence data out as a FASTA file
write.fasta(sequences=d, names=getAnnot(d), file.out="analysis/sequence.fna", nbchar=70)

# 
sessionInfo()

