# Implementation-of-a-5-stage-RISC-processor
In this project, we have implemented a SimpleRisc processor with a 5-stage pipeline. It has been implemented in LogiSim. This processor runs all SimpleRisc instructions and can execute any valid SimpleRisc program to give correct outputs (provided the instructions are given in binary/hexadecimal).

## Conflict Detection Unit

Reducing OPcode of (nop,b,beq,bgt,call), we get AB'C' + A'BCD'E
Reducing OPcode of (nop,cmp,st,beq,bgt,ret), we get A'CD'E + A'BCE + AB'C'D' + AB'C'E' + AB'D'E'
