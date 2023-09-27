# concern that the DToL genome doesn't have good or insect focused naming of genes in the annotation
# this makes it difficult for plotting

# need GFF file that has nice gene names for plotting

# AGAT will work for this
https://agat.readthedocs.io/en/latest/tools/agat_sp_manage_functional_annotation.html


# so what is needed?

# first we need to get the proteins from the existing annotation
# extract CDS and protein
reference=genome.fasta
gff_file=annotation.gff
root=species
# -yJ flag (I believe) only prints converted amino acid sequence of any mRNAs with no in exon stop codons, and with existing start and stop codon.
/data/programs/cufflinks-2.2.1.Linux_x86_64/gffread "$gff_file" -g "$reference" -J -x "$root"_cds.fa -y "$root"_prot.fa
# validate
grep -c '>' *.fa
# species_cds.fa:16517
# species_prot.fa:16517

# check the header of these files to make sure they have the right names for integrating back into the annotation
# how do these names compare to the downloadable protein file?
# perhaps download that as well for backup, assessment

# then these need to be annotated using a taxonomically relevant tool
# standard protein based annotation
# basic example will run a diamond blastp search, and for those queries with hits to eggNOG proteins, will carry out functional annotation
export PATH=/data/programs/eggnog-mapper:/data/programs/eggnog-mapper/eggnogmapper/bin:"$PATH"
export EGGNOG_DATA_DIR=/data/programs/eggnog-mapper/data
fasta_file=file.fa
output_dir=outdir
emapper.py -i $fasta_file -o $output_dir --cpu 32

#can also do this uploading and running online
# scp fasta locally, and then upload online here
# http://eggnog-mapper.embl.de/



# then the names from this need to be used to place back into the 'gene_names' column, or as a new ID in the 9th column
# so that these names can be used for study, and plotting in manhattan plots
