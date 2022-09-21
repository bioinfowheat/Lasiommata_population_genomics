# now that you have fastq files cleaned, you can look at the log file output as per what RS did above,
# which is important and you want to have that to put into a table, and assess if any individuals
# are "bad", and how that is distributed among populations

# then you want to assess the Quality of the cleaned reads

# this script is making a series of commands that can then be fed to GNU parallel
for i in `ls -1 *.fq.ctq20.fq | sed 's/.fq.ctq20.fq//'`;
do echo "perl $TOOLS/FastQC/fastqc -o $PM_DATA/clean -t 10 $i.fq.ctq20.fq" >> $PM_DATA/clean/fastqc_jobs.txt; done
head -1 $PM_DATA/clean/fastqc_jobs.txt

parallel -j10 < fastqc_jobs.txt

# break it down
# this script is making a series of commands that can then be fed to GNU parallel
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data
for i in `ls -1 *.fastq.ctq20.fq.gz | sed 's/.fastq.ctq20.fq.gz//'`;
do echo "perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 $i.fastq.ctq20.fq.gz" >> ../read_qc/clean/fastqc_jobs.txt; done

# check the output file that was written
head -6 ../read_qc/clean/fastqc_jobs.txt
perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 P25152_101_S51_L003_R1_001.fastq.ctq20.fq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 P25152_101_S51_L003_R2_001.fastq.ctq20.fq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 P25152_102_S52_L003_R1_001.fastq.ctq20.fq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 P25152_102_S52_L003_R2_001.fastq.ctq20.fq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 P25152_103_S53_L003_R1_001.fastq.ctq20.fq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/clean -t 5 P25152_103_S53_L003_R2_001.fastq.ctq20.fq.gz

# if you want to run this, for the first 6 files, to test how it is working
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data
head -6 ../read_qc/clean/fastqc_jobs.txt | parallel --dryrun -j10 {}

# run this on a test set
head -6 ../read_qc/clean/fastqc_jobs.txt | parallel {}


#######
# run on your raw data
# make output folder for fastqc run
mkdir ../read_qc/raw

cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data
for i in `ls -1 *.fastq.gz | sed 's/.fastq.gz//'`;
do echo "perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 $i.fastq.gz" >> ../read_qc/raw/fastqc_jobs_rawreads.txt; done
head -6 ../read_qc/raw/fastqc_jobs_rawreads.txt
perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 P25152_101_S51_L003_R1_001.fastq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 P25152_101_S51_L003_R2_001.fastq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 P25152_102_S52_L003_R1_001.fastq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 P25152_102_S52_L003_R2_001.fastq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 P25152_103_S53_L003_R1_001.fastq.gz
perl /data/programs/FastQC/fastqc -o ../read_qc/raw -t 5 P25152_103_S53_L003_R2_001.fastq.gz

head -6 ../read_qc/raw/fastqc_jobs_rawreads.txt | parallel {}
