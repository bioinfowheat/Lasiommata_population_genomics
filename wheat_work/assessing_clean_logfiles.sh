# The cleaning script produces a log file (log.txt) which needs to be parsed into a .csv
grep -E '.gz and|clone reads|Input:|Result:' all_files.log.txt  | cut -f1,3 -d ',' | tr -d '\r\n' | tr -s " " |\
awk '{gsub("\t","",$0); print;}' | sed 's/P25152_/\n/g' |sed 's/_R1_001.fastq.gz//g' |\
sed -e 's/ and/,/g' -e 's/ pairs of reads input. /,/g' -e 's/ pairs of reads output. /,/g' -e 's/ pairs of reads /,/g' -e 's/ clone reads.Input: /,/g' -e 's/Input: /,/g' -e 's/ reads /,/g' -e 's/ bases.Result: /,/g' -e 's/ bases /,/g' -e 's/) /,/g' -e 's/ reads /,/g' -e 's/) bases //g' -e 's/(//g' -e 's/)//g' |\
sed 1d | sed '1 i file,clonefilter_in_pairs,clonefilter_out_pairs,clonefilter_percent_remaining,adapter_in_reads,adapter_in_bases,adapter_out_reads,adapter_out_reads_pct,adapter_out_bases,adapter_out_bases_pct,qualtrim_in_reads,qualtrim_in_bases,qualtrim_out_reads,qualtrim_out_reads_pct,qualtrim_out_bases,qualtrim_out_bases_pct' | \
column -t -s ',' | head

file		   clonefilter_in_pairs  clonefilter_out_pairs  clonefilter_percent_remaining							adapter_in_reads  adapter_in_bases  adapter_out_reads  adapter_out_reads_pct  adapter_out_bases  adapter_out_bases_pct  qualtrim_in_reads  qualtrim_in_bases  qualtrim_out_reads  qualtrim_out_reads_pct  qualtrim_out_bases  qualtrim_out_bases_pct
101_S51_L003   33911889			  32335845			   4.65%													64671690		  9765425190		64666680		   99.99%				 9632330549		 98.64%				 64666680		   9632330549		 58898876			91.08%				  8310966201		  86.28%
102_S52_L003   25521740			  24498579			   4.01%													48997158		  7398570858		48993106		   99.99%				 7303168855		 98.71%				 48993106		   7303168855		 44484814			90.80%				  6268539168		  85.83%
103_S53_L003   18551177			  17925176			   3.37%													35850352		  5413403152		35847708		   99.99%				 5346173016		 98.76%				 35847708		   5346173016		 31992488			89.25%				  4464965622		  83.52%
104_S54_L003   27959364			  26919240			   3.72%													53838480		  8129610480		53834058		   99.99%				 8025950200		 98.72%				 53834058		   8025950200		 48295082			89.71%				  6758397268		  84.21%
105_S55_L003   20896724			  20007887			   4.25%													40015774		  6042381874		40012044		   99.99%				 5964585532		 98.71%				 40012044		   5964585532		 36129212			90.30%				  5072266380		  85.04%
106_S56_L003   29019601			  27768436			   4.31%													55536872		  8386067672		55532566		   99.99%				 8266142050		 98.57%				 55532566		   8266142050		 50461910			90.87%				  7099883742		  85.89%
107_S57_L003   32537527			  31000140			   4.72%													62000280		  9362042280		61994550		   99.99%				 9239777392		 98.69%				 61994550		   9239777392		 56439414			91.04%				  7952264860		  86.07%
108_S58_L003   45558144			  43641644			   4.21%													87283288		  13179776488	   87277258		   99.99%				 13018157821		98.77%				 87277258		   13018157821		79212630			90.76%				  11149836748		 85.65%
109_S59_L003   37463505			  35626950			   4.90%													71253900		  10759338900	   71248532		   99.99%				 10589710041		98.42%				 71248532		   10589710041		64606738			90.68%				  9096641370		  85.90%


# now run this for all files, save it as a *.csv file, and then open it in excel to see how it looks.
# then go back to original log file, look at some random file, and see if this information is correct,
# that is, do a spot check by eye to make sure the parsing of the file is being done correctly.


# double checking some of the files based upon fastqc output.
