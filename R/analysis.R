# Overalps and Venn Diagram Figure for Kallisto+Sleuth Analysis
# Evan Floden
# 20/09/2016

# Load Libraries
library(limma)

# Read in the results files (NOTE: _nf <- Nextflow + Docker Executions)
setwd(".")
linux <- read.delim("gene_table_results_linux.txt")
mac <- read.delim("gene_table_results_mac.txt")
linux_nf <- read.delim("gene_table_results_linux_nf.txt")
mac_nf <- read.delim("gene_table_results_mac_nf.txt")

# Set Column Names
colnames(linux)<-c("ens_gene", "most_sig_transcript.linux","pval.linux", "qval.linux", "num_transcripts.linux", "transcripts.linux")
colnames(mac)<-c("ens_gene", "most_sig_transcript.mac","pval.mac", "qval.mac", "num_transcripts.mac", "transcripts.mac")
colnames(linux_nf)<-c("ens_gene", "most_sig_transcript.linux_nf","pval.linux_nf", "qval.linux_nf", "num_transcripts.linux_nf", "transcripts.linux_nf")
colnames(mac_nf)<-c("ens_gene", "most_sig_transcript.mac_nf","pval.mac", "qval.mac_nf", "num_transcripts.mac_nf", "transcripts.mac_nf")

# Merge on Ensembl GeneIDs
m1=merge(linux,mac,by="ens_gene")
m2=merge(linux_nf,linux_nf,by="ens_gene")

# Create Dataframe of q-values
q_values<-data.frame(m1$ens_gene,m1$qval.linux, m1$qval.mac)
colnames(q_values)<-c("ens_gene", "qval.linux", "qval.mac")

q_values_nf<-data.frame(m2$ens_gene,m2qval.linux_nf,m2$qval.mac_nf)
colnames(q_values_nf)<-c("ens_gene", "qval.linux_nf", "qval.mac_nf")


## Venn Diagram of Q-Values <  1e-2 (Native)
sig.linux <- (q_values$qval.linux <= 1e-2)
sig.mac   <- (q_values$qval.mac   <= 1e-2)
sig.qval  <- cbind(sig.linux, sig.mac)

a <- vennCounts(sig.qval)
vennDiagram(a, circle.col=c("blue", "yellow"), names=c("Amazon Linux Native", "Mac OSX Native"))
vennDiagram(a, title("\n\nOverlap of Significant Genes at with a q-value Cutoff of 0.01\nNativePipeline"))



## Venn Diagram of Q-Values <  1e-2 (Nextflow with Docker)
sig.linux_nf <- (q_values_nf$qval.linux_nf <= 1e-2)
sig.mac_nf   <- (q_values_nf$qval.mac_nf   <= 1e-2)
sig.qval_nf  <- cbind(sig.linux_nf, sig.mac_nf)

b <- vennCounts(sig.qval_nf)
vennDiagram(b, circle.col=c("blue", "yellow"), names=c("Amazon Linux NF", "Mac OSX NF"))
vennDiagram(b, title("\n\nOverlap of Significant Genes at with a q-value Cutoff of 0.01\nNativePipeline"))

