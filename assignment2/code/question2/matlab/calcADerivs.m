function [aDerivs] = calcADerivs(X, aMatrix, sigmaKSquared);
%calcADerivs Calculates the derivates with respect to the a params
%INPUT:
%   -X: component data, x_n,k
%   -amtrix: a_k,j
%   -sigmaKSquared: sigma sqaured matrix. N by K
%OUTPUT:
%   -aDerivs K by K deriv matrix

[N, K] = size(X);
aDerivs = nan(K, K); %wrt to a_k,j. allocate array

%just do some assertions to make sure that the values are the correct size.
assert(N == size(sigmaKSquared,1));
assert(K == size(sigmaKSquared,2));
assert(K == size(aMatrix,1));
assert(K == size(aMatrix,2));


[ term1Prefactor, term2Prefactor ] = createDerivTermPrefactors( sigmaKSquared);

%we now stack these prefactors so that they have N going along the third
%dimension. They have k along first index.
term1Prefactor = permute(term1Prefactor,[2,3,1]);
term1Prefactor = repmat(term1Prefactor,1,K,1);
term2Prefactor = permute(term2Prefactor,[2,3,1]);
term2Prefactor = repmat(term2Prefactor,1,K,1);

%x ks vary aliong the first index, N along third index
xksRepeated = reshape(X',K,1,N);  
xksRepeated = repmat(xksRepeated, 1, K, 1);

%x js vary aliong the second index, N along third index
xjsRepeated = permute(xksRepeated,[ 2, 1, 3]);

aDerivs = (term1Prefactor + term2Prefactor.*xksRepeated.^2).*xjsRepeated.^2;
aDerivs = -sum(aDerivs,3);  % sum up against all of the N values.
aDerivs(logical(eye(K))) = 0;  %set the self derivatives to zero.
end

