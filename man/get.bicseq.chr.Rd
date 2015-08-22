\name{get.bicseq.chr}
\alias{get.bicseq.chr}
\title{Get a list of chromosomes to process using BIC-seq}
\description{Get a list of chromosomes to process using BIC-seq}
\usage{get.bicseq.chr(reftype='b37')}
\arguments{
  \item{reftype}{Reference genome type.  This determines whether the reference genome contains chrN by using reftype='ucsc'.}
}
\author{Richard de Borja}
\examples{
chr <- get.bicseq.chr(reftype='b37')
}
\keyword{BICseq}
\keyword{run.bicseq.cnv.pipeline}
