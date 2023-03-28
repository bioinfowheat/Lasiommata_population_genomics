
# make new folder

# go into folder

# make soft link to your genome here (same one that you used for themapping)


# get list of the sorted bam files with their path
ls *.sorted.bam > mapped_reads


# set your variables here
ref=alba_edited_genome_V2.fa

cut -f1 $ref  > chromo_list

cat chromo_list | \
    parallel --dryrun -j 30 "bcftools mpileup -Ou -f $ref -b mapped_reads --annotate FORMAT/AD,FORMAT/ADF,FORMAT/ADR,FORMAT/DP,FORMAT/SP,INFO/AD,INFO/ADF,INFO/ADR -r {} | \
    bcftools call -f GQ,GP -m -Ob -o Lmegera_{}.bcf"
