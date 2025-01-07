# Scripts to perform Chip-seq analysis with Bowtie2 and MACS2.


## STEPS:

- Quality control of sequencing data with FastQC. Generate and check html reports. 

- Alignment of the sequencing reads to the reference genome. Output (with Bowtie2): SAM file. Script: alignment.slm

- Transform SAM to a ordered BAM file using Samtools. Script: alignment.slm

- Filtering BAM file (reads) using sambamba. Remove mulitple and duplicate reads. Keep only uniquely mapping reads. Script: filter_reads.sh

- Peak calling using MACS2. Script: peak_calling.slm

- Use of bedtools to handle chip-seq data. Script: bedtools.sh

- Peak visualization. Create Bigwig files for continuous data. Script: create_bigwigs.slm


Script fastq_to_bam.slm is an automized workflow from the quality control to the filtering steps to process multiple samples. 

 


