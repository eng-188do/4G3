function [ term1Prefactor, term2Prefactor ] = createDerivTermPrefactors( sigmaKSquared)
%createDerivTermPrefactors creates the prefactors for derivative opeartion.
%see my report for details on what these actually are.
%INPUT:
%   sigmaKSquared: N by k matrix of all the sigma sqaured values.
%OUTPUT:
%   see report for details but both N by k matrix

term1Prefactor = -1./(2*sigmaKSquared);
term2Prefactor = 1./(2*sigmaKSquared.^2);


end

