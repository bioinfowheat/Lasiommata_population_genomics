# here we need to talk about cleaning and filtering you data

#########
# cleaning the well organized files
#########
# the script we will be using
/data/programs/scripts/getlog_dna_gzfastq_q20.py

cd /cerberus/projects/handor/Prap_WGS_2020/sra_data/fastq_raw
ls *gz | head -4 > fastq.gz_raw_subset

# run the cleaning script on this subset of files.
python /data/programs/scripts/getlog_dna_gzfastq_q20.py fastq.gz_raw_subset
