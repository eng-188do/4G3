function [ f, derivs ] = assessLogLikelihood( params, X )
%assessLogLikelihood Assesses the loglikelihood at position X and looks at
%its gradient. Used nby minimize as f.
%INPUT:
%   -params; the params : log([a11;a12;a13; ...; a256,256; b1; ...;b256;]);(col vector)
%   -X: the componets for each image ie x_n,k
%OUTPUT:
%   -f: negative of log likelihood
%   -derivs: derivatives of neg log likelihood wrt to params

f = calcNegLogLikelihood( X, params );
derivs = calcNegLogLikelihoodDerivs( X, params );

end

