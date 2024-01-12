#!/bin/bash

## merge lanes, all _1 and all _2
## take L7_1 and combine with L8_1 to make sampleID_1.fq.gz
## do the same for _2


for f1 in *_L8_1.fq.gz
do
	while [ `jobs | wc -l` -ge 70 ] ## check how many jobs are going and sleep if >= 70
	do
		sleep 5
	done
	f2=${f1%%_L8_1.fq.gz}"_L7_1.fq.gz"
	ff=${f1%%_L8_1.fq.gz}"_1.fq.gz"
	
	cat $f1 > ./merged/${ff}
	cat $f2 > ./merged/${ff} &
done

for f1 in *_L8_2.fq.gz
do
	while [ `jobs | wc -l` -ge 70 ] ## check how many jobs are going and sleep if >= 70
	do
		sleep 5
	done
	f2=${f1%%_L8_2.fq.gz}"_L7_2.fq.gz"
	ff=${f1%%_L8_2.fq.gz}"_2.fq.gz"
	
	cat $f1 > ./merged/${ff}
	cat $f2 > ./merged/${ff} &
done