#!/bin/bash

## fix and filter sams
## pre-picard processing

## output should be fix_q20_sorted.sam files

for f1 in *.sam
do
        while [ `jobs | wc -l` -ge 20 ] ## check how many jobs are going and sleep if >= 20
        do
                spinner sleep 5
        done
		
		samtools fixmate
		samtools view
		samtools sort
		samtools index
		
& done