cd zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping/reference=Lasiommata_megera-GCA_928268935.1-softmasked.fa
reference=Lasiommata_megera-GCA_928268935.1-softmasked.fa
suffix=Lasmeg_ilLasMege1.aln

tail -n +20 sample_ids | parallel -v -j 3 "~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 10 $reference ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o {}_v_$suffix.bam" 1> stdout3.log 2> stderr3.log

# revised

cd zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping/
cp ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/DToL_data/Lasiommata_megera-GCA_928268935.1-softmasked.fa Lasiommata_megera-GCA_928268935.1-softmasked.fa
reference=Lasiommata_megera-GCA_928268935.1-softmasked.fa
suffix=Lasmeg_ilLasMege1.aln
tail -n +20 sample_ids | parallel --dryrun -v -j 3 "~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 10 $reference ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R2.ctq20.fq.gz"

# something weird with
Lasiommata_megera-GCA_928268935.1-softmasked.fa
# I can't read it or delete it.

##########
#
# make new folder
cd /home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2
# get all index information
cp /home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping/Lasiommata_megera-GCA_928268935.1-softmasked.fa.* .
# get the genome
cp ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/DToL_data/Lasiommata_megera-GCA_928268935.1-softmasked.fa Lasiommata_megera-GCA_928268935.1-softmasked.fa
# get sample ID list
cp ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping/sample_ids .
# set the reference and suffix, and remove the samtools bit
reference=Lasiommata_megera-GCA_928268935.1-softmasked.fa
suffix=Lasmeg_ilLasMege1.aln
cat sample_ids | parallel -j 5 "~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 10 $reference -o $suffix.{}.sam ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R2.ctq20.fq.gz" 1> stdout.log 2> stderr.log

# compress and filter the bam files.
parallel --dryrun -j 3 'samtools view -Sb -F4 {} -o {.}.bam' ::: *.H*.sam
parallel -j 1 'samtools view -Sb -F4 {} -o {.}.bam' ::: *.H*.sam
# OK, this finished.

ls -lh *.H*.*am
-rw-r--r--+ 1 chrwhe chrwhe 7.1G Mar 28 11:36 Lasmeg_ilLasMege1.aln.H10.bam
-rw-r--r--+ 1 chrwhe chrwhe  27G Mar 27 22:53 Lasmeg_ilLasMege1.aln.H10.sam
-rw-r--r--+ 1 chrwhe chrwhe 4.0G Mar 28 11:45 Lasmeg_ilLasMege1.aln.H11.bam
-rw-r--r--+ 1 chrwhe chrwhe  15G Mar 27 22:00 Lasmeg_ilLasMege1.aln.H11.sam
-rw-r--r--+ 1 chrwhe chrwhe 5.8G Mar 28 11:58 Lasmeg_ilLasMege1.aln.H12.bam
-rw-r--r--+ 1 chrwhe chrwhe  22G Mar 27 23:51 Lasmeg_ilLasMege1.aln.H12.sam
-rw-r--r--+ 1 chrwhe chrwhe 4.9G Mar 28 12:10 Lasmeg_ilLasMege1.aln.H13.bam
-rw-r--r--+ 1 chrwhe chrwhe  19G Mar 28 00:01 Lasmeg_ilLasMege1.aln.H13.sam
-rw-r--r--+ 1 chrwhe chrwhe 6.2G Mar 28 12:24 Lasmeg_ilLasMege1.aln.H15.bam
-rw-r--r--+ 1 chrwhe chrwhe  23G Mar 28 00:30 Lasmeg_ilLasMege1.aln.H15.sam
-rw-r--r--+ 1 chrwhe chrwhe 6.0G Mar 28 12:38 Lasmeg_ilLasMege1.aln.H16.bam
-rw-r--r--+ 1 chrwhe chrwhe  23G Mar 28 01:22 Lasmeg_ilLasMege1.aln.H16.sam
*	-rw-r--r--+ 1 chrwhe chrwhe  46M Mar 28 12:40 Lasmeg_ilLasMege1.aln.H18.bam
	-rw-r--r--+ 1 chrwhe chrwhe  17G Mar 27 23:30 Lasmeg_ilLasMege1.aln.H18.sam
*	-rw-r--r--+ 1 chrwhe chrwhe 132M Mar 28 12:44 Lasmeg_ilLasMege1.aln.H19.bam
	-rw-r--r--+ 1 chrwhe chrwhe  21G Mar 27 23:49 Lasmeg_ilLasMege1.aln.H19.sam
-rw-r--r--+ 1 chrwhe chrwhe 6.5G Mar 28 12:59 Lasmeg_ilLasMege1.aln.H1.bam
-rw-r--r--+ 1 chrwhe chrwhe  25G Mar 27 20:20 Lasmeg_ilLasMege1.aln.H1.sam
*	-rw-r--r--+ 1 chrwhe chrwhe  48M Mar 28 13:02 Lasmeg_ilLasMege1.aln.H20.bam
	-rw-r--r--+ 1 chrwhe chrwhe  16G Mar 28 00:03 Lasmeg_ilLasMege1.aln.H20.sam
*	-rw-r--r--+ 1 chrwhe chrwhe  88M Mar 28 13:05 Lasmeg_ilLasMege1.aln.H21.bam
	-rw-r--r--+ 1 chrwhe chrwhe  18G Mar 28 00:06 Lasmeg_ilLasMege1.aln.H21.sam
-rw-r--r--+ 1 chrwhe chrwhe 3.7G Mar 28 13:15 Lasmeg_ilLasMege1.aln.H23.bam
-rw-r--r--+ 1 chrwhe chrwhe  22G Mar 28 01:42 Lasmeg_ilLasMege1.aln.H23.sam
-rw-r--r--+ 1 chrwhe chrwhe 4.9G Mar 28 13:26 Lasmeg_ilLasMege1.aln.H24.bam
-rw-r--r--+ 1 chrwhe chrwhe  20G Mar 28 02:10 Lasmeg_ilLasMege1.aln.H24.sam
*	-rw-r--r--+ 1 chrwhe chrwhe  72M Mar 28 13:30 Lasmeg_ilLasMege1.aln.H25.bam
	-rw-r--r--+ 1 chrwhe chrwhe  21G Mar 28 00:23 Lasmeg_ilLasMege1.aln.H25.sam
-rw-r--r--+ 1 chrwhe chrwhe 5.0G Mar 28 13:41 Lasmeg_ilLasMege1.aln.H26.bam
-rw-r--r--+ 1 chrwhe chrwhe  19G Mar 28 02:27 Lasmeg_ilLasMege1.aln.H26.sam
-rw-r--r--+ 1 chrwhe chrwhe 8.0G Mar 28 14:00 Lasmeg_ilLasMege1.aln.H27.bam
-rw-r--r--+ 1 chrwhe chrwhe  30G Mar 28 03:45 Lasmeg_ilLasMege1.aln.H27.sam
-rw-r--r--+ 1 chrwhe chrwhe 3.8G Mar 28 14:09 Lasmeg_ilLasMege1.aln.H28.bam
-rw-r--r--+ 1 chrwhe chrwhe  20G Mar 28 03:05 Lasmeg_ilLasMege1.aln.H28.sam
-rw-r--r--+ 1 chrwhe chrwhe 5.0G Mar 28 14:20 Lasmeg_ilLasMege1.aln.H2.bam
-rw-r--r--+ 1 chrwhe chrwhe  19G Mar 27 19:43 Lasmeg_ilLasMege1.aln.H2.sam
-rw-r--r--+ 1 chrwhe chrwhe 3.6G Mar 28 14:29 Lasmeg_ilLasMege1.aln.H3.bam
-rw-r--r--+ 1 chrwhe chrwhe  13G Mar 27 19:11 Lasmeg_ilLasMege1.aln.H3.sam
-rw-r--r--+ 1 chrwhe chrwhe 5.4G Mar 28 14:41 Lasmeg_ilLasMege1.aln.H4.bam
-rw-r--r--+ 1 chrwhe chrwhe  20G Mar 27 19:56 Lasmeg_ilLasMege1.aln.H4.sam
-rw-r--r--+ 1 chrwhe chrwhe 4.0G Mar 28 14:51 Lasmeg_ilLasMege1.aln.H6.bam
-rw-r--r--+ 1 chrwhe chrwhe  15G Mar 27 19:23 Lasmeg_ilLasMege1.aln.H6.sam
-rw-r--r--+ 1 chrwhe chrwhe 5.6G Mar 28 15:03 Lasmeg_ilLasMege1.aln.H7.bam
-rw-r--r--+ 1 chrwhe chrwhe  21G Mar 27 21:30 Lasmeg_ilLasMege1.aln.H7.sam
-rw-r--r--+ 1 chrwhe chrwhe 6.2G Mar 28 15:18 Lasmeg_ilLasMege1.aln.H8.bam
-rw-r--r--+ 1 chrwhe chrwhe  24G Mar 27 22:00 Lasmeg_ilLasMege1.aln.H8.sam
-rw-r--r--+ 1 chrwhe chrwhe 8.7G Mar 28 15:38 Lasmeg_ilLasMege1.aln.H9.bam
-rw-r--r--+ 1 chrwhe chrwhe  33G Mar 27 23:17 Lasmeg_ilLasMege1.aln.H9.sam

# P25152_115	H18	28.86	91.20
# P25152_116	H19	36.57	91.48
# P25152_117	H20	27.13	90.64
# P25152_118	H21	30.89	90.88

for sam in H18 H19 H20 H21;
	do echo $sam ; done | cat | parallel "pigz Lasmeg_ilLasMege1.aln.{}.sam"
done
# So now I delete the *.H*.sam
rm *.H*.sam

# compare with multiQC report
scp chrwhe@duke.zoologi.su.se:/smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Lasiommata_popgen/Mats_read_qc/\*.html .




# after all converted to BAM
# need to sort and index these.
parallel --dryrun -j 3 'samtools sort {} -o {.}.sorted.bam ; samtools index {.}.sorted.bam' ::: *.bam
