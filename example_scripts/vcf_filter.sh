# filters for popgen stats 
# run with "for i in *bcf ; do bash vcf_filter.sh $i; done" 
bcftools view --threads 30 --exclude-types indels -O u -o ${1%bcf}noIndel.bcf $1
bcftools view --threads 30 -i 'QUAL>30 & AVG(FMT/DP)>5 & AVG(FMT/DP)<100' -O z -o ${1%bcf}noindel.q20.dp5_100.vcf.gz ${1%bcf}noIndel.bcf