cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/
mkdir mapping
cd mapping



# soft link to the geneome file
ln -s ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/DToL_data/Lasiommata_megera-GCA_928268935.1-softmasked.fa .


# rename reference to your reference and rootname to what you want your final bamfile to have as a suffix.
reference=Lasiommata_megera-GCA_928268935.1-softmasked.fa
suffix=Lasmerg_ilLasMege1.aln
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 index $reference



# mapping
for sample in `ls ./*_1.ctq20.fq `
do
base=$(basename $sample "_1.ctq20.fq")
/mnt/griffin/kaltun/software/bwa-mem2-2.0pre2_x64-linux/bwa-mem2 mem -t 40 "$reference" ${base}_1.ctq20.fq ${base}_2.ctq20.fq | samtools view -Sb -F4 -@6 - -o ${base}_v_$suffix.bam
done
