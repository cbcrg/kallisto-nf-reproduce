#kallisto-nf-reproduce
This repository contains the software, scripts and data to reproduce the RNA-Seq results decribed in the Nextflow publication.

The repository contains two versions of a tradtional bash style pipeline for Mac and Linux (kallisto-mac and kallisto-linux) as well as the Nextflow version of the pipeline compatible across platforms (kallisto-nf).

## Folder structure

* Folder `R`: contains the `analysis.R` script for determining the overlapping sets
* Folder `kallisto-linux` contains the scripts for running the native (bash), non-Nextflow verion of the pipeline on Linux
* Folder `kallisto-mac` contains the scripts for running the native (bash), non-Nextflow verion of the pipeline on Mac OSX
* Folder `kallisto-nf` contains the Nextflow version of the pipeline for running on any compatible platform


## How to replicate result 

### Clone the repository
kallisto-nf exisits as a git submodule within this repository. To clone the repository, including the submodule, one can include the `--recursive` flag:

    git clone --recursive https://github.com/cbcrg/kallisto-nf-reproduce.git
    cd kallisto-nf-reproduce

### Data
All data is available from the original sources, as well as a compressed tarball (~22GB). 

To download and uncompress the data use  the following command:

    mkdir data
    wget -O- https://zenodo.org/record/159158/files/kallisto_data.tar.gz | tar xz -C data


#### Original Sources
If you wish to retrieve the data from the original sources, you can find it here:
* Reads: All Illumina HiSeq2000 read data can be downloaded from the NCBI SRA GEO: [GSE37703](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE37703).
* Transcriptome: The transcriptome GRCh38 release 79 (cDNA all) is available from the kallisto website [here](http://bio.math.berkeley.edu/kallisto/transcriptomes/).

### Native Linux 

Install [Kallisto](https://pachterlab.github.io/kallisto) version 0.42.4.

Install [Sleuth](https://liorpachter.wordpress.com/2015/08/17/a-sleuth-for-rna-seq/)

Launch the kallisto bash pipeline script running the following command: 

    ./kallisto-linux/kallisto-std.sh \
        data/raw_reads \
    	data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa  \
      	data/exp_info/hiseq_info.txt \
      	results-linux

### Native Mac  

Install [Kallisto](https://pachterlab.github.io/kallisto) version 0.42.4. 

Install [Sleuth](https://liorpachter.wordpress.com/2015/08/17/a-sleuth-for-rna-seq/)

Launch the kallisto bash pipeline script running the following command:

    ./kallisto-mac/kallisto-std.sh \
        data/raw_reads \
        data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa  \
        data/exp_info/hiseq_info.txt \
        results-mac
### Nextflow (Mac & Linux)

Install Nextflow with the following command: 

    export NXF_VER=0.22.0
    curl -fsSL get.nextflow.io | bash

Install Docker following the instruction at [this page](https://docs.docker.com/engine/installation/). 

Pull the Docker images used for this experiment (optional): 

    docker pull cbcrg/kallisto-nf@sha256:9f840127392d04c9f8e39cb72bcd62ff53cfe0492dde02dc3749bf15f1c547f1 

Once the read data has been downloaded from SRA, it is possible to reproduce the Nextflow version of the pipeline from the kallisto-nf directory using the following command:

    nextflow run kallisto-nf/kallisto.nf \
        --reads 'data/raw_reads/SRR4933*_{1,2}.fastq' \
        --transcriptome data/transcriptome/Homo_sapiens.GRCh38.rel79.cdna.all.fa \
        --experiment data/exp_info/hiseq_info.txt \
        --output kallisto-nf-results \
        -with-docker

