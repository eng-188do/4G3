function [y] =  LinearNeuron(x, w)
%LinearNeuron returns the output of a linear neuron.
%INPUTS:
%   x: column vector for firing of presynaptic cells.
%   w: column vector of weights for each of the synapses.
%OUTPUT:
%   y: float shoing the activity of the postsynaptic cell.
%
% completed by: eng-188do Feb. 2015

y = dot(x, w); %note if they are not appropriate vectors this should throw an error.

end