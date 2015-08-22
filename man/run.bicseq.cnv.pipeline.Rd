\name{run.bicseq.cnv.pipeline}
\alias{run.bicseq.cnv.pipeline}
\title{Run the BIC-seq CNV Analysis Pipeline}
\description{Run the BIC-seq CNV analysis pipeline and generate a segmentation file}
\usage{
run.bicseq.cnv.pipeline(tumour, normal, chr = get.bicseq.chr(), bin = 100, lambda = 2, winSize = 200 , quant = 0.95, mult = 1)
}
\arguments{
	\item{tumour}{BAM file from tumour sample}
	\item{normal}{BAM file from normal sample}
	\item{chr}{character vector containing name of chromosomes to review}
	\item{bin}{initial genomic bin size to use, default: 100}
	\item{lambda}{penalty of the BIC, larger lambda gives a smoother profile, default: 2}
	\item{winSize}{window size for outlier detection, default: 200}
	\item{quant}{the probability of the read count quantile, default: 0.95}
	\item{mult}{positive integer, see BICseq HowTo vignette for details, default: 1}
}
\author{Richard de Borja}
\examples{
# ensure consistent results between runs
set.seed(12345);

# create a list of potential locations for the datasets
data.directories <- paste(.libPaths(), '/NGS.Tools.BICseq', sep = '');
data.directories <- c('./', data.directories);

# look in the Rcheck directory to get dataset file
data.directories <- c(getwd(), data.directories);

# search all the locations for the normal file
file.checks <- file.exists(paste(data.directories, 'extdata/normal_sorted.bam', sep = '/'));

# check to see if the file was actually found
if (any(file.checks)) {
	data.directory <- data.directories[order(file.checks, decreasing = TRUE)[1]];
} else {
	stop('Unable to find dataset file for processing');
	}
normal <- paste(data.directory, 'extdata/normal_sorted.bam', sep = '/');

# search all the locations for the normal file
file.checks <- file.exists(paste(data.directories, 'extdata/tumor_sorted.bam', sep = '/'));

# check to see if the file was actually found
if (any(file.checks)) {
	data.directory <- data.directories[order(file.checks, decreasing = TRUE)[1]];
} else {
	stop('Unable to find dataset file for processing');
	}
tumour <- paste(data.directory, 'extdata/tumor_sorted.bam', sep = '/');

bicseq <- run.bicseq.cnv.pipeline(
	normal = normal,
	tumour = tumour,
	chr = c('chr22')
	);
}
\keyword{BICseq}
