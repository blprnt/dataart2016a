#!/bin/bash  
#PBS -l nodes=1:ppn=1:gpus=1:k80  
#PBS -l walltime=00:15:00  
#PBS -l mem=16GB  
#PBS -N sample_rnn
#PBS -M ross.goodwin@nyu.edu  
#PBS -j oe  
   
module purge  
module load cuda  
#module load cudnn  
module load torch-deps  
#module load torch
  
eval $(luarocks path --bin)
  
SRCDIR=$HOME/torch-rnn  
RUNDIR=$SCRATCH/rnn_generator/run-${PBS_JOBID/.*}  
mkdir -p $RUNDIR
  
cd $RUNDIR  
cp -R $SRCDIR/* $RUNDIR

FOOBAR="`cat $HOME/chomsky_seed.txt`"$'\n'

$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}colorless " -temperature 0.1 > output01.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}green " -temperature 0.1 > output02.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}ideas " -temperature 0.1 > output03.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}sleep " -temperature 0.1 > output04.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}furiously " -temperature 0.1 > output05.txt
  
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}colorless " -temperature 0.25 > output01a.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}green " -temperature 0.25 > output02a.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}ideas " -temperature 0.25 > output03a.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}sleep " -temperature 0.25 > output04a.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}furiously " -temperature 0.25 > output05a.txt

$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}colorless " -temperature 0.5 > output01b.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}green " -temperature 0.5 > output02b.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}ideas " -temperature 0.5 > output03b.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}sleep " -temperature 0.5 > output04b.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}furiously " -temperature 0.5 > output05b.txt

$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}colorless " -temperature 0.75 > output01c.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}green " -temperature 0.75 > output02c.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}ideas " -temperature 0.75 > output03c.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}sleep " -temperature 0.75 > output04c.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}furiously " -temperature 0.75 > output05c.txt

$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}colorless " -temperature 1.0 > output01d.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}green " -temperature 1.0 > output02d.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}ideas " -temperature 1.0 > output03d.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}sleep " -temperature 1.0 > output04d.txt
$HOME/torch/install/bin/th sample.lua -checkpoint $WORK/chomsky_checkpoints/chomsky2048_20000.t7 -length 1024 -start_text "${FOOBAR}furiously " -temperature 1.0 > output05d.txt

# leave a blank line at the end
