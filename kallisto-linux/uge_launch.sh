#!/bin/bash
#$ -N kallisto-std-sge
#$ -cwd
#$ -q 'cn-el6'
#$ -V
#$ -o ./$JOB_ID.out
#$ -e ./$JOB_ID.err
#$ -l virtual_free=16G 
#$ -l h_rt=48:00:00

mkdir -p ./linux/kallisto/
./kallisto-std.sh \
    ../data/raw_reads \
    ../data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa  \
    ../data/experiment/hiseq_info.txt \
    kallisto_linux-v0.42.4.bin \
    linux
