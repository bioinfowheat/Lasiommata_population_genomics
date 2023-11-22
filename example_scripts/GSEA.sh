# or
geneID_GO=geneIDs_GOterms.tsv # 2 column, tab sep values
candidate_file=candidate_ID_list # one column list of gene IDs that are a subset of the IDs in geneID_GO
echo 'Parent,GO_term' | awk '{ gsub(",","\t",$0); print;}' | cat - "$geneID_GO".tsv > "$geneID_GO".header.tsv # add tab sep header
echo 'geneid' | cat - "$candidate_file" > "$candidate_file".header.tsv

Rscript /data/programs/scripts/GSEA_run_script.R $geneID_GO.header.tsv $candidate_file.header.tsv

# exemplar housekeeping commands
# zip internal_run6above95.zip *.GSEA_*
#
# scp chrwhe@duke.zoologi.su.se:/cerberus/projects/chrwhe/gobo/GSEA/gsea_gobo/internal_test/internal_run6above95.zip .
