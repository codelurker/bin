#! /bin/sh

# DELETE OLD PVM.HOSTS
rm pvm.hosts >/dev/null 2>/dev/null

# DETERMINE IF I AM IN A VELOS OR A HPC
if `echo $HOSTNAME | grep hpc 1>/dev/null 2>&1`
then
   CLUSTER='hpc'
elif `echo $HOSTNAME | grep velos 1>/dev/null 2>&1`
then
   CLUSTER='velos'
else
   CLUSTER='desktop'
fi

echo Creating pvm.hosts file for $CLUSTER

# SET VARS TO WRITE ENTRIES FOR HPC CLUSTER
if [ $CLUSTER == hpc ]
then
   i1=2
   i2=26
   tt="lo=`whoami` sp=1001 ep=/home/`whoami`/config/bin wd=`pwd`"
   v1="&hpc"
	for i in `seq $i1 $i2`
	do
		echo $v1$i $tt >> pvm.hosts
	done
elif [ $CLUSTER == velos ]
then
   i1=23
   i2=52
   tt="lo=`whoami` sp=1001 ep=/home/`whoami`/config/bin wd=`pwd`"
   v1="&velos"
	for i in `seq $i1 $i2`
	do
		echo $v1$i $tt >> pvm.hosts
	done
fi

# SET VARS TO WRITE ENTRIES FOR A SINGLE WORKSTATION
if [ $CLUSTER == desktop ]
then
   tt="lo=`whoami` sp=1001 ep=/home/`whoami`/config/bin wd=`pwd`"
   v1="&$HOSTNAME"
	echo $v1 $tt >> pvm.hosts
fi

