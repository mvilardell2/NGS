#!/bin/bash

#SBATCH --job-name=sra_to_fastq
#SBATCH --output=sra_to_fastq_%j.log
#SBATCH --error=sra_to_fastq_%j.err
#SBATCH --time=05:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4       # Use 1 if single-threaded, or up to 8 for multi-threaded
#SBATCH --mem=4GB     



## Download sequencing public data (FASTQ files) from SRA

SECONDS=0

# Load module (SRA TOOLKIT)
module load sratoolkit

#####################################################
# 1. Download the runs (SRA format):
echo "Downloading SRA files"

prefetch --option-file sra_list.txt 

echo "Completed dowloading all samples runs at $(date)"
#####################################################
# 2. From SRA format to FASTQ: 

# Define the list file: 
SRA_LIST="sra_list.txt"

# Move to each sample run folder and change the format:

for SAMPLE_NAME in $(cat "$SRA_LIST"); do
        
    echo "Processing sample: $SAMPLE_NAME"
     
    # Move to the directory
    cd ${SAMPLE_NAME}

    fasterq-dump --split-files "${SAMPLE_NAME}.sra"
    gzip "${SAMPLE_NAME}"*.fastq

    cd ..
    
    # End log
    echo "Completed sample: ${SAMPLE_NAME} at $(date)"
       

done	



duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds"


