function sigmaKSquared = calcSigmaKSquared(X, aMatrix, bColVector)
%calcSigmaKSquared calcs the sigma k squared values for each n and k
%INPUTS
%   X: the component data, ie x_n,k
%   aMatrix: matrix of a_k,j
%   bColVector: [b1; b2; ...; b256] (if k =256)
%   N: number of images sampled from
%   k: number of components
%OUTPUT
%   sigmaKSquared: N by k matrix of all the sigma k squared matrices.

[N, K] = size(X);
sigmaKSquared = nan(N, K);

% check we have been given consitently sized matrices
assert(K == size(aMatrix,1));
assert(K == size(aMatrix,2));
assert(K == length(bColVector));

%go through and calulate sigma^2_n,k for one k for all ns at once.
for k=1:K
    akComponents = aMatrix(k,:);
        % repeat this matrix downwards:
    akComponents = repmat(akComponents, N, 1);
    sigmaKSquared(:, k) = sum(akComponents.*X.^2,2) + bColVector(k);
end  

end
