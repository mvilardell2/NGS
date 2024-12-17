# Download FASTQ files using SRA toolkit

Two scripts:

- sra_download1.sh: uses prefetch + fasterq --split-files.

- sra-download2.sh: directly fasterq.

In theory, first file (sra_download1.sh) is faster. If it fails, use the sra_download2.sh script to download data. 
Both need a list with the SRA run code to be downloaded. 

Another way to download fastq files is going to: https://sra-explorer.info/ ,  entering the SRA accession number, and downloading the bash script (curl -L ftp://...)

### COMMANDS: 

prefetch SRA_run_code

fasterq-dump --split-files SRA_run_code
