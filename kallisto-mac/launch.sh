mkdir -p ./mac/kallisto/
./kallisto-std.sh \
    ../data/raw_reads \
    ../data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa  \
    ../data/experiment/hiseq_info.txt \
    kallisto_mac-v0.42.4.bin \
    mac
