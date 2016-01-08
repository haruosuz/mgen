
# Set Working Directory
#setwd("~/projects/mgen/")

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
lna <- read.fasta(file = "data/GCA_000027325.1_ASM2732v1_genomic.fna.gz")

# Writing sequence data out as a FASTA file
write.fasta(sequences=lna, names=getName(lna), file.out="analysis/sequence.fasta", nbchar=70)

cat("# How many sequences\n")
length(lna)

# Access the 1st element of the list
dna <- lna[[1]]

cat("# Length of a DNA sequence\n")
length(dna)

cat("# Base composition of a DNA sequence\n")
( x <- table(dna) )
x / sum(x)
cat("# GC Content\n")
(x["g"] + x["c"]) / sum(x)
#GC(s2c("acgt")) # 0.5
GC(dna)

# k-mer words
cat("# Dinucleotide counts\n")
#count(s2c("atg"), 2) # "at" and "tg"
count(dna, 2)
# http://www.ncbi.nlm.nih.gov/pmc/articles/PMC17754/figure/F1/
cat("# Dinucleotide relative abundances (Rho)\n")
rho(dna, 2)

cat("# Local variation in GC content\n")
GC(dna[1:100000])
GC(dna[100001:200000])
GC(dna[200001:300000])
GC(dna[300001:400000])
GC(dna[400001:500000])
GC(dna[500001:580076])

library(zoo)
cat("# A sliding window analysis of GC content\n")
rollapply(data = dna, width = 100000, by = 100000, FUN = GC)

# A sliding window plot of GC content
windowsize <- 10000
x <- seq(from = 1, to = length(dna)-windowsize, by = windowsize) / 10^6
y <- rollapply(data = dna, width = windowsize, by = windowsize, FUN = GC)
pdf(file="analysis/plot.pdf")
par(mfcol=c(1,1), cex=1.5, mai = c(1.2, 1.2, 0.1, 0.1)) # c(bottom, left, top, right)
plot(x, y, type="l", xlab="Position (Mbp)", ylab="GC content")
dev.off()

# Print R version and packages
sessionInfo()
