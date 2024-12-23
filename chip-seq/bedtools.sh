#!/bin/bash

# Load module
module load bedtools2-2.30.0-gcc-11.2.0-q7z4zez

# Run bedtools command
bedtools intersect -v -a macs2/wt_sample2_fixed_peaks.narrowPeak -b ../reference_genome/mm10-blacklist.v2.bed > macs2/wt_sample2_peaks_filtered.bed

