#!/bin/sh

## run in raw directory to sweep all .fq.gz files to fqgz folder in data directory

find . -name \*fq.gz -exec ln -s {} "/home/grh/data_seq/fqgz/" \;

