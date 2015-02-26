function [w] = UpdateWeights(x, y, w, learningRate)
%UpdateWeights performs Hebbian update then normalisation of weights.
%INPUTS:
%   x: presynaptic activity (col vector)
%   y: postsynaptic activity (float)
%   w: weight vector (col vector)
%   learningRate: is eta, the learning rate (float)
%OUTPUTS:
%   w: the new weights (col vector)
%
% completed by: eng-188do Feb. 2015

%just checking input data is in the format we expect.
assert(size(x,2)==1,'x is not a col vector');
assert(size(w,2)==1,'w is not a col vector');
assert(numel(learningRate)==1,'learningRate is not a single value');
assert(numel(y)==1,'y is not a single value');

% update the weight according to the Hebb rule
w = w + learningRate*x*y;

% and normalize them
w = w/norm(w);

end
	