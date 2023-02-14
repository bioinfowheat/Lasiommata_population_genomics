ls *bam > mapped_reads
ref=alba_edited_genome_V2.fa
cut -f1 $ref.fai
cat chromo_list | \
    parallel -j 60 "bcftools mpileup -Ou -f $ref -b mapped_reads --annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR -r {} | \
    bcftools call -f GQ,GP -m -Ob -o can_pel_cro_{}.bcf"