#!/bin/bash
## bowtie v1

## run bowtie2 with defaults
## decently sensitive

for f1 in /data/grh/trimmed/*1_val_1.fq.gz
do
        while [ `jobs | wc -l` -ge 20 ] ## check how many jobs are going and sleep if >= 20
        do
                spinner sleep 5
        done
        f2=${f1%%1_val_1.fq.gz}"2_val_2.fq.gz"
        ff=${f1%%1_val_1.fq.gz}"_pair.sam"
		ff=${ff##*trimmed/}
        bowtie2 -x Sacc_lat_AJ_bow2 --mm -1 $f1 -2 $f2 -p 3 -S ${ff} \ &
done
mv *.sam /data/grh/sams/