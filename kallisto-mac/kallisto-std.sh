#!/bin/bash

# Raw Reads Directory = $1
# Transciptome        = $2
# Experiment          = $3
# Kallisto Binary     = $4
# Output Directory    = $5

# Index the transcriptome
bin/$4 index -i $5/human_GRCh38.idx $2

# Run Kallisto Quantification for each set of fastq files
bin/$4 quant -i $5/human_GRCh38.idx -o $5/kallisto/SRR493366 -b 100 $1/SRR493366_1.fastq $1/SRR493366_2.fastq
bin/$4 quant -i $5/human_GRCh38.idx -o $5/kallisto/SRR493367 -b 100 $1/SRR493367_1.fastq $1/SRR493367_2.fastq
bin/$4 quant -i $5/human_GRCh38.idx -o $5/kallisto/SRR493368 -b 100 $1/SRR493368_1.fastq $1/SRR493368_2.fastq
bin/$4 quant -i $5/human_GRCh38.idx -o $5/kallisto/SRR493369 -b 100 $1/SRR493369_1.fastq $1/SRR493369_2.fastq
bin/$4 quant -i $5/human_GRCh38.idx -o $5/kallisto/SRR493370 -b 100 $1/SRR493370_1.fastq $1/SRR493370_2.fastq
bin/$4 quant -i $5/human_GRCh38.idx -o $5/kallisto/SRR493371 -b 100 $1/SRR493371_1.fastq $1/SRR493371_2.fastq

# Run Slueth
bin/sleuth.R $5/kallisto $3

