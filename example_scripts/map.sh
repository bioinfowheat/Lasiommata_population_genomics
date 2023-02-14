# rename reference to your reference and rootname to what you want your final bamfile to have as a suffix. 
reference=haplotype_1.fasta
suffix=haplotype_1.aln
/mnt/griffin/kaltun/software/bwa-mem2-2.0pre2_x64-linux/bwa-mem2 index $reference
for sample in `ls ./*_1.ctq20.fq `
do
base=$(basename $sample "_1.ctq20.fq")
/mnt/griffin/kaltun/software/bwa-mem2-2.0pre2_x64-linux/bwa-mem2 mem -t 40 "$reference" ${base}_1.ctq20.fq ${base}_2.ctq20.fq | samtools view -Sb -F4 -@6 - -o ${base}_v_$suffix.bam
done
