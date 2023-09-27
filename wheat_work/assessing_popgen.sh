cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/


/home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/Analyses$ ls -lh
total 5.7G
-rw-r--r--+ 1 chrwhe chrwhe 8.8K Apr 13 14:42 all.files
-rw-r--r--+ 1 chrwhe chrwhe 8.6K Apr 15 09:29 all_mds_depth_filter_ngsadmix.arg
-rw-r--r--+ 1 chrwhe chrwhe 5.4G Apr 15 09:28 all_mds_depth_filter_ngsadmix.beagle.gz

zcat /home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/Analyses/all_mds_depth_filter_ngsadmix.beagle.gz | more
marker  allele1 allele2 Ind0    Ind0    Ind0    Ind1    Ind1    Ind1    Ind2    Ind2    Ind2    Ind3    Ind3    Ind3    Ind4    Ind4    Ind4    Ind5    Ind5    Ind5    Ind6    Ind6    Ind6    Ind7    Ind7    Ind7    Ind8
Ind8    Ind8    Ind9    Ind9    Ind9    Ind10   Ind10   Ind10   Ind11   Ind11   Ind11   Ind12   Ind12   Ind12   Ind13   Ind13   Ind13   Ind14   Ind14   Ind14   Ind15   Ind15   Ind15   Ind16   Ind16   Ind16   Ind17   Ind17
Ind17   Ind18   Ind18   Ind18   Ind19   Ind19   Ind19   Ind20   Ind20   Ind20   Ind21   Ind21   Ind21   Ind22   Ind22   Ind22   Ind23   Ind23   Ind23   Ind24   Ind24   Ind24   Ind25   Ind25   Ind25   Ind26   Ind26   Ind26
Ind27   Ind27   Ind27   Ind28   Ind28   Ind28   Ind29   Ind29   Ind29   Ind30   Ind30   Ind30   Ind31   Ind31   Ind31   Ind32   Ind32   Ind32   Ind33   Ind33   Ind33   Ind34   Ind34   Ind34   Ind35   Ind35   Ind35   Ind36
Ind36   Ind36   Ind37   Ind37   Ind37   Ind38   Ind38   Ind38   Ind39   Ind39   Ind39   Ind40   Ind40   Ind40   Ind41   Ind41   Ind41   Ind42   Ind42   Ind42   Ind43   Ind43   Ind43   Ind44   Ind44   Ind44   Ind45   Ind45
Ind45   Ind46   Ind46   Ind46   Ind47   Ind47   Ind47   Ind48   Ind48   Ind48   Ind49   Ind49   Ind49   Ind50   Ind50   Ind50   Ind51   Ind51   Ind51   Ind52   Ind52   Ind52   Ind53   Ind53   Ind53   Ind54   Ind54   Ind54
Ind55   Ind55   Ind55   Ind56   Ind56   Ind56   Ind57   Ind57   Ind57   Ind58   Ind58   Ind58   Ind59   Ind59   Ind59   Ind60   Ind60   Ind60   Ind61   Ind61   Ind61   Ind62   Ind62   Ind62   Ind63   Ind63   Ind63   Ind64
Ind64   Ind64   Ind65   Ind65   Ind65   Ind66   Ind66   Ind66   Ind67   Ind67   Ind67   Ind68   Ind68   Ind68   Ind69   Ind69   Ind69   Ind70   Ind70   Ind70   Ind71   Ind71   Ind71   Ind72   Ind72   Ind72   Ind73   Ind73
Ind73   Ind74   Ind74   Ind74   Ind75   Ind75   Ind75   Ind76   Ind76   Ind76   Ind77   Ind77   Ind77   Ind78   Ind78   Ind78   Ind79   Ind79   Ind79   Ind80   Ind80   Ind80   Ind81   Ind81   Ind81   Ind82   Ind82   Ind82

head all.files
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H10.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H11.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H12.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H13.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H15.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H16.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H1.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H23.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H24.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H26.sorted.bam

# ANGSD
cd /mnt/griffin/chrwhe/conbio_workshop/2023/testing
mkdir angsd
cd angsd
ln -s /home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/Analyses/all_mds_depth_filter_ngsadmix.beagle.gz .
cat /mnt/griffin/chrwhe/conbio_workshop/2023/testing/pixy/vcf_headers | rev | cut -f3 -d '.' | rev > all.files.popnames
# PCA
mkdir admix
cd admix
pcangsd -b ../all_mds_depth_filter_ngsadmix.beagle.gz --admix -o admix -t 30

mkdir pcangsd_inbreeding
cd pcangsd_inbreeding/
pcangsd -b ../all_mds_depth_filter_ngsadmix.beagle.gz --inbreedSamples -o inbreeding -t 25

mkdir ROH
cd ROH
ln -s /home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/var_call/Lmegera_1.bcf .
bcftools roh --threads 10 --AF-dflt 0.2 -o out.roh Lmegera_1.bcf

result=out.roh
for sample in H10 H11 H12 ;do
	echo $sample; grep $sample $result | awk 'BEGIN {FS=OFS="\t"} {if ($1 == "RG") print $6}' | hist -b 40 -x
done



/home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/var_call$ ls -lh Lmegera_1*noIndel.all*
-rw-r--r--+ 1 chrwhe chrwhe 4.1G May 17 13:02 Lmegera_10.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.4G May 17 13:21 Lmegera_11.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.1G May 17 13:39 Lmegera_12.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.2G May 17 13:57 Lmegera_13.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.1G May 17 14:13 Lmegera_14.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.0G May 17 14:29 Lmegera_15.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.1G May 17 14:44 Lmegera_16.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 4.0G May 17 15:00 Lmegera_17.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 3.8G May 17 15:16 Lmegera_18.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 3.6G May 17 15:31 Lmegera_19.noIndel.allsites.q20.dp5_100.vcf.gz
-rw-r--r--+ 1 chrwhe chrwhe 5.1G May 17 15:50 Lmegera_1.noIndel.allsites.q20.dp5_100.vcf.gz


##bcftools_viewCommand=view --threads 30 -i 'QUAL>30 & AVG(FMT/DP)>5 & AVG(FMT/DP)<100' -O z -o /home/matitt/zootis.zoologi.su.se/Eliz
abeth/Lasiommata_popgen/var_call/Lmegera_10.noIndel.allsites.q20.dp5_100.vcf.gz /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata
_popgen/var_call/Lmegera_10.noIndel.bcf; Date=Wed May 17 12:54:51 2023
#CHROM  POS     ID      REF     ALT     QUAL    FILTER  INFO    FORMAT  /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H10.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H11.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H12.sorted.bam  /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H13.sorted.bam      /home/matitt/zootis.zo
ologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H15.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H16.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H1.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H23.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H24.sorted.bam     /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H26.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H27.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H28.sorted.bam   /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H2.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H3.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H4.sorted.bam      /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H6.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H7.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H8.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H9.sorted.bam    /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.R10.sorted.bam  /home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.R11.sorted.bam      /home/matitt/zootis.zo

# tesitng for ConBio
cd /mnt/griffin/chrwhe/conbio_workshop/2023/testing/pixy

# small dataset
data_path=/home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/var_call
ln -s $data_path/Lmegera_CAKMRP010000001.1.noindel.q20.dp5_100.vcf.gz .
ln -s $data_path/Lmegera_CAKMRP010000001.1.noIndel.bcf .

# Create a populations file
# Create a populations file. This is a headerless, tab-separated file where the first column contains sample names
# (exactly as represented in the VCF), and the second column contains population names
# (these can be anything, but should be consistent!).
ERS223827   BFS
ERS223759   BFS
ERS223750   BFS
ERS223967   AFS

zcat Lmegera_CAKMRP010000001.1.noindel.q20.dp5_100.vcf.gz | head -100 | \
grep '#CHROM' | sed 's/#CHROM*.*FORMAT//g' | tr "\t" "\n " | sed 1d > vcf_headers

head vcf_headers
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H10.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H11.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H12.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H13.sorted.bam
/home/matitt/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/mapping2/Lasmeg_ilLasMege1.aln.H15.sorted.bam

cat vcf_headers | rev | cut -f3 -d '.' | rev | cut -c1 > file_pops
paste vcf_headers file_pops > popfile.txt

# index the vcf file
tabix Lmegera_CAKMRP010000001.1.noindel.q20.dp5_100.vcf.gz

# run pixy for various stats
pixy --stats pi fst dxy \
--vcf Lmegera_CAKMRP010000001.1.noindel.q20.dp5_100.vcf.gz \
--populations popfile.txt \
--window_size 10000 \
--n_cores 10
