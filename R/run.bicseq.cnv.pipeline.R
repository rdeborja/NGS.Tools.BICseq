run.bicseq.cnv.pipeline <- function(tumour=NULL, normal=NULL, chr = get.bicseq.chr(), bin = 100, lambda = 2, winSize = 200, quant = 0.95, mult = 1) {
  if (is.null(tumour)) stop("Mandatory argument tumour is missing")
  if (is.null(normal)) stop("Mandatory argument normal is missing")
  
  bicseq <- list()
  bicseq$object <- BICseq(
    sample = tumour,
    reference = normal,
    seqNames = chr
    );
  segs <- BICseq::getBICseg(
    object = bicseq$object,
    bin = bin,
    lambda = lambda,
    winSize = winSize,
    quant = quant,
    mult = mult
    );
  bicseq$bins <- BICseq:::getRatios(bin(segs), what = 'bin');
  bicseq$segs <- segs;
  bicseq$seg.summary <- BICseq:::getSummary(segs, correction=TRUE);
  bicseq$seg.summary$seg_length <- bicseq$seg.summary$end - bicseq$seg.summary$start + 1
  return(bicseq);
  }
