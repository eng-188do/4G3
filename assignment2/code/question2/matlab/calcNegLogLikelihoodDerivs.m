function [ negLogLikDerivs ] = calcNegLogLikelihoodDerivs( X, params )
%calcNegLogLikelihoodDerivs calculates the negative log likelihood derivs wrt params.
%INPUT
%   X: is the mnatrix of x values, referenced x_n,k
%   -pamans = log([a11;a12;a13; ...; a256,256; b1; ...;b256;]);(col vector)
%OUTPUT
%   negLogLikDerivs: negative of the log likelihood derivs, see assignment sheet/report
%       for its definition.

N = size(X,1);
K = size(X,2);
[ aMatrix, bColVector ] = unlogParams( params, K );
sigmaKSquared = calcSigmaKSquared(X, aMatrix, bColVector);

aDerivs = calcADerivs(X, aMatrix, sigmaKSquared);
bDerivs = calcBDerivs(X, bColVector, sigmaKSquared);

%Convert back to the param vector form:
%(note how we also times by the respective orig matrix as we want the term
% differentiated wrt to the log of the param)
negLogLikDerivs = reVectorParams(aDerivs.*aMatrix, bDerivs.*bColVector);


end

