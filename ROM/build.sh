#!/bin/bash
wla-z80 -o 'SMSM.asm' object.o
echo [objects]>linkfile
echo object.o>>linkfile
wlalink -drvs linkfile output.sms
rm linkfile
rm object.o
rm output.sym
echo 'COMPILED SUCCESSFULLY!'
