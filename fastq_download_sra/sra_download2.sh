#!/bin/bash

# Load module (SRA TOOLKIT)
module load sratoolkit

# File containing the list of SRA samples
SRA_LIST="sra_list.txt"

# Start overall timer
SECONDS=0

for SAMPLE_NAME in $(cat "$SRA_LIST"); do
    
    # Start sample timer
    SAMPLE_START=$SECONDS    

    echo "Processing sample: $SAMPLE_NAME"
    
    # Download the SRA file and convert to FASTQ
    fasterq-dump --split-files "${SAMPLE_NAME}" 

    # Compress the resulting FASTQ files
     gzip "${SAMPLE_NAME}"*.fastq
    
    # Calculate time for this sample
    SAMPLE_DURATION=$((SECONDS - SAMPLE_START))
    
    # End log for this sample
    echo "Completed sample: ${SAMPLE_NAME} at $(date)"
    echo "$(($SAMPLE_DURATION / 60)) minutes and $(($SAMPLE_DURATION % 60)) seconds"
    
done

# Calculate and print total elapsed time
TOTAL_DURATION=$SECONDS
echo "Total time: $(($TOTAL_DURATION / 60)) minutes and $(($TOTAL_DURATION % 60)) seconds"

