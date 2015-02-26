function y = NonlinearNeuron(x, w)
%NonlinearNeuron returns the output of a non-linear neuron.
%INPUTS:
%   x: column vector for firing of presynaptic cells.
%   w: column vector of weights for each of the synapses.
%OUTPUT:
%   y: float shoing the activity of the postsynaptic cell.
%
% completed by: eng-188do Feb. 2015

y = dot(x, w)^3; %note if they are not appropriate vectors this should throw an error.

end