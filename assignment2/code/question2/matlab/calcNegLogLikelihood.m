function [ negLogLik ] = calcNegLogLikelihood( X, params )
%calcNegLogLikelihood calculates the negative log likelihood.
%INPUT
%   X: is the mnatrix of x values, referenced x_n,k
%   -params = log([a11;a12;a13; ...; a256,256; b1; ...;b256;]);(col vector)
%OUTPUT
%   negLogLik: negative of the log likelihood, see assignment sheet/report
%       for its definition.

N = size(X,1);
K = size(X,2);
[ aMatrix, bColVector ] = unlogParams( params, K );
individualLogLikes = zeros(N, K); % to store the probability terms for each value.
individualLogLikes = individualLogLikes-0.5 * log(2*pi);
sigmaKSquared = calcSigmaKSquared(X, aMatrix, bColVector);
individualLogLikes = individualLogLikes -0.5*log(sigmaKSquared);
individualLogLikes = individualLogLikes - 0.5 * X.^2 ./ sigmaKSquared;

negLogLik = -sum(individualLogLikes(:)); % note negativeas want to maximise the negative of this 
end

