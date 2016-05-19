# kallisto-nf-reproduce
This repository contains the software, scripts and data to reproduce the RNA-Seq results decribed in the Nextflow publication.

The repository contains two versions of a tradtional bash style pipeline for Mac and Linux (kallisto-mac and kallisto-linux) as well as the Nextflow version of the pipeline compatible across platforms (kallisto-nf).


## Cloning the repository
kallisto-nf exisits as a git submodule within this repository. To clone the repository, including the submodule, one can include the `--recursive` flag:

    git clone --recursive git://github.com/skptic/kallisto-nf-reproduce

If you have previously cloned the repository without `--recursive`, you can can include the submodule using:

    cd kallisto-nf
    git submodule update --init --recursive


## Data
The same data is used across all implementations.
* Reads: All Illumina HiSeq2000 read data can be downloaded from the NCBI SRA GEO: [GSE37703](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE37703).
* Transcriptome: The transcriptome GRCh38 release 79 is available in the data directory.
* Experiment:  The exoerimental design describing the samples within each group is availible in the data directory.

## Reproduction

###Nextflow Version

Once the read data has been downloaded from SRA, it is possible to reproduce the Nextflow version of the pipeline using the following command from the kallisto-nf directory:
    
    nextflow run cbcrg/kallisto-nf --reads='../data/raw_reads/SRR4933*_{1,2}.fastq' \
                                   --transcriptome='../data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa' \
                                   --experiment='../data/experiment/hiseq_info.txt' \
                                   --output='kallisto-nf-results' \
                                   -with-docker

###Traditional Version
To reproduce the traditional bash pipeline on Mac and Linux from the respecitive directories (kallisto-linux and kallisto-mac)
