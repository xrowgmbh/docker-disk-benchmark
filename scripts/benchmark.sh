#!/bin/bash

echo "////////////////////////////////////////////"
echo "/// Starting many Threads (sysbench):"
echo "////////////////////////////////////////////"
sysbench --test=fileio --file-num=500 --file-total-size=500M --file-test-mode=rndrw --max-time=300 --num-threads=10 prepare
sysbench --test=fileio --file-num=500 --file-total-size=500M --file-test-mode=rndrw --max-time=300 --num-threads=10 run
sysbench --test=fileio --file-num=500 --file-total-size=500M --file-test-mode=rndrw --max-time=300 --num-threads=10 cleanup

echo ""
echo "////////////////////////////////////////////"
echo "/// Starting many small files (dd):"
echo "////////////////////////////////////////////"
dd if=/dev/zero of=/root/testfile bs=4k count=50000 oflag=direct

echo ""
echo "////////////////////////////////////////////"
echo "/// Starting many small files (sysbench):"
echo "////////////////////////////////////////////"
sysbench --test=fileio --file-block-size=4K --file-num=5000 --file-total-size=20000K --file-test-mode=rndrw --max-time=300 --num-threads=1 prepare
sysbench --test=fileio --file-block-size=4K --file-num=5000 --file-total-size=20000K --file-test-mode=rndrw --max-time=300 --num-threads=1 run
sysbench --test=fileio --file-block-size=4K --file-num=5000 --file-total-size=20000K --file-test-mode=rndrw --max-time=300 --num-threads=1 cleanup

echo ""
echo "////////////////////////////////////////////"
echo "/// Starting random r/w on many files (sysbench):"
echo "////////////////////////////////////////////"
sysbench --test=fileio --file-num=5000 --file-total-size=2000000K --file-test-mode=rndrw --max-time=300 --num-threads=1 prepare 
sysbench --test=fileio --file-num=5000 --file-total-size=2000000K --file-test-mode=rndrw --max-time=300 --num-threads=1 run 
sysbench --test=fileio --file-num=5000 --file-total-size=2000000K --file-test-mode=rndrw --max-time=300 --num-threads=1 cleanup 

echo ""
echo "////////////////////////////////////////////"
echo "/// Starting random r/w on large files (sysbench):"
echo "////////////////////////////////////////////"
sysbench --test=fileio --file-num=10 --file-total-size=10G --file-test-mode=rndrw --max-time=300 --num-threads=1 prepare
sysbench --test=fileio --file-num=10 --file-total-size=10G --file-test-mode=rndrw --max-time=300 --num-threads=1 run
sysbench --test=fileio --file-num=10 --file-total-size=10G --file-test-mode=rndrw --max-time=300 --num-threads=1 cleanup
