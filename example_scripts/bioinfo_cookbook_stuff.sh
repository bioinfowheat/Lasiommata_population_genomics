# walk through list of files and change their name

# testing the renameing script so we don't damage the files we love
for file in *.zip ; do echo $file $(echo $file |sed 's/\.fastq\.ctq20\.fq_fastqc/_ctq20/g'); done
# looks great

P25152_101_S51_L003_R1_001.fastq.ctq20.fq_fastqc.zip P25152_101_S51_L003_R1_001_ctq20.zip
P25152_101_S51_L003_R2_001.fastq.ctq20.fq_fastqc.zip P25152_101_S51_L003_R2_001_ctq20.zip
P25152_102_S52_L003_R1_001.fastq.ctq20.fq_fastqc.zip P25152_102_S52_L003_R1_001_ctq20.zip
P25152_102_S52_L003_R2_001.fastq.ctq20.fq_fastqc.zip P25152_102_S52_L003_R2_001_ctq20.zip
P25152_103_S53_L003_R1_001.fastq.ctq20.fq_fastqc.zip P25152_103_S53_L003_R1_001_ctq20.zip
P25152_103_S53_L003_R2_001.fastq.ctq20.fq_fastqc.zip P25152_103_S53_L003_R2_001_ctq20.zip

# now we change the echo to mv to make this happen
for file in *.zip ; do mv $file $(echo $file |sed 's/\.fastq\.ctq20\.fq_fastqc/_ctq20/g'); done

for file in *.html ; do mv $file $(echo $file |sed 's/\.fastq\.ctq20\.fq_fastqc/_ctq20/g'); done
