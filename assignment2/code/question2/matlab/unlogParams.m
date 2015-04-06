function [ aMatrix, bColVector ] = unlogParams( params, K )
%unlogParams unlogs the parameters and arranges them into seperate
%matrices
%INPUT:
%   -pamans = log([a12;a13; ...; a256,255; b1; ...;b256;]);(col vector)
%   -k is the number of components (same notation as assignment sheet)
%OUTPUT
%   -aMatrix = [ a11 a12 a13 ... a1 256; a21 a22 ...];
%   -bvector = [b1, b2, b3 ... b256]' (ie col vector)
params = exp(params); %remove out of logspace
aVector = params(1:K*(K-1));
bColVector = params(K*(K-1)+1:end);
assert( length(bColVector) == K); %quick check that params is right length.
aMatrix = nan(K,K);

%fill up the a matrix, putting zeros in the a_k,k places as never used.
for rowIndex=1:K
    aMatrix(rowIndex,:) = [aVector((K-1)*(rowIndex-1)+1:(K-1)*(rowIndex-1)+rowIndex-1)', ...
                            0, ...
                            aVector((K-1)*(rowIndex-1)+rowIndex:(K-1)*(rowIndex))'];
end
end

