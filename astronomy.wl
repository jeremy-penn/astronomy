(* ::Package:: *)

(* Beging Package *)

BeginPackage["astronomy`"]
maxwellDistribution::usage = "Calculates the maxwell velocity distribution as a function of the velocity"
boltzmann::usage = "Calculate the boltzmann factor for a given energy difference"
I::usage = "Calculates the intensity of \[Lambda]"
\[Tau]::usage = "Calculate the optical depth of \[Lambda]"

 Begin["`Private`"]
 k = 1.381 10^-23; (*boltzmann constant [J/K]*)
 maxwellDistribution[v_,m_,T_] := (m/(2 \[Pi] k T))^(3/2) 4 \[Pi] v^2 Exp[(-m v^2)/(2 k T)];
 Subscript[I, \[Lambda]]:= Subscript[I, 0] Exp[-Subscript[\[Kappa], \[Lambda]] \[Rho] s];
 Subscript[\[Tau], \[Lambda]]:= Subscript[\[Kappa], \[Lambda]] \[Rho] s;
 
 End[]
EndPackage[]



