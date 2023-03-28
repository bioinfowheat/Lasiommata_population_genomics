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

# after all converted to BAM
# need to sort and index these.
parallel --dryrun -j 3 'samtools sort {} -o {.}.sorted.bam ; samtools index {.}.sorted.bam' ::: *.bam
