#!/bin/bash

# Raw Reads Directory = $1
# Transciptome        = $2
# Experiment          = $3
# Output Directory    = $4

# Index the transcriptome
kallisto index -i $4/human_GRCh38.idx $2

# Run Kallisto Quantification for each set of fastq files
kallisto quant -i $4/human_GRCh38.idx -o $4/kallisto/SRR493366 -b 100 $1/SRR493366_1.fastq $1/SRR493366_2.fastq
kallisto quant -i $4/human_GRCh38.idx -o $4/kallisto/SRR493367 -b 100 $1/SRR493367_1.fastq $1/SRR493367_2.fastq
kallisto quant -i $4/human_GRCh38.idx -o $4/kallisto/SRR493368 -b 100 $1/SRR493368_1.fastq $1/SRR493368_2.fastq
kallisto quant -i $4/human_GRCh38.idx -o $4/kallisto/SRR493369 -b 100 $1/SRR493369_1.fastq $1/SRR493369_2.fastq
kallisto quant -i $4/human_GRCh38.idx -o $4/kallisto/SRR493370 -b 100 $1/SRR493370_1.fastq $1/SRR493370_2.fastq
kallisto quant -i $4/human_GRCh38.idx -o $4/kallisto/SRR493371 -b 100 $1/SRR493371_1.fastq $1/SRR493371_2.fastq

# Run Slueth
sleuth.R $4/kallisto $3

