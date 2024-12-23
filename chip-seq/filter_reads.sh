#!/bin/bash

module load sambamba

sambamba view -h -f bam -F "[XS] == null and not unmapped and not duplicate" results/alignment/wt_sample2_input_sorted.bam > results/alignment/wt_sample2_input_final.bam

