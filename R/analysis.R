# Read in the results files

local <- read.delim("~/projects/nextflow-kallisto-publication/analysis/local_std_final_gene_table_results.txt")
uge <- read.delim("~/projects/nextflow-kallisto-publication/analysis/uge_std_final_gene_table_results.txt")
mac <- read.delim("~/projects/nextflow-kallisto-publication/analysis/mac_std_final_gene_table_results.txt")

local_nf <- read.delim("~/projects/nextflow-kallisto-publication/analysis/local_nf_final_gene_table_results.txt")
uge_nf <- read.delim("~/projects/nextflow-kallisto-publication/analysis/uge_nf_final_gene_table_results.txt")
mac_nf <- read.delim("~/projects/nextflow-kallisto-publication/analysis/mac_nf_final_gene_table_results.txt")

colnames(local)<-c("ens_gene", "most_sig_transcript.local","pval.local", "qval.local", "num_transcripts.local", "transcripts.local")
colnames(mac)<-c("ens_gene", "most_sig_transcript.mac","pval.mac", "qval.mac", "num_transcripts.mac", "transcripts.mac")
colnames(uge)<-c("ens_gene", "most_sig_transcript.uge","pval.uge", "qval.uge", "num_transcripts.uge", "transcripts.uge")


colnames(local_nf)<-c("ens_gene", "most_sig_transcript.local","pval.local", "qval.local", "num_transcripts.local", "transcripts.local")
colnames(mac_nf)<-c("ens_gene", "most_sig_transcript.mac","pval.mac", "qval.mac", "num_transcripts.mac", "transcripts.mac")
colnames(uge_nf)<-c("ens_gene", "most_sig_transcript.uge","pval.uge", "qval.uge", "num_transcripts.uge", "transcripts.uge")

m1=merge(local,mac,by="ens_gene")
m2=merge(m1,uge, by="ens_gene")

m3=merge(local_nf,mac_nf,by="ens_gene")
m4=merge(m3,uge_nf, by="ens_gene")

q_values_std<-data.frame(m2$ens_gene,m2$qval.local,m2$qval.mac,m2$qval.uge)
colnames(q_values_std)<-c("ens_gene", "qval.local", "qval.mac", "qval.uge")

q_values_nf<-data.frame(m4$ens_gene,m4$qval.local,m4$qval.mac,m4$qval.uge)
colnames(q_values_nf)<-c("ens_gene", "qval.local", "qval.mac", "qval.uge")



## Traditional Bash PIPELINE

# Venn Diagram of Q-Values <  1e-2
library(limma)
sig.local <- (q_values_std$qval.local <= 1e-2)
sig.uge   <- (q_values_std$qval.uge   <= 1e-2)
sig.mac   <- (q_values_std$qval.mac   <= 1e-2)
sig.qval  <- cbind(sig.local, sig.uge, sig.mac)
a <- vennCounts(sig.qval)
vennDiagram(a, circle.col=c("red", "blue", "green"), names=c("Local Linux", "UGE Cluster", "Local Mac"))
vennDiagram(a, title("\n\nOverlap of Significant Genes at with a Cutoff of 0.01\nTraditional Bash Pipeline"))

# Venn Diagram of Q-Values <  1e11
library(limma)
sig.local <- (q_values_std$qval.local <= 1e-11)
sig.uge   <- (q_values_std$qval.uge   <= 1e-11)
sig.mac   <- (q_values_std$qval.mac   <= 1e-11)
sig.qval  <- cbind(sig.local, sig.uge, sig.mac)
b <- vennCounts(sig.qval)
vennDiagram(b, circle.col=c("red", "blue", "green"), names=c("Local Linux", "UGE Cluster", "Local Mac"))
vennDiagram(b, title("\n\nOverlap of Significant Genes at with a Cutoff of 1e-11\nTraditional Bash Pipeline"))


# Venn Diagram of Q-Values <  1e-130
sig.local <- (q_values_std$qval.local <= 1e-130)
sig.uge   <- (q_values_std$qval.uge   <= 1e-130)
sig.mac   <- (q_values_std$qval.mac   <= 1e-130)
sig.qval  <- cbind(sig.local, sig.uge, sig.mac)
c <- vennCounts(sig.qval)
vennDiagram(c, circle.col=c("red", "blue", "green"), names=c("Local Linux", "UGE Cluster", "Local Mac"))
vennDiagram(c, title("\n\nOverlap of Significant Genes at with a Cutoff of 1e-130\nTraditional Bash Pipeline"))



## NEXTFLOW PIPELINE

# Venn Diagram of Q-Values <  1e-2
library(limma)
sig.local <- (q_values_nf$qval.local <= 1e-2)
sig.uge   <- (q_values_nf$qval.uge   <= 1e-2)
sig.mac   <- (q_values_nf$qval.mac   <= 1e-2)
sig.qval  <- cbind(sig.local, sig.uge, sig.mac)
a <- vennCounts(sig.qval)
vennDiagram(a, circle.col=c("red", "blue", "green"), names=c("Local Linux", "UGE Cluster", "Local Mac"))
vennDiagram(a, title("\n\nOverlap of Significant Genes at with a Cutoff of 0.01\nNextflow Pipeline"))

# Venn Diagram of Q-Values <  1e10
library(limma)
sig.local <- (q_values_nf$qval.local <= 1e-10)
sig.uge   <- (q_values_nf$qval.uge   <= 1e-10)
sig.mac   <- (q_values_nf$qval.mac   <= 1e-10)
sig.qval  <- cbind(sig.local, sig.uge, sig.mac)
b <- vennCounts(sig.qval)
vennDiagram(b, circle.col=c("red", "blue", "green"), names=c("Local Linux", "UGE Cluster", "Local Mac"))
vennDiagram(b, title("\n\nOverlap of Significant Genes at with a Cutoff of 1e-10\nNextflow Pipeline"))


# Venn Diagram of Q-Values <  1e-130
sig.local <- (q_values_nf$qval.local <= 1e-130)
sig.uge   <- (q_values_nf$qval.uge   <= 1e-130)
sig.mac   <- (q_values_nf$qval.mac   <= 1e-130)
sig.qval  <- cbind(sig.local, sig.uge, sig.mac)
c <- vennCounts(sig.qval)
vennDiagram(c, circle.col=c("red", "blue", "green"), names=c("Local Linux", "UGE Cluster", "Local Mac"))
vennDiagram(c, title("\n\nOverlap of Significant Genes at with a Cutoff of 1e-130\nNextflow Pipeline"))







# Pairwise Comparisons
q_values$local.vs.mac <- ( q_values$qval.local - q_values$qval.mac)
q_values$local.vs.uge <- ( q_values$qval.local - q_values$qval.uge)
q_values$mac.vs.uge   <- ( q_values$qval.mac   - q_values$qval.uge)



uge_ranks <- read.csv("~/projects/nextflow-kallisto-publication/analysis/uge_ranks.csv", sep=",")
local_ranks <- read.csv("~/projects/nextflow-kallisto-publication/analysis/local_ranks.csv", sep="\t")
mac_ranks <- read.csv("~/projects/nextflow-kallisto-publication/analysis/mac_ranks.csv", sep="\t")

local_vs_mac_ranks <- merge(local_ranks, mac_ranks, by="ens_gene")
local_vs_mac_ranks$diff<- (local_vs_mac_ranks$local.rank - local_vs_mac_ranks$mac.rank)
rankA<-local_vs_mac_ranks[with(local_vs_mac_ranks, order(local_vs_mac_ranks$diff)),]
rankB<-local_vs_mac_ranks[with(local_vs_mac_ranks, order(-local_vs_mac_ranks$diff)),]

View(rankA)

### Analaysis April 4

linux <- read.delim("~/projects/kallisto-nf-reproduce/R/gene_table_results_linux.csv", header=FALSE, dec=",")
mac <- read.delim("~/projects/kallisto-nf-reproduce/R/gene_table_results_mac.csv", header=FALSE, dec=",")

colnames(linux)<-c("", "ens_gene", "most_sig_transcript.linux","pval.linux", "qval.linux", "num_transcripts.linux", "transcripts.linux")
colnames(mac)<-c("", "ens_gene", "most_sig_transcript.mac","pval.mac", "qval.mac", "num_transcripts.mac", "transcripts.mac")

m1=merge(linux,mac,by="ens_gene")
p_values<-data.frame(m1$ens_gene,m1$pval.linux,m1$pval.mac)
p_values[, 2] <- as.numeric(as.character( p_values[, 2] ))
p_values[, 3] <- as.numeric(as.character( p_values[, 3] ))
colnames(p_values)<-c("ens_gene", "pval.linux", "pval.mac")

# Venn Diagram of Q-Values <  1e-2
library(limma)
sig.linux <- (p_values$pval.linux <= 1e-2)
sig.mac   <- (p_values$pval.mac   <= 1e-2)
sig.pval  <- cbind(sig.linux, sig.mac)
a <- vennCounts(sig.pval)
vennDiagram(a, circle.col=c("red", "blue"), names=c("Linux", "Mac OSX"))
vennDiagram(a, title("\n\nOverlap of Significant Genes at with a Cutoff of 0.01\nTraditional Bash Pipeline"))
