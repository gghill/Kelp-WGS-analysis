#!/bin/bash

## Mark dupes

## processing our sam files to be ready for visualization and variant discovery
## run in /sams/ folder

## removing secondary and unmapped reads
## filter reads with a mapping quality <20

for f1 in *.sorted.sam
do
        while [ `jobs | wc -l` -ge 20 ] ## check how many jobs are going and sleep if >= 20
        do
                spinner sleep 5
        done
	ff= ${f1%%EKDL230052793-1A_22GVJWLT3__pair.sam}
	java -jar $PICARD MarkDuplicates \
	INPUT=$f1 \
	OUTPUT="${ff}_dedup.sam" \
	METRICS_FILE="${ff}_Aligned_metricsfile" \
	ASSUME_SORTED=true \
	VALIDATION_STRINGENCY=SILENT \
	REMOVE_DUPLICATES=true