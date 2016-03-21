#!/bin/bash
#$ -N kallisto-std-sge
#$ -cwd
#$ -q 'cn-el6'
#$ -V
#$ -o /users/cn/efloden/projects/nextflow-kallisto-publication/execution/kallisto-std-uge1/$JOB_ID.out
#$ -e /users/cn/efloden/projects/nextflow-kallisto-publication/execution/kallisto-std-uge1/$JOB_ID.err
#$ -l virtual_free=16G 
#$ -l h_rt=48:00:00

mkdir -p ./uge/kallisto/
./kallisto-std.sh \
    ../data/raw_reads \
    ../data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa  \
    ../data/experiment/hiseq_info.txt \
    kallisto_linux-v0.42.4.bin \
    uge
