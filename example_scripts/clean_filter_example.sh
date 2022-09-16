# now we are compressing all the raw fastq files
parallel -j 15 "pigz {}" ::: *.fastq


#########
# cleaning the well organized files
#########
# the script we will be using
/data/programs/scripts/getlog_dna_gzfastq_q20.py

cd /cerberus/projects/handor/Prap_WGS_2020/sra_data/fastq_raw
ls *gz | head -4 > fastq.gz_raw_subset

# run the cleaning script on this subset of files.
python /data/programs/scripts/getlog_dna_gzfastq_q20.py fastq.gz_raw_subset



getlog_dna_gzfastq_q20_v25_8_20.py


############################################################
# example from
https://github.com/bioinfowheat/Pieris_macdunnoughii_genome/blob/master/Pmac_specific_scripts/Pmac_fastq_cleaning.sh


# Cleaning and filtering


export PM_READS=/mnt/griffin/Reads/Pieris_macdounghii_data
export PM_RAW=/mnt/griffin/racste/Pmac_raw_reads

cd $PM_RAW

# Individual illumina WGS
ln -s $PM_READS/Pieris_macdounghii.USA.14.Colorado.Pmac000.Thorax.1_1.fq.gz Pmac000.1_1.fq.gz
ln -s $PM_READS/Pieris_macdounghii.USA.14.Colorado.Pmac000.Thorax.1_2.fq.gz Pmac000.1_2.fq.gz

# CO females (103)
ln -s $PM_READS/P4308/P4308_103/02-FASTQ/160426_ST-E00201_0085_BHLTVFCCXX/P4308_103_S2_L001_R1_001.fastq.gz Pmac_Mums_1.fq.gz
ln -s $PM_READS/P4308/P4308_103/02-FASTQ/160426_ST-E00201_0085_BHLTVFCCXX/P4308_103_S2_L001_R2_001.fastq.gz Pmac_Mums_2.fq.gz

#########
# cleaning the well organized files
#########
# the script we will be using
# getlog_dna_gzfastq_q20.py

# in your data file folder with the gz compressed fastq files
ls *gz > fq.gz_raw

# NOTE that this should be a list of paired read 1 and read 2 fastq files
# these shoudl always be the same data, read1 then read2, in the list.
# so the list shoudl always be divisible by 2, etc.

# run the cleaning script on this subset of files where their paths are indicated
python /mnt/griffin/racste/getlog_dna_gzfastq_q20_v25_8_20.py fq.gz_raw

# The cleaning script produces a log file (log.txt) which needs to be parsed into a .csv
grep -E '.gz and|clone reads|Input:|Result:' log.txt |\ cut -f1,3 -d ',' | tr -d '\r\n'| tr -s " " |\
awk '{gsub("\t","",$0); print;}' | sed 's/Pmac/\nPmac/g' |\
sed -e 's/ and/,/g' -e 's/ pairs of reads input. /,/g' -e 's/ pairs of reads output. /,/g' -e 's/ pairs of reads /,/g' -e 's/ clone reads.Input: /,/g' -e 's/Input: /,/g' -e 's/ reads /,/g' -e 's/ bases.Result: /,/g' -e 's/ bases /,/g' -e 's/) /,/g' -e 's/ reads /,/g' -e 's/) bases //g' -e 's/(//g' -e 's/)//g' |\
sed '1 i file,clonefilter_in_pairs,clonefilter_out_pairs,clonefilter_percent_remaining,adapter_in_reads,adapter_in_bases,adapter_out_reads,adapter_out_reads_pct,adapter_out_bases,adapter_out_bases_pct,qualtrim_in_reads,qualtrim_in_bases,qualtrim_out_reads,qualtrim_out_reads_pct,qualtrim_out_bases,qualtrim_out_bases_pct' > filt_qtrim_log.csv

# check em out
for i in `ls -1 *.fq.ctq20.fq | sed 's/.fq.ctq20.fq//'`;
do echo "perl $TOOLS/FastQC/fastqc -o $PM_DATA/clean -t 10 $i.fq.ctq20.fq" >> $PM_DATA/clean/fastqc_jobs.txt; done
head -1 $PM_DATA/clean/fastqc_jobs.txt

parallel -j10 < fastqc_jobs.txt


################################################
# lets set this up for some of your files

# lets find your files
cd smb/zootis.zoologi.su.se/chrwhe/Elizabeth/
find Mats_genomic_data_raw -name "*.gz"  # this spits all matches out to the screen

find Mats_genomic_data_raw -name "*.gz" | wc -l # this counts the number of lines, and thus should be div by 2, and there are 188 of these.
find Mats_genomic_data_raw -name "*.gz" | grep '_R1_' | wc -l # 94

# OK lets do it
cd /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Lasiommata_popgen
mkdir cleaning_data
cd cleaning_data
# now lets take the files and save them as a list
find /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Mats_genomic_data_raw -name "*.gz" > fq.files.w.path

# this is an example of a lop through the list
while read p; do echo $p ; done < fq.files.w.path

# make a soft link to all of them, here.
while read p; do ln -s $p .; done < fq.files.w.path