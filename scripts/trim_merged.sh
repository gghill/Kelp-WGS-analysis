#!/bin/bash

## Here you can include comments that explain why you chose, for
## example to use --stringency 3 or whatever else.
## stringency 3 to avoid trimming natural sequences that look like adapter fragments
## quality 30 based on initial fastqc (results good enough to be more restrictive)

## do the same as before but on merged sequences

for f1 in ./merged/*_1.fq.gz
do
	while [ `jobs | wc -l` -ge 70 ] ## check how many jobs are going and sleep if >= 70
	do
		sleep 5
	done
	f2=${f1%%_1.fq.gz}"_2.fq.gz"
	trim_galore \
		--output_dir ../trimmed/ \
		--illumina \
		--stringency 3 \
		--quality 30 \
		--paired \
		--retain_unpaired \
		--length_1 21 \
		--length_2 21 \
		--fastqc_args "-t 60 -f fastq -o ../fastqc_trimmed/" \
		$f1 $f2 &
done

for f1 in ./merged/*_1.fq.gz
do
	while [ `jobs | wc -l` -ge 70 ] ## check how many jobs are going and sleep if >= 70
	do
		sleep 5
	done
	f2=${f1%%_1.fq.gz}"_2.fq.gz"
	trim_galore \
		--output_dir ../trimmed/ \
		--illumina \
		--stringency 3 \
		--quality 30 \
		--paired \
		--retain_unpaired \
		--length_1 21 \
		--length_2 21 \
		--fastqc_args "-t 60 -f fastq -o ../fastqc_trimmed/" \
		$f1 $f2 &
done

