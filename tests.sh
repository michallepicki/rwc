#!/bin/bash
set -e

echo "TEST 01------------------------\n"
echo -e "1.0\n2.0\n-0.5" | ./run.sh 01 > output_01
cmp expected_output_01 output_01
rm output_01

echo "TEST 02------------------------\n"
./run.sh 02 > output_02
cmp expected_output_02 output_02
rm output_02

echo "TEST 03------------------------\n"
./run.sh 03 > output_03
cmp expected_output_03 output_03
rm output_03
