#!/bin/bash
wla-z80 -o object.o SMSM.asm
echo [objects]>linkfile
echo object.o>>linkfile
wlalink -d -r -v -s linkfile output.sms
rm linkfile
rm object.o
rm output.sym
echo 'COMPILED SUCCESSFULLY!'
