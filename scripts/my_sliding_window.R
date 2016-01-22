cat("\n  This R script generates sliding window plots of GC content and GC skew.\n\n")

# Loading packages
library(seqinr)
library(zoo) # rollapply

# Set Working Directory
#setwd("~/projects/mgen/")

# List files in a directory
files <- list.files(path="data", pattern="genomic.fna.gz", full.names=TRUE)

# Reading sequence data into R
lna <- read.fasta(file = files[1], seqtype = c("DNA"))

cat("# How many sequences\n")
length(lna)

# Access the n-th element of the list
n <- 1
summary(lna[[n]])

# sliding window
pdf(file="analysis/Rplots_sliding_window.pdf")
par(mfcol=c(1,1), cex=1.5, mai = c(1.2, 1.2, 0.1, 0.1)) # c(bottom, left, top, right)

windowsize <- 10000
x <- seq(from = 1, to = length(lna[[n]])-windowsize, by = windowsize) / 10^6
xlab <- "Position (Mbp)"

y <- rollapply(data = lna[[n]], width = windowsize, by = windowsize, FUN = GC)
plot(x, y, type="l", xlab=xlab, ylab="GC content")

GC.skew <- function(x){ y <- table(x); (y["c"] - y["g"]) / (y["c"] + y["g"]) }
y <- rollapply(data = lna[[n]], width = windowsize, by = windowsize, FUN = GC.skew)
plot(x, y, type="l", xlab=xlab, ylab="GC skew"); abline(h = 0)
plot(x, cumsum(y), type="l", xlab=xlab, ylab="Cumulative GC skew")

dev.off()

# Print R version and packages
sessionInfo()
