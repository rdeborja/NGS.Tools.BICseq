library('testthat');

# load BAM example files
normal.bam <- system.file('inst/example/normal_sorted.bam', package = 'run.bicseq.cnv.pipeline');
tumour.bam <- system.file('inst/example/tumor_sorted.bam', package = 'run.bicseq.cnv.pipeline');

# run the pipeline and generate a CNV segment summary
seg.summary <- run.bicseq.cnv.pipeline(tumour = tumour.bam, normal = normal.bam, chr = c('chr22'));
