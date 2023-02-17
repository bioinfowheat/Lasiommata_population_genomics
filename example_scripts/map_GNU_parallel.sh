cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/
mkdir mapping
cd mapping



# soft link to the geneome file
ln -s ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/DToL_data/Lasiommata_megera-GCA_928268935.1-softmasked.fa .


# rename reference to your reference and rootname to what you want your final bamfile to have as a suffix.
reference=Lasiommata_megera-GCA_928268935.1-softmasked.fa
suffix=Lasmerg_ilLasMege1.aln
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 index $reference



# mapping all of your files against this genome
# get list of all the files
cut -f2 ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/lookuptable.tsv > sample_ids

# file paths
fastq_path=~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/
# files look like this
# H2_R1.ctq20.fq.gz


cat sample_ids | head | parallel -j 3 --dryrun '~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 20 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/{}_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o {}_v_$suffix.bam'

~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H1_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H1_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H1_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H2_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H2_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H2_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H3_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H3_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H3_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H4_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H4_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H4_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H6_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H6_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H6_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H7_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H7_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H7_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H8_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H8_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H8_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H9_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H9_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H9_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H10_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H10_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H10_v_$suffix.bam
~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/software/bwa-mem2-2.2.1_x64-linux/bwa-mem2 mem -t 40 "$reference" ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H11_R1.ctq20.fq.gz ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/H11_R2.ctq20.fq.gz | samtools view -Sb -F4 -@6 - -o H11_v_$suffix.bam
