# filters for popgen stats
# run with "for i in *bcf ; do bash vcf_filter.sh $i; done"
bcftools view --threads 30 --exclude-types indels -O u -o ${1%bcf}noIndel.bcf $1
bcftools view --threads 30 -i 'QUAL>30 & AVG(FMT/DP)>5 & AVG(FMT/DP)<100' -O z -o ${1%bcf}noindel.q20.dp5_100.vcf.gz ${1%bcf}noIndel.bcf


#
https://samtools.github.io/bcftools/bcftools.html
# QUAL is MPAQ score
# FMT is for per individual measures
# this should evaluate for each individual, not sure if this drops the row or invidiuals
bcftools view --threads 30 -i 'FMT/QUAL>30 & FMT/DP>5 & FMT/DP<55' -O z -o ${1%bcf}noindel.q20.dp5_100.vcf.gz ${1%bcf}noIndel.bcf

# this should evaluate for each individual for BOOLEAN
bcftools view --threads 30 -e 'FMT/QUAL<30 | FMT/DP<5 | FMT/DP>55' -O z -o ${1%bcf}noindel.q20.dp5_100.vcf.gz ${1%bcf}noIndel.bcf
# evalutated row wise
bcftools view --threads 30 -e 'FMT/QUAL<30 || FMT/DP<5 || FMT/DP>55' -O z -o ${1%bcf}noindel.q20.dp5_100.vcf.gz ${1%bcf}noIndel.bcf

# https://samtools.github.io/bcftools/howtos/filtering.html


# this should evaluate for among individuals using among individual averages
bcftools view --threads 30 -e 'AVG(FMT/QUAL)<30 || AVG(FMT/DP)<5 || AVG(FMT/DP)>55' -O z -o ${1%bcf}noindel.q20.dp5_100.vcf.gz ${1%bcf}noIndel.bcf
