#!/bin/bash

# USAGE=`top -b -n1 | head -n 50 | tail -n 48 | awk -F',' '{print $1}' | awk -F':' '{print $2}' | awk -F' ' '{print $1}'`
#

# Grab disc parameters from the disc.in and disc.setup files

dtmax=`grep -w tmax disc.in | awk '{print $3}'`
artvisc=`grep -w alpha disc.in | awk '{print $3}'`
rhocrit1=`grep -w rhocrit1 disc.in | awk '{print $3}'`
rhocrit2=`grep -w rhocrit2 disc.in | awk '{print $3}'`
rhocrit3=`grep -w rhocrit3 disc.in | awk '{print $3}'`
gamma1=`grep -w gamma1 disc.in | awk '{print $3}'`
gamma2=`grep -w gamma2 disc.in | awk '{print $3}'`
gamma3=`grep -w gamma3 disc.in | awk '{print $3}'`

resolution=`grep -w np disc.setup | awk '{print $3}'`
star_mass=`grep -w m1 disc.setup | awk '{print $3}'`
disc_mass=`grep -w disc_m disc.setup | awk '{print $3}'`
disc_radius=`grep -w R_out disc.setup | awk '{print $3}'`
r_inner=`grep -w R_in disc.setup | awk '{print $3}'`
p_index=`grep -w  pindex disc.setup | awk '{print $3}'`
q_index=`grep -w qindex disc.setup | awk '{print $3}'`

n_clumps=`awk END'{print $1}' restart_file`
n_sinks=`ls *.*.*.030 | wc -l`

UUID=`cat /proc/sys/kernel/random/uuid`
echo $UUID $star_mass $disc_mass $disc_radius $r_inner $p_index $q_index $dtmax\
 $artvisc $rhocrit1 $rhocrit2 $rhocrit3 $gamma1 $gamma2 $gamma3 $resolution $n_clumps $n_sinks $PWD\
>> ~/Documents/SPH_simulations/simulation_database.txt

echo $UUID >> simulation_UUID
echo "--------------------------------------------"
echo "          The UUID for this run is          "
echo      $UUID     
echo "--------------------------------------------" 
