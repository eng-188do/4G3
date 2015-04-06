function rearrangedParams = reVectorParams(aParams, bParams)
%reVectorParams Arranges the paramaters back into a  vector
%INPUT:
%   -aParams: square matrix of the a params, ie a_k,j.
%   -bParams: col vector of the b_k values
%OUTPUT:
%   -rearrangedParams: [a11;a12;a13; ...; a256,256; b1; ...;b256;];(col vector)

K = length(bParams);

% Quick check that size of data is consistent.
assert(K == size(aParams, 1))
assert(K == size(aParams, 2))

rearrangedParams = nan(K*(K-1)+K,1); % initialise o/p vector
rearrangedParams(K*(K-1)+1:end) = bParams; % slot in the bvector at end.

% Now go through the rows of the a matrix and add the relevant entried.
for k=1:K
    removeDiagRow = [aParams(k,1:k-1), aParams(k,k+1:end)];
    rearrangedParams((k-1)*(K-1)+1:k*(K-1)) = removeDiagRow';
end

end

