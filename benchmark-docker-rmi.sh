#!/bin/bash

echo ""
echo "////////////////////////////////////////////"
echo "/// Starting random r/w on many files (sysbench):"
echo "////////////////////////////////////////////"
sysbench --test=fileio --file-num=5000 --file-total-size=2000000K --file-test-mode=rndrw --max-time=300 --num-threads=1 prepare