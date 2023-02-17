# OK lets do it
cd /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Lasiommata_popgen
mkdir cleaning_data
cd cleaning_data
# now lets take the files and save them as a list
find ../../Mats_genomic_data_raw -name "*.gz" > fq.files.w.path

# this is an example of a lop through the list
while read p; do echo $p ; done < fq.files.w.path

# make a soft link to all of them, here.
while read p; do ln -s $p .; done < fq.files.w.path

# verify you can see the files from the soft link
zcat P25152_145_S95_L003_R1_001.fastq.gz | head

# verify you can write in the folder
touch test # write test in the folder you are in

# run the cleaning script on this subset of files where their paths are indicated
cp /data/programs/scripts/getlog_dna_gzfastq_q20_v25_8_20.py .

#
ls *gz > fq.files
head fq.files
# P25152_101_S51_L003_R1_001.fastq.gz
# P25152_101_S51_L003_R2_001.fastq.gz
# P25152_102_S52_L003_R1_001.fastq.gz
# P25152_102_S52_L003_R2_001.fastq.gz
# P25152_103_S53_L003_R1_001.fastq.gz

python getlog_dna_gzfastq_q20_v25_8_20.py fq.files

# for some reason this crashed about half way through ...
# look at outoupt
ls *R1*fq | wc -l
59
ls -lh *R1*fq
...
-rw-r--r--+ 1 chrwhe chrwhe 7.2G Sep 17 15:09 P25152_157_S107_L003_R1_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe 8.4G Sep 17 15:27 P25152_158_S108_L003_R1_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe  15G Sep 17 15:59 P25152_159_S109_L003_R1_001.fastq.ctq20.fq
# today is 20 sept ...

# has been there way for days ... no newly written files for days ...

# backup log file
cp templog.txt templog_firstrun.txt

# OK, so what was the last file written
ls -lh *fq | tail
-rw-r--r--+ 1 chrwhe chrwhe  12G Sep 17 14:54 P25152_156_S106_L003_R1_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe  12G Sep 17 14:54 P25152_156_S106_L003_R2_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe 7.2G Sep 17 15:09 P25152_157_S107_L003_R1_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe 7.0G Sep 17 15:09 P25152_157_S107_L003_R2_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe 8.4G Sep 17 15:27 P25152_158_S108_L003_R1_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe 8.3G Sep 17 15:27 P25152_158_S108_L003_R2_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe  15G Sep 17 15:59 P25152_159_S109_L003_R1_001.fastq.ctq20.fq
-rw-r--r--+ 1 chrwhe chrwhe  15G Sep 17 15:59 P25152_159_S109_L003_R2_001.fastq.ctq20.fq

# so now want new list of files that start after 159
tail -n 70 fq.files | head
P25152_160_S110_L003_R1_001.fastq.gz
P25152_160_S110_L003_R2_001.fastq.gz
P25152_161_S111_L003_R1_001.fastq.gz
P25152_161_S111_L003_R2_001.fastq.gz
P25152_162_S112_L003_R1_001.fastq.gz
P25152_162_S112_L003_R2_001.fastq.gz
P25152_163_S113_L003_R1_001.fastq.gz
P25152_163_S113_L003_R2_001.fastq.gz
P25152_164_S114_L003_R1_001.fastq.gz
P25152_164_S114_L003_R2_001.fastq.gz
# so now write new file starting only with 160 till end
tail -n 70 fq.files > fq.files.subset

python getlog_dna_gzfastq_q20_v25_8_20.py fq.files.subset
# something is strange with this dataset
P25152_160_S110_L003_R1_001.fastq.gz
P25152_160_S110_L003_R2_001.fastq.gz
# or running out of space
cd /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/
du -hs *
# out of space

rm *1 *2 temp*.fq
parallel 'pigz {}' ::: *fq

tail -n 68 fq.files > fq.files.subset2

# this log file was written just fine.
mv log.txt 160_end.log.txt

# modified getlog to parse only logfile
getlog_dna_gzfastq_q20_v25_8_20.logfile_only.py
# make this exe
chmod u+x getlog_dna_gzfastq_q20_v25_8_20.logfile_only.py
cp templog_firstrun.txt templog.txt
python getlog_dna_gzfastq_q20_v25_8_20.logfile_only.py

cat log.txt 160_end.log.txt > all_files.log.txt


#####
# running new set of files cause they crashed.
# moving log files to other names
cat log.txt > up_to_160.log.txt
python getlog_dna_gzfastq_q20_v25_8_20.py fq.files.subset
# look great.
cat log.txt > 160_end.log.txt

rm P25*_1 P25*_2 temp*fq
# compress
parallel 'pigz {}' ::: *fq
