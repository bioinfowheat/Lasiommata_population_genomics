# moving the NGI files to Elizabeth
scp -r NGI_delivery/ chrwhe@miles.zoologi.su.se:~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen


# looking at the naming scheme
head K.Gotthard_22_01_sample_info.txt
NGI ID  User ID Mreads  ≥Q30
P25152_101      H1      33.91   90.26
P25152_102      H2      25.52   90.02
P25152_103      H3      18.55   88.93
P25152_104      H4      27.96   89.17
P25152_105      H6      20.90   89.59
P25152_106      H7      29.02   89.99
P25152_107      H8      32.54   90.11
P25152_108      H9      45.56   89.84

# what we have now for the cleaned files is not good
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data
ls *ctq20* | head
P25152_101_S51_L003_R1_001.fastq.ctq20.fq.gz
P25152_101_S51_L003_R2_001.fastq.ctq20.fq.gz
P25152_102_S52_L003_R1_001.fastq.ctq20.fq.gz
P25152_102_S52_L003_R2_001.fastq.ctq20.fq.gz
P25152_103_S53_L003_R1_001.fastq.ctq20.fq.gz

# for all downstream work, woudl be nice to have informative, short names
H1_R1.ctq20.fq.gz
H1_R2.ctq20.fq.gz
H2_R1.ctq20.fq.gz
H2_R2.ctq20.fq.gz

# need lookup table
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data
sed 1d ../NGI_delivery/K.Gotthard_22_01_sample_info.txt | cut -f1,2 | tr -s " " > lookuptable.tsv

# sanity check
head lookuptable.tsv
P25152_101      H1
P25152_102      H2
P25152_103      H3


# now we change the echo to mv to make this happen
for file in *.ctq20.fq.gz ; do echo $file $(echo $file |sed 's/_001\.fastq//g' |sed 's/_S.._L003_/./g' | sed 's/_S..._L003_/./g' ); done | head
P25152_101_S51_L003_R1_001.fastq.ctq20.fq.gz P25152_101.R1.ctq20.fq.gz
P25152_101_S51_L003_R2_001.fastq.ctq20.fq.gz P25152_101.R2.ctq20.fq.gz
P25152_102_S52_L003_R1_001.fastq.ctq20.fq.gz P25152_102.R1.ctq20.fq.gz
P25152_102_S52_L003_R2_001.fastq.ctq20.fq.gz P25152_102.R2.ctq20.fq.gz
P25152_103_S53_L003_R1_001.fastq.ctq20.fq.gz P25152_103.R1.ctq20.fq.gz

for file in *.ctq20.fq.gz ; do cp $file $(echo $file |sed 's/_001\.fastq//g' |sed 's/_S.._L003_/./g' | sed 's/_S..._L003_/./g' ); done


head lookuptable.tsv > test
while read p; do find=$(echo $p | cut -f1 ); replace=$(echo $p | cut -f2); mv $find.R1.ctq20.fq.gz $(echo $p.R1.ctq20.fq.gz |sed 's/$find/$replace/g' ); done < test

cat lookuptable.tsv | head | parallel --colsep '\t' --dryrun mv {1}.R1.ctq20.fq.gz {2}_R1.ctq20.fq.gz
mv P25152_101.R1.ctq20.fq.gz H1_R1.ctq20.fq.gz
mv P25152_102.R1.ctq20.fq.gz H2_R1.ctq20.fq.gz
mv P25152_103.R1.ctq20.fq.gz H3_R1.ctq20.fq.gz
mv P25152_104.R1.ctq20.fq.gz H4_R1.ctq20.fq.gz
mv P25152_105.R1.ctq20.fq.gz H6_R1.ctq20.fq.gz
mv P25152_106.R1.ctq20.fq.gz H7_R1.ctq20.fq.gz
mv P25152_107.R1.ctq20.fq.gz H8_R1.ctq20.fq.gz
mv P25152_108.R1.ctq20.fq.gz H9_R1.ctq20.fq.gz
mv P25152_109.R1.ctq20.fq.gz H10_R1.ctq20.fq.gz
mv P25152_110.R1.ctq20.fq.gz H11_R1.ctq20.fq.gz

cat lookuptable.tsv | head | parallel --colsep '\t' mv {1}.R1.ctq20.fq.gz {2}_R1.ctq20.fq.gz


#################
# OK, action plan
# copy all files into shorter name structure
# P25152_101_S51_L003_R1_001.fastq.ctq20.fq.gz P25152_101.R1.ctq20.fq.gz
#
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data
for file in *.ctq20.fq.gz ; do cp $file $(echo $file |sed 's/_001\.fastq//g' |sed 's/_S.._L003_/./g' | sed 's/_S..._L003_/./g' ); done
mkdir clean_old_name
mv *001.fastq.ctq20.fq.gz clean_old_name
# then rename these files for R1
cat lookuptable.tsv | parallel --colsep '\t' mv {1}.R1.ctq20.fq.gz {2}_R1.ctq20.fq.gz
# and R2
cat lookuptable.tsv | parallel --colsep '\t' mv {1}.R2.ctq20.fq.gz {2}_R2.ctq20.fq.gz



###################################################
	# another approach
	# goal
	# P25152_101_S51_L003_R1_001.fastq.ctq20.fq.gz H1_R1.ctq20.fq.gz
	# P25152_101_S51_L003_R2_001.fastq.ctq20.fq.gz H1_R2.ctq20.fq.gz
	# P25152_102_S52_L003_R1_001.fastq.ctq20.fq.gz H2_R1.ctq20.fq.gz
	# P25152_102_S52_L003_R2_001.fastq.ctq20.fq.gz H2_R2.ctq20.fq.gz
	#
	# #
	# /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Lasiommata_popgen/cleaning_data
	# sed 1d ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/NGI_delivery/K.Gotthard_22_01_sample_info.txt | cut -f1,2 | tr -s " " | awk '{gsub("\t",",",$0); print;}'> lookuptable.csv
	#
	# cat lookuptable.csv | while IFS=, read orig new; do mv "$orig" "$new"; done

# just recleaned 160 onwards ... .
P25152_160	S12
P25152_161	S13
P25152_162	S14
P25152_163	S15
P25152_164	S16
P25152_165	S17
P25152_166	S19
P25152_167	S20
P25152_168	S21
P25152_169	S22
P25152_170	S23
P25152_171	S24
P25152_172	V1
P25152_173	V2
P25152_174	V3
P25152_175	V4
P25152_176	V5
P25152_177	V6
P25152_178	V7
P25152_179	V8
P25152_180	V9
P25152_181	V10
P25152_182	V13
P25152_183	V14
P25152_184	V15
P25152_185	V17
P25152_186	V18
P25152_187	V19
P25152_188	V20
P25152_189	V21
P25152_190	V22
P25152_191	V23
P25152_192	V24
P25152_193	V25
P25152_194	V26

for file in P*.ctq20.fq.gz ; do cp $file $(echo $file |sed 's/_001\.fastq//g' |sed 's/_S.._L003_/./g' | sed 's/_S..._L003_/./g' ); done
mkdir clean_old_name
mv P*001.fastq.ctq20.fq.gz clean_old_name

# trim to only 160 to 194 files
tail -n 35 lookuptable.tsv > 160_194_lookuptable.tsv
# get rid of the old
cut -f2 160_194_lookuptable.tsv | parallel rm {}_R1.ctq20.fq.gz {}_R2.ctq20.fq.gz
# then rename these files for R1
cat 160_194_lookuptable.tsv | parallel --colsep '\t' mv {1}.R1.ctq20.fq.gz {2}_R1.ctq20.fq.gz
# and R2
cat 160_194_lookuptable.tsv | parallel --colsep '\t' mv {1}.R2.ctq20.fq.gz {2}_R2.ctq20.fq.gz
echo "finished renaming"

#
