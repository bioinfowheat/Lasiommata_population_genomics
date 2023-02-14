# running multiQC

# installing in my user account
pip install multiqc


# video tutorial
https://youtu.be/cktKbESOOno

# go to the multiqc folder where all the runs will be conducted
# just ran a subset into two separate folders
head -6 ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc/raw/fastqc_jobs_rawreads.txt | parallel {}
head -6 ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc/clean/fastqc_jobs.txt | parallel {}



# go into their root folder
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc

# run multiqc
multiqc .
# output
/// MultiQC 🔍 | v1.13

|           multiqc | MultiQC Version v1.14 now available!
|           multiqc | Search path : /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Lasiommata_popgen/read_qc
|         searching | ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 26/26
|            fastqc | Found 12 reports
|           multiqc | Compressing plot data
|           multiqc | Report      : multiqc_report.html
|           multiqc | Data        : multiqc_data
|           multiqc | MultiQC complete

# download to local computer and then open it.
scp chrwhe@miles.zoologi.su.se:~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc/multiqc_report.html .



#####################

# here is the output
  /// MultiQC 🔍 | v1.13

|		   multiqc | Search path : /smb/zootis.zoologi.su.se/chrwhe/Elizabeth/Lasiommata_popgen/read_qc
|		 searching | ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 13/13
|			fastqc | Found 6 reports
|		   multiqc | Compressing plot data
|		   multiqc | Report	  : multiqc_report.html
|		   multiqc | Data		: multiqc_data
|		   multiqc | MultiQC complete

# check the output by copying the HTML to your local computer and opening it
# I would go to my local computer, via the terminal go to my Downloads folder, then use this
# command to transfer the file to this Downloads folder
scp chrwhe@miles.zoologi.su.se:~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc/multiqc_report.html .

# this works great.

# now, in this same folder read_qc, you want to run lots of things. I recommend doing fastQC again on your
# raw data, so that you have the output that you can quickly compare.

# just ran fastQC again on the raw data, 6 files, now running multiqc again
cd ~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc
multiqc .
# local
scp chrwhe@miles.zoologi.su.se:~/zootis.zoologi.su.se/Elizabeth/Lasiommata_popgen/read_qc/multiqc_report.html .

# OK, so the name for parsing is only taken up till the first '.', so we need to have the names be a bit different
# based upon the soft links
