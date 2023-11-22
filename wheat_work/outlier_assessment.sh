# go to where its at

#via matitt@duke:
cd /smb/zootis.zoologi.su.se/matitt/Elizabeth/Lasiommata_popgen/Annotation

# need to get non-redundant GFF file
grep -v '#' Lasiommata_megera-GCA_928268935.1-2022_06-genes.gff3 | head -20
1       ilLasMege1.1    region  1       20703086        .       .       .       ID=region:1;Alias=OV743308.1
1       ensembl gene    43381   45492   .       +       .       ID=gene:ENSLARG00005003575;biotype=protein_coding;gene_id=ENSLARG00005003575;version=1
1       ensembl mRNA    43381   45492   .       +       .       ID=transcript:ENSLART00005006049;Parent=gene:ENSLARG00005003575;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005006049;version=1
1       ensembl exon    43381   43520   .       +       .       Parent=transcript:ENSLART00005006049;constitutive=1;exon_id=ENSLARE00005029649;rank=1;version=1
1       ensembl CDS     43381   43520   .       +       0       ID=CDS:ENSLARP00005005470;Parent=transcript:ENSLART00005006049;protein_id=ENSLARP00005005470;version=1
1       ensembl exon    43676   43870   .       +       .       Parent=transcript:ENSLART00005006049;constitutive=1;exon_id=ENSLARE00005029652;rank=2;version=1
1       ensembl CDS     43676   43870   .       +       1       ID=CDS:ENSLARP00005005470;Parent=transcript:ENSLART00005006049;protein_id=ENSLARP00005005470;version=1
1       ensembl exon    45060   45492   .       +       .       Parent=transcript:ENSLART00005006049;constitutive=1;exon_id=ENSLARE00005029654;rank=3;version=1
1       ensembl CDS     45060   45492   .       +       1       ID=CDS:ENSLARP00005005470;Parent=transcript:ENSLART00005006049;protein_id=ENSLARP00005005470;version=1
1       ensembl gene    45688   47076   .       -       .       ID=gene:ENSLARG00005003980;Name=ZNF706;biotype=protein_coding;description=zinc finger protein 706 [Ensembl NN prediction with score 98.87%25];gene_id=ENSLARG00005003980;version=1
1       ensembl mRNA    45688   46903   .       -       .       ID=transcript:ENSLART00005006759;Parent=gene:ENSLARG00005003980;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005006759;version=1
1       ensembl three_prime_UTR 45688   45758   .       -       .       Parent=transcript:ENSLART00005006759
1       ensembl exon    45688   45848   .       -       .       Parent=transcript:ENSLART00005006759;constitutive=0;exon_id=ENSLARE00005033227;rank=3;version=1
1       ensembl CDS     45759   45848   .       -       0       ID=CDS:ENSLARP00005006125;Parent=transcript:ENSLART00005006759;protein_id=ENSLARP00005006125;version=1
1       ensembl CDS     45934   46077   .       -       0       ID=CDS:ENSLARP00005006125;Parent=transcript:ENSLART00005006759;protein_id=ENSLARP00005006125;version=1
1       ensembl exon    45934   46091   .       -       .       Parent=transcript:ENSLART00005006759;constitutive=1;exon_id=ENSLARE00005033193;rank=2;version=1

head Lmeg_annotation.GO.eggNOG.header.tsv| cut -f1 | head
Parent
transcript:ENSLART00005006759
transcript:ENSLART00005006753
transcript:ENSLART00005006771
transcript:ENSLART00005005124
transcript:ENSLART00005005108
transcript:ENSLART00005004454

# grab rows for gene and mRNA
awk 'BEGIN {FS=OFS="\t"} {if ($3 ~ /gene/ || $3 ~ /mRNA/ ) print $1,$4,$5,$3,$9}' Lasiommata_megera-GCA_928268935.1-2022_06-genes.gff3 | head
1       43381   45492   gene    ID=gene:ENSLARG00005003575;biotype=protein_coding;gene_id=ENSLARG00005003575;version=1
1       43381   45492   mRNA    ID=transcript:ENSLART00005006049;Parent=gene:ENSLARG00005003575;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005006049;version=1

1       45688   47076   gene    ID=gene:ENSLARG00005003980;Name=ZNF706;biotype=protein_coding;description=zinc finger protein 706 [Ensembl NN prediction with score 98.87%25];gene_id=ENSLARG00005003980;version=1
1       45688   46903   mRNA    ID=transcript:ENSLART00005006759;Parent=gene:ENSLARG00005003980;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005006759;version=1
1       45690   46638   mRNA    ID=transcript:ENSLART00005006753;Parent=gene:ENSLARG00005003980;biotype=protein_coding;transcript_id=ENSLART00005006753;version=1
1       45692   47076   mRNA    ID=transcript:ENSLART00005006771;Parent=gene:ENSLARG00005003980;biotype=protein_coding;transcript_id=ENSLART00005006771;version=1

1       48005   50082   gene    ID=gene:ENSLARG00005002041;biotype=protein_coding;gene_id=ENSLARG00005002041;version=1
1       48005   50082   mRNA    ID=transcript:ENSLART00005003434;Parent=gene:ENSLARG00005002041;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005003434;version=1
1       50083   53639   ncRNA_gene      ID=gene:ENSLARG00005000407;biotype=lncRNA;gene_id=ENSLARG00005000407;version=1
1       53353   56728   gene    ID=gene:ENSLARG00005003003;biotype=protein_coding;gene_id=ENSLARG00005003003;version=1

grep -v '#' Lasiommata_megera-GCA_928268935.1-2022_06-genes.gff3 | cut -f3 | sort | uniq -c
174826 CDS
185443 exon
 21307 five_prime_UTR
 12606 gene
  2525 lnc_RNA
 22529 mRNA
	4 ncRNA
  3080 ncRNA_gene
    43 region
   138 rRNA
    26 snoRNA
   145 snRNA
 16369 three_prime_UTR
   488 tRNA

# we want gene body bed, with ID for each region, without redunancy

# test
awk 'BEGIN {FS=OFS="\t"} {if ($1 ==1 ) print $0}' Lasiommata_megera-GCA_928268935.1-2022_06-genes.gff3 > chromo1.gff
# fast test
agat_sp_keep_longest_isoform.pl -gff chromo1.gff -o chromo1.longestiso.gff

# sanity check
grep -v '#' chromo1.gff | cut -f3 | sort | uniq -c
8612 CDS
9045 exon
1035 five_prime_UTR
 599 gene
  87 lnc_RNA
1113 mRNA
   2 ncRNA
 131 ncRNA_gene
   1 region
   1 rRNA
   1 snoRNA
   5 snRNA
 812 three_prime_UTR
  38 tRNA

#
grep -v '#' chromo1.longestiso.gff | cut -f3 | sort | uniq -c
4442 CDS
4735 exon
 478 five_prime_UTR
 599 gene
  84 lnc_RNA
 599 mRNA
   2 ncRNA
 131 ncRNA_gene
   1 region
   1 rRNA
   1 snoRNA
   5 snRNA
 408 three_prime_UTR
  38 tRNA


# by god, this is great, lets run it on the whole dam thing
agat_sp_keep_longest_isoform.pl -gff Lasiommata_megera-GCA_928268935.1-2022_06-genes.gff3 -o Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestiso.gff

#sanity check
grep -v '#' Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestiso.gff | cut -f3 | sort | uniq -c
93193 CDS
100467 exon
10502 five_prime_UTR
12606 gene
 2279 lnc_RNA
12606 mRNA
    4 ncRNA
 3080 ncRNA_gene
   34 region
  138 rRNA
   26 snoRNA
  145 snRNA
 8746 three_prime_UTR
  488 tRNA

#
awk 'BEGIN {FS=OFS="\t"} {if ($3 ~ /gene/ || $3 ~ /mRNA/ ) print $1,$4,$5,$3,$9}' Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestiso.gff | head
#
1       43381   45492   gene    ID=gene:ENSLARG00005003575;biotype=protein_coding;gene_id=ENSLARG00005003575;version=1
1       43381   45492   mRNA    ID=transcript:ENSLART00005006049;Parent=gene:ENSLARG00005003575;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005006049;version=1
1       45688   47076   gene    ID=gene:ENSLARG00005003980;Name=ZNF706;biotype=protein_coding;description=zinc finger protein 706 [Ensembl NN prediction with score 98.87%25];gene_id=ENSLARG00005003980;version=1
1       45688   46903   mRNA    ID=transcript:ENSLART00005006759;Parent=gene:ENSLARG00005003980;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005006759;version=1
1       48005   50082   gene    ID=gene:ENSLARG00005002041;biotype=protein_coding;gene_id=ENSLARG00005002041;version=1
1       48005   50082   mRNA    ID=transcript:ENSLART00005003434;Parent=gene:ENSLARG00005002041;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005003434;version=1
1       50083   53639   ncRNA_gene      ID=gene:ENSLARG00005000407;biotype=lncRNA;gene_id=ENSLARG00005000407;version=1
1       53353   56728   gene    ID=gene:ENSLARG00005003003;biotype=protein_coding;gene_id=ENSLARG00005003003;version=1
1       53353   56644   mRNA    ID=transcript:ENSLART00005005124;Parent=gene:ENSLARG00005003003;biotype=protein_coding;tag=Ensembl_canonical;transcript_id=ENSLART00005005124;version=1
1       54054   56664   ncRNA_gene      ID=gene:ENSLARG00005000806;biotype=lncRNA;gene_id=ENSLARG00005000806;version=1

# is this keeping all of the RNA species we are interested in having, YES!
awk 'BEGIN {FS=OFS="\t"} {if ($3 ~ /RNA/ ) print $0}' Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestiso.gff | cut -f3 | sort | uniq -c
2279 lnc_RNA
12606 mRNA
   4 ncRNA
3080 ncRNA_gene
 138 rRNA
  26 snoRNA
 145 snRNA
 488 tRNA

awk 'BEGIN {FS=OFS="\t"} {if ($3 ~ /RNA/ ) print $1,$4,$5,$3,$9}' Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestiso.gff | \
cut -f1 -d ';' |  awk '{gsub(":","\t",$0); print;}' | awk 'BEGIN {FS=OFS="\t"} {; print $1,$2,$3,$6,$4}' > Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestisoRNA.bed

# add 5kb to each
bedtools slop -i Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestisoRNA.bed -g /smb/zootis.zoologi.su.se/matitt/Elizabeth/Lasiommata_popgen/Annotation/Outlier_analysis/Lmeg_genomeFile.txt -b 5000 > Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestisoRNA.5kbslop.bed
# sanity check
head -3 *bed
==> Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestisoRNA.bed <==
1       43381   45492   ENSLART00005006049      mRNA
1       45688   46903   ENSLART00005006759      mRNA
1       48005   50082   ENSLART00005003434      mRNA

==> Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestisoRNA.5kbslop.bed <==
1       38381   50492   ENSLART00005006049      mRNA
1       40688   51903   ENSLART00005006759      mRNA
1       43005   55082   ENSLART00005003434      mRNA


# now that we have a non-redundant list of genes, lets use these IDs to get a nonredundant EGGnog set
cut -f4 Lasiommata_megera-GCA_928268935.1-2022_06-genes.longestisoRNA.5kbslop.bed > list.txt

# clean things up a bit
head Lmeg_annotation.gene_name.eggNOG.tsv
transcript:ENSLART00005006759   ZNF706
transcript:ENSLART00005006753   ZNF706
transcript:ENSLART00005006771   ZNF706
transcript:ENSLART00005005124   ABHD3
transcript:ENSLART00005005108   ABHD3

# clean
cut -f2 -d ':' Lmeg_annotation.gene_name.eggNOG.tsv | head
ENSLART00005006759      ZNF706
ENSLART00005006753      ZNF706
ENSLART00005006771      ZNF706
ENSLART00005005124      ABHD3

cut -f2 -d ':' Lmeg_annotation.gene_name.eggNOG.tsv | sort -k1,1 > Lmeg_annotation.gene_name.eggNOG.ed_sorted.tsv

# grep -wFf list.txt DataTable.txt
# -w matches words.
# -f gets the patterns from the file list.txt.
# -F compares the strings as such, not as possible regular expressions

grep -wFf list.txt Lmeg_annotation.gene_name.eggNOG.ed_sorted.tsv > Lmeg_annotation.gene_name.eggNOG.ed_sorted.longestisoRNA.tsv
# sanity
wc -l *tsv
    9301 Lmeg_annotation.gene_name.eggNOG.ed_sorted.longestisoRNA.tsv
   16077 Lmeg_annotation.gene_name.eggNOG.ed_sorted.tsv

# now you have well, your ability to get non-redundant things.
