# MMath-Project
Repository containing MATLAB code that I have written for my MMath project. Some of these codes are very similar to one another, but different files have been uploaded so that they run with parameter values that produces the plots in the project. 

SwitchingVaccinationRate.m, SIRODE.m, SIRODE2.m, VaxEvent1.m and VaxEvent2.m are all already shown in the appendix for my project. This running SwitchingVaccinationRate.m (which requires the other files mentioned in order to run) produces Figure 2.4. 

Figure 4.4 can be produced by running Proposition2poincare.m this requires deltanat.m, deltaint.m, Vax1.m and Vax2.m to run. 

Proposition2part1a.m corresponds to Figure 4.6 in my MMath project. This code requires deltanat.m, deltaint.m and TerminateNat2.m in order to run. Proposition2part1b.m corresponds to Figure 4.7 . It is identical to Proposition2part1a.m appart from a different value of Inat. Proposition2Part2.m corresponds to Figure 4.8, and requires the same files to run as Proposition2part1a.m, with the addition of Vdash.m. 

Figure 4.3 can be produced using the same code as Figure 4.8 - simply add % at the beginning of lines 24 and 34 of the code. 

Figure 5.1 can be produced by running Comparison_no_vax.m, which requires the same files as SwitchingVaccinationRate.m (namely, SIRODE.m, SIRODE2.m, VaxEvent1.m and VaxEvent2.m).
