
# NGI ID	User ID	Mreads	≥Q30
P25152_101	H1	33.91	90.26


#
P25152_117	H20	27.13	90.64
has a high 58% GC content, and 25% to 55% dupication level.
when we check this in the delivery, nothing in the fastq screen is > 2 %, though some samples
appear to ahve E. coli, perhaps due to infection or early death.
# 115 to 118, and others.


P25152_142	R24	35.79	91.55


# read amounts, the V samples look pretty low, down around 10 M
# V14 appears to have only 3.8 M reads per pair.
P25152_183	V14	25.42	89.73		3.8 M reads per pair after filting, but had 25 M before filtering
P25152_175	V4	12.32	89.58		10.7 M reads per pair after filting, but had 12 M before filtering, resultin gin about 5 X coverage


grep -E '.gz and|clone reads|Input:|Result:' ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/all_files.log.txt  | cut -f1,3 -d ',' | tr -d '\r\n' | tr -s " " |\
awk '{gsub("\t","",$0); print;}' | sed 's/P25152_/\n/g' |sed 's/_R1_001.fastq.gz//g' |\
sed -e 's/ and/,/g' -e 's/ pairs of reads input. /,/g' -e 's/ pairs of reads output. /,/g' -e 's/ pairs of reads /,/g' -e 's/ clone reads.Input: /,/g' -e 's/Input: /,/g' -e 's/ reads /,/g' -e 's/ bases.Result: /,/g' -e 's/ bases /,/g' -e 's/) /,/g' -e 's/ reads /,/g' -e 's/) bases //g' -e 's/(//g' -e 's/)//g' |\
sed 1d | sed '1 i file,clonefilter_in_pairs,clonefilter_out_pairs,clonefilter_percent_remaining,adapter_in_reads,adapter_in_bases,adapter_out_reads,adapter_out_reads_pct,adapter_out_bases,adapter_out_bases_pct,qualtrim_in_reads,qualtrim_in_bases,qualtrim_out_reads,qualtrim_out_reads_pct,qualtrim_out_bases,qualtrim_out_bases_pct' | \
column -t -s ',' | grep 'P25152_183'

# when looking through the log file, we find that the cleaning had died ...
more ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/all_files.log.txt


Phred-encoding
==============
sanger  fastq   gz      single-ended    151bp

Clone filter
============
Reading data from:
  P25152_183_S133_L003_R1_001.fastq.gz and
  P25152_183_S133_L003_R2_001.fastq.gz
Writing data to:
  ./P25152_183_S133_L003_R1_001.fastq.fil.fq_1 and
  ./P25152_183_S133_L003_R2_001.fastq.fil.fq_2
25419911 pairs of reads input. 24438019 pairs of reads output, discarded 981892 pairs of reads, 3.86% clone reads.

Adapter filter
==============
java -Djava.library.path=/data/programs/bbmap_34.86/jni/ -ea -Xmx329610m -Xms329610m -cp /data/programs/bbmap_34.86/current/ jgi.BBDukF in=P25152_183_S133_L003_R1_001.fastq.fil.fq_1 in2=P25152_183_S133_L003_R2_001.fastq.fil.fq_2 o
ut=temp_1.fq out2=temp_2.fq ref=/data/programs/bbmap_34.86/resources/truseq.fa.gz,/data/programs/bbmap_34.86/resources/nextera.fa.gz ktrim=r k=23 mink=11 hdist=1 overwrite=t
Executing jgi.BBDukF [in=P25152_183_S133_L003_R1_001.fastq.fil.fq_1, in2=P25152_183_S133_L003_R2_001.fastq.fil.fq_2, out=temp_1.fq, out2=temp_2.fq, ref=/data/programs/bbmap_34.86/resources/truseq.fa.gz,/data/programs/bbmap_34.86/r
esources/nextera.fa.gz, ktrim=r, k=23, mink=11, hdist=1, overwrite=t]

BBDuk version 34.86
maskMiddle was disabled because useShortKmers=true
Initial:
Memory: free=345560m, used=84m

Added 140059 kmers; time:       0.151 seconds.
Memory: free=345375m, used=269m

Input is being processed as paired
Started output streams: 3.706 seconds.
java.lang.AssertionError:
Mismatch between length of bases and qualities for read 4231066 (id=A00621:714:HNVFFDSX3:3:1407:29776:17456 1:N:0:TATCCGAGGC+CTTATTGGCC).
# qualities=151, # bases=131241

FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
ACTTTGACTTTGTTCGCCACAAACTACGGCTATAAACCTACCTATTTACCTATAGCTATTACGATTGGTGGTACTCCAAACTG

grep '.gz and' ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/all_files.log.txt | more
P25152_160_S110_L003_R1_001.fastq.gz and
P25152_160_S110_L003_R1_001.fastq.gz and
P25152_161_S111_L003_R1_001.fastq.gz and
Binary file /home/chrwhe/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/cleaning_data/all_files.log.txt matches

grep '.gz and' 160_end.log.txt | more # binary error
