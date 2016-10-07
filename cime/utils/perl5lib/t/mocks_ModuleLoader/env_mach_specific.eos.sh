#!/usr/bin/env sh -f 
#===============================================================================
# Automatically generated module settings for eos
# DO NOT EDIT THIS FILE DIRECTLY!  Please edit env_mach_specific.xml 
# in your CASEROOT. This file is overwritten every time modules are loaded!
#===============================================================================

.  /opt/modules/default/init/sh
CIME_REPO=`./xmlquery CIME_REPOTAG -value`
if [ -n $CIME_REPO  ]
then 
  COMPILER=`./xmlquery  COMPILER          -value`
  MPILIB=`./xmlquery  MPILIB        -value`
  DEBUG=`./xmlquery  DEBUG         -value`
  OS=`./xmlquery  OS        -value`
  PROFILE_PAPI_ENABLE=`./xmlquery  PROFILE_PAPI_ENABLE -value`
fi
module rm intel 
module rm cray 
module rm cray-parallel-netcdf 
module rm cray-libsci 
module rm cray-netcdf 
module rm cray-netcdf-hdf5parallel 
module rm netcdf 
if [ "$COMPILER" = "intel" ]
then
	module load intel/14.0.2.144
fi
if [ "$COMPILER" = "cray" ]
then
	module load PrgEnv-cray
	module switch cce cce/8.1.9
	module load cray-libsci/12.1.00
fi
if [ "$COMPILER" = "gnu" ]
then
	module load PrgEnv-gnu
	module switch gcc gcc/4.8.0
	module load cray-libsci/12.1.00
fi
module load cray-mpich/7.0.4 
if [ "$MPILIB" = "mpi-serial" ]
then
	module load cray-netcdf/4.3.2
fi
if [ "$MPILIB" != "mpi-serial" ]
then
	module load cray-netcdf-hdf5parallel/4.3.2
	module load cray-parallel-netcdf/1.5.0
fi
module load cmake/2.8.11.2 
export MPICH_ENV_DISPLAY=1
export MPICH_VERSION_DISPLAY=1
