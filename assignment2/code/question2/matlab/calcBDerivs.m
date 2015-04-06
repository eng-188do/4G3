function bDerivs = calcBDerivs(X, bColVector, sigmaKSquared)
%calcBDerivs Calulates the derivs wrt to the b_k values
%INPUT:
%   -X: the components ie x_n,k
%   -bColVector: [b_1;b_2;...];
%   -sigmaKSquared: is the sigma square dmatrix referenced by n,k
%OUTPUT:
%   -bDerivs: the derivatives wrt to each b value stacked up in a column
%   vector

[N, K] = size(X);

% ensure the matrix sizes are all consistent:
assert(K == length(bColVector));
assert(K == size(sigmaKSquared, 2));
assert(N == size(sigmaKSquared, 1));

% see report for what the prefactors below mean:
[ term1Prefactor, term2Prefactor ] = createDerivTermPrefactors( sigmaKSquared);

bDerivs = term1Prefactor + term2Prefactor.*X.^2;
bDerivs = - sum(bDerivs)';

end

