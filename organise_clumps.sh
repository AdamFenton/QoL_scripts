#!/bin/bash
for i in $(seq -f "%03g" $1 $2)
do 
mkdir clump$i clump$i/fortran_outputs 
~/Documents/SPH_simulations/phantom/bin/phantom2hdf5 run*.$i.*
mv run*.$i.*.*.h5 clump$i
cp run*.$i.*.* clump$i/fortran_outputs
cp $i.dat clump$i
cp clumps_and_sinks$i.dat clump$i
done
