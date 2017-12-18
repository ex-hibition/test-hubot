#!/bin/bash

block='```'

echo $block
echo 'hostname:' `hostname`
echo 'date:' `date +"%Y/%m/%d %H:%M:%S"`
echo ''
df -h
echo $block
