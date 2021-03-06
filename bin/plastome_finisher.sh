#!/bin/bash

perl Fast-Plast_master/bin/sequence_based_ir_id.pl $1_afin.fa $1 2

blastn -query $1_regions_split2.fsa -db  Fast-Plast_master/bin/position_genes.fsa -evalue 1e-10 -outfmt 6 > $1.split2.blastn

perl Fast-Plast_master/bin/orientate_plastome.pl $1_regions_split2.fsa $1.split2.blastn $1

mv $1_FULLCP.fsa $1_2_FULLCP.fsa

perl Fast-Plast_master/bin/sequence_based_ir_id.pl $1_afin.fa $1 3

blastn -query $1_regions_split3.fsa -db Fast-Plast_master/bin/position_genes.fsa -evalue 1e-10 -outfmt 6 > $1.split3.blastn

perl Fast-Plast_master/bin/orientate_plastome.pl $1_regions_split3.fsa $1.split3.blastn $1

mv $1_FULLCP.fsa $1_3_FULLCP.fsa


