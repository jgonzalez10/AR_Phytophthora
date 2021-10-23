#!/bin/sh

#!/bin/bash

#Specify the parameters for the run

#PBS -N SmallRNAsAR
#PBS -l walltime=24:00:00
#PBS -l mem=60g
#PBS -l nodes=1:ppn=8
#PBS -M j.gonzalez10@uniandes.edu.co
#PBS -m abe
#PBS -A SmallRNAsAR

#Indicate the folder where you have the initial files

cd /hpcfs/home/j.gonzalez10/SmallRNAsAcquiredResistance

#Change data names to more comprehensible ones

printf "\nChanging data names\n"

cp RC1-0-1_S13_L005_R1_001.fastq RC1-0-1.fastq
cp RC1-0-2_S7_L005_R1_001.fastq RC1-0-2.fastq
cp RC1-0-3_S1_L005_R1_001.fastq RC1-0-3.fastq
cp RC1-100-1_S14_L005_R1_001.fastq RC1-100-1.fastq
cp RC1-100-2_S8_L005_R1_001.fastq RC1-100-2.fastq
cp RC1-100-3_S2_L005_R1_001.fastq RC1-100-3.fastq
cp US22-0-1_S15_L005_R1_001.fastq US22-0-1.fastq
cp US22-0-2_S9_L005_R1_001.fastq US22-0-2.fastq
cp US22-0-3_S3_L005_R1_001.fastq US22-0-3.fastq
cp US22-100-1_S16_L005_R1_001.fastq US22-100-1.fastq
cp US22-100-2_S10_L005_R1_001.fastq US22-100-2.fastq
cp US22-100-3_S4_L005_R1_001.fastq US22-100-3.fastq
cp US23-0-1_S17_L005_R1_001.fastq US23-0-1.fastq
cp US23-0-2_S11_L005_R1_001.fastq US23-0-2.fastq
cp US23-0-3_S5_L005_R1_001.fastq US23-0-3.fastq
cp US23-100-1_S18_L005_R1_001.fastq US23-100-1.fastq
cp US23-100-2_S12_L005_R1_001.fastq US23-100-2.fastq
cp US23-100-3_S6_L005_R1_001.fastq US23-100-3.fastq

printf "\nPre processing raw data\n"
printf "\nEliminating the adapter, trimming low quality bases and selecting by size between 18 and 45 bp\n"

module load cutadapt/1.12

cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o RC1-0-1-cut.fastq RC1-0-1.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o RC1-0-2-cut.fastq RC1-0-2.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o RC1-0-3-cut.fastq RC1-0-3.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o RC1-100-1-cut.fastq RC1-100-1.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o RC1-100-2-cut.fastq RC1-100-2.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o RC1-100-3-cut.fastq RC1-100-3.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US22-0-1-cut.fastq US22-0-1.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US22-0-2-cut.fastq US22-0-2.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US22-0-3-cut.fastq US22-0-3.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US22-100-1-cut.fastq US22-100-1.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US22-100-2-cut.fastq US22-100-2.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US22-100-3-cut.fastq US22-100-3.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US23-0-1-cut.fastq US23-0-1.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US23-0-2-cut.fastq US23-0-2.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US23-0-3-cut.fastq US23-0-3.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US23-100-1-cut.fastq US23-100-1.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US23-100-2-cut.fastq US23-100-2.fastq
cutadapt --minimum-length 18 --maximum-length 51 --discard-untrimmed -a TGGAATTCTCGGGTGCCAAGG -u -1 -o US23-100-3-cut.fastq US23-100-3.fastq


printf "\nTesting for data quality\n"

module load fastqc/0.11.2

fastqc RC1-0-1-cut.fastq
fastqc RC1-0-2-cut.fastq
fastqc RC1-0-3-cut.fastq
fastqc RC1-100-1-cut.fastq
fastqc RC1-100-2-cut.fastq
fastqc RC1-100-3-cut.fastq
fastqc US22-0-1-cut.fastq
fastqc US22-0-2-cut.fastq
fastqc US22-0-3-cut.fastq
fastqc US22-100-1-cut.fastq
fastqc US22-100-2-cut.fastq
fastqc US22-100-1-cut.fastq
fastqc US23-0-1-cut.fastq
fastqc US23-0-2-cut.fastq
fastqc US23-0-3-cut.fastq
fastqc US23-100-1-cut.fastq
fastqc US23-100-2-cut.fastq
fastqc US23-100-3-cut.fastq


printf "\nEliminating rRNA sequences\n"

module load bowtie/1.1.2

bowtie-build -f rRNA_Ensembl.txt rRNA

bowtie rRNA RC1-0-1-cut.fastq -S RC1-0-1-rRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-0-1-norRNA.fq
bowtie rRNA RC1-0-2-cut.fastq -S RC1-0-2-rRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-0-2-norRNA.fq
bowtie rRNA RC1-0-3-cut.fastq -S RC1-0-3-rRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-0-3-norRNA.fq
bowtie rRNA RC1-100-1-cut.fastq -S RC1-100-1-rRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-100-1-norRNA.fq
bowtie rRNA RC1-100-2-cut.fastq -S RC1-100-2-rRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-100-2-norRNA.fq
bowtie rRNA RC1-100-3-cut.fastq -S RC1-100-3-rRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-100-3-norRNA.fq
bowtie rRNA US22-0-1-cut.fastq -S US22-0-1-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-0-1-norRNA.fq
bowtie rRNA US22-0-2-cut.fastq -S US22-0-2-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-0-2-norRNA.fq
bowtie rRNA US22-0-3-cut.fastq -S US22-0-3-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-0-3-norRNA.fq
bowtie rRNA US22-100-1-cut.fastq -S US22-100-1-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-100-1-norRNA.fq
bowtie rRNA US22-100-2-cut.fastq -S US22-100-2-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-100-2-norRNA.fq
bowtie rRNA US22-100-3-cut.fastq -S US22-100-3-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-100-3-norRNA.fq
bowtie rRNA US23-0-1-cut.fastq -S US23-0-1-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-0-1-norRNA.fq
bowtie rRNA US23-0-2-cut.fastq -S US23-0-2-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-0-2-norRNA.fq
bowtie rRNA US23-0-3-cut.fastq -S US23-0-3-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-0-3-norRNA.fq
bowtie rRNA US23-100-1-cut.fastq -S US23-100-1-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-100-1-norRNA.fq
bowtie rRNA US23-100-2-cut.fastq -S US23-100-2-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-100-2-norRNA.fq
bowtie rRNA US23-100-3-cut.fastq -S US23-100-3-rRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-100-3-norRNA.fq

printf "\nEliminating tRNA sequences\n"

bowtie-build -f tRNA_Ensembl.txt tRNA

bowtie tRNA RC1-0-1-norRNA.fq -S RC1-0-1-tRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-0-1-notRNA.fq
bowtie rRNA RC1-0-2-norRNA.fq -S RC1-0-2-tRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-0-2-notRNA.fq
bowtie rRNA RC1-0-3-norRNA.fq -S RC1-0-3-tRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-0-3-notRNA.fq
bowtie rRNA RC1-100-1-norRNA.fq -S RC1-100-1-tRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-100-1-notRNA.fq
bowtie rRNA RC1-100-2-norRNA.fq -S RC1-100-2-tRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-100-2-notRNA.fq
bowtie rRNA RC1-100-3-norRNA.fq -S RC1-100-3-tRNA.sam -t -q -v 0 -k 1 -p 8 --un RC1-100-3-notRNA.fq
bowtie rRNA US22-0-1-norRNA.fq -S US22-0-1-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-0-1-notRNA.fq
bowtie rRNA US22-0-2-norRNA.fq -S US22-0-2-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-0-2-notRNA.fq
bowtie rRNA US22-0-3-norRNA.fq -S US22-0-3-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-0-3-notRNA.fq
bowtie rRNA US22-100-1-norRNA.fq -S US22-100-1-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-100-1-notRNA.fq
bowtie rRNA US22-100-2-norRNA.fq -S US22-100-2-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-100-2-notRNA.fq
bowtie rRNA US22-100-3-norRNA.fq -S US22-100-3-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US22-100-3-notRNA.fq
bowtie rRNA US23-0-1-norRNA.fq -S US23-0-1-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-0-1-notRNA.fq
bowtie rRNA US23-0-2-norRNA.fq -S US23-0-2-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-0-2-notRNA.fq
bowtie rRNA US23-0-3-norRNA.fq -S US23-0-3-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-0-3-notRNA.fq
bowtie rRNA US23-100-1-norRNA.fq -S US23-100-1-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-100-1-notRNA.fq
bowtie rRNA US23-100-2-norRNA.fq -S US23-100-2-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-100-2-notRNA.fq
bowtie rRNA US23-100-3-norRNA.fq -S US23-100-3-tRNA.sam -t -q -v 0 -k 1 -p 8 --un US23-100-3-notRNA.fq


printf "\nAligning processed reads to the Phytophthora infestans  genome\n"

bowtie-build -f Phytophthora_infestans.fa Pinf

bowtie Pinf RC1-0-1-notRNA.fq -S RC1-0-1-Pinfestans.sam -t -q -v 1 -k 1 -p 8 
bowtie Pinf RC1-0-2-notRNA.fq -S RC1-0-2-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf RC1-0-3-notRNA.fq -S RC1-0-3-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf RC1-100-1-notRNA.fq -S RC1-100-1-Pinfestans.sam -t -q -v 1 -k 1 -p 8          
bowtie Pinf RC1-100-2-notRNA.fq -S RC1-100-2-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf RC1-100-3-notRNA.fq -S RC1-100-3-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US22-0-1-notRNA.fq -S US22-0-1-Pinfestans.sam -t -q -v 1 -k 1 -p 8          
bowtie Pinf US22-0-2-notRNA.fq -S US22-0-2-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US22-0-3-notRNA.fq -S US22-0-3-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US22-100-1-notRNA.fq -S US22-100-1-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US22-100-2-notRNA.fq -S US22-100-2-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US22-100-3-notRNA.fq -S US22-100-3-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US23-0-1-notRNA.fq -S US23-0-1-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US23-0-2-notRNA.fq -S US23-0-2-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US23-0-3-notRNA.fq -S US23-0-3-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US23-100-1-notRNA.fq -S US23-100-1-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US23-100-2-notRNA.fq -S US23-100-2-Pinfestans.sam -t -q -v 1 -k 1 -p 8
bowtie Pinf US23-100-3-notRNA.fq -S US23-100-3-Pinfestans.sam -t -q -v 1 -k 1 -p 8

printf "\nGenerating count tables with HT-Seq\n"

module load htseq/0.6.1p1

htseq-count -s no -t exon -i gene_id -o RC1-0-1-count.sam RC1-0-1-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > RC1-0-1-count
htseq-count -s no -t exon -i gene_id -o RC1-0-2-count.sam RC1-0-2-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > RC1-0-2-count
htseq-count -s no -t exon -i gene_id -o RC1-0-3-count.sam RC1-0-3-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > RC1-0-3-count
htseq-count -s no -t exon -i gene_id -o RC1-100-1-count.sam RC1-100-1-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > RC1-100-1-count
htseq-count -s no -t exon -i gene_id -o RC1-100-2-count.sam RC1-100-2-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > RC1-100-2-count
htseq-count -s no -t exon -i gene_id -o RC1-100-3-count.sam RC1-100-3-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > RC1-100-3-count
htseq-count -s no -t exon -i gene_id -o US22-0-1-count.sam US22-0-1-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US22-0-1-count
htseq-count -s no -t exon -i gene_id -o US22-0-2-count.sam US22-0-2-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US22-0-2-count
htseq-count -s no -t exon -i gene_id -o US22-0-3-count.sam US22-0-3-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US22-0-3-count
htseq-count -s no -t exon -i gene_id -o US22-100-1-count.sam US22-100-1-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US22-100-1-count
htseq-count -s no -t exon -i gene_id -o US22-100-2-count.sam US22-100-2-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US22-100-2-count
htseq-count -s no -t exon -i gene_id -o US22-100-3-count.sam US22-100-3-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US22-100-3-count
htseq-count -s no -t exon -i gene_id -o US23-0-1-count.sam US23-0-1-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US23-0-1-count
htseq-count -s no -t exon -i gene_id -o US23-0-2-count.sam US23-0-2-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US23-0-2-count
htseq-count -s no -t exon -i gene_id -o US23-0-3-count.sam US23-0-3-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US23-0-3-count
htseq-count -s no -t exon -i gene_id -o US23-100-1-count.sam US23-100-1-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US23-100-1-count
htseq-count -s no -t exon -i gene_id -o US23-100-2-count.sam US23-100-2-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US23-100-2-count
htseq-count -s no -t exon -i gene_id -o US23-100-3-count.sam US23-100-3-Pinfestans.sam Pinfestans_definitivo_20172.gtf.txt > US23-100-3-count











