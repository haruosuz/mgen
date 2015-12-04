
# Set Working Directory
#setwd("~/projects/mgen/")

#install.packages("seqinr")
# Loading seqinr package
library(seqinr)

# List files in a directory
files <- list.files(path="data", pattern="\\.gz", full.names=TRUE)
lnt <- read.fasta(file = files[1]) # data/GCA_000027325.1_ASM2732v1_genomic.fna.gz

# Writing sequence data out as a FASTA file
write.fasta(sequences=lnt, names=getName(lnt), file.out="analysis/sequence.fasta", nbchar=70)

cat("# How many sequences\n")
length(lnt)

# Access the first element of the list
nt <- lnt[[1]]

cat("# Length of a DNA sequence\n")
length(nt)

cat("# Base composition of a DNA sequence\n")
( x <- table(nt) )
x / sum(x)

cat("# GC Content of DNA\n")
(x["g"] + x["c"]) / sum(x)
#GC(s2c("acgt")) # 0.5
GC(nt)

# DNA words
cat("# Dinucleotide counts\n")
#count(s2c("atg"), 2) # "at" and "tg"
count(nt, 2)
# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC17754/figure/F1/
cat("# Dinucleotide relative abundances (Rho)\n")
rho(nt, 2)

cat("# Local variation in GC content\n")
GC(nt[1:100000])
GC(nt[100001:200000])
GC(nt[200001:300000])
GC(nt[300001:400000])
GC(nt[400001:500000])
GC(nt[500001:580076])

library(zoo)
cat("# A sliding window analysis of GC content\n")
rollapply(data = nt, width = 100000, by = 100000, FUN = GC)

# A sliding window plot of GC content
pdf(file="analysis/plot.pdf")
windowsize <- 10000
x <- seq(from = 1, to = length(nt)-windowsize, by = windowsize)
y <- rollapply(data = nt, width = windowsize, by = windowsize, FUN = GC)
plot(x, y, type="l", xlab="Position (bp)", ylab="GC content")
dev.off()

# Print R version and packages
sessionInfo()

