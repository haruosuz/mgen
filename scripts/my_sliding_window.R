
# Set Working Directory
#setwd("~/projects/mgen/")

# Loading seqinr package
library(seqinr)

# Reading sequence data into R
lna <- read.fasta(file = "data/GCA_000027325.1_ASM2732v1_genomic.fna.gz")

cat("# How many sequences\n")
length(lna)

cat("# Get sequence annotations (FASTA headers)\n")
getAnnot(lna)

# Access the n-th element of the list
n <- 1
summary(lna[[n]])

# function
GC.content <- function(x){ y <- table(x); (y["c"] + y["g"]) / sum(y) }
GC.skew <- function(x){ y <- table(x); (y["c"] - y["g"]) / (y["c"] + y["g"]) }
AT.skew <- function(x){ y <- table(x); (y["a"] - y["t"]) / (y["a"] + y["t"]) }

# sliding window
library(zoo)

pdf(file="analysis/plot_sliding_window.pdf")
par(mfcol=c(1,1), cex=1.5, mai = c(1.2, 1.2, 0.1, 0.1)) # c(bottom, left, top, right)

windowsize <- 10000
#windowsize <- round(length(lna[[n]])/20)
x <- seq(from = 1, to = length(lna[[n]])-windowsize, by = windowsize) / 10^6

y <- rollapply(data = lna[[n]], width = windowsize, by = windowsize, FUN = GC.content)
plot(x, y, type="l", xlab="Position", ylab="GC content")
plot(x, 1-y, type="l", xlab="Position", ylab="AT content")

y <- rollapply(data = lna[[n]], width = windowsize, by = windowsize, FUN = GC.skew)
plot(x, y, type="l", xlab="Position", ylab="GC skew"); abline(h = 0)
plot(x, cumsum(y), type="l", xlab="Position", ylab="Cumulative GC skew")

y <- rollapply(data = lna[[n]], width = windowsize, by = windowsize, FUN = AT.skew)
plot(x, y, type="l", xlab="Position", ylab="AT skew"); abline(h = 0)
plot(x, cumsum(y), type="l", xlab="Position", ylab="Cumulative AT skew")

dev.off()

# Print R version and packages
sessionInfo()
