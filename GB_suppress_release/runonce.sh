#!/bin/bash
for R in 2.4
do
    rs=$(echo $R | awk '{print $1/2}')
    echo CovidSim /c:8 /PP:preGB_R0=2.0.txt /P:p_NoInt.txt /CLP1:100000 /CLP2:0 /O:NoInt_R0=${R} /D:GB_pop2018.bin /S:NetworkGB_8T.bin /R:${rs} 98798150 729101 17389101 4797132
done
	 

