### run_bicseq.R ####################################################################################
# Run the BICSeq pipeline at the command line using Rscript.

### HISTORY #######################################################################################
# Version           Date            Developer               Comments
# 0.01              2014-07-08      rdeborja                initial development

### PREAMBLE ######################################################################################
library('getopt')

usage <- function() {
    usage.text <- '\nUsage: script.R --normal normal.bam --tumour tumour.bam\n\n';
    return(usage.text)
    }

params = matrix(
    c(
    	'tumour', 't', 1, 'character',
    	'normal', 'n', 1, 'character'
    	),
    ncol = 4,
    byrow = TRUE
    )

opt = getopt(params)

# verify arguments
if(is.null(opt)) { stop(usage()) }

# Set the environment
library(plotting.general)
library(NGS.Tools.BICseq)

### FUNCTIONS #####################################################################################

### GET DATA ######################################################################################

### PROCESS DATA ##################################################################################

bicseq <- NGS.Tools.BICseq::run.bicseq.cnv.pipeline(
	normal = opt$normal,
	tumour = opt$tumour
	)
save(bicseq, file = 'bicseq_data.rda')

### ANALYSIS ######################################################################################

### PLOTTING ######################################################################################

