function [W] = Learn(x, eta)
%Learn: performs learning of the weights over many time steps.
%INPUTS:
%   x: the presynaptic activity for 2 neurons (columns) (2 by T matrix)
%   eta: the learning rate
%OUTPUTS:
%   W: the synaptic weights for each time step (as col vectors) in a (2 by
%      T) matrix
%
% completed by: eng-188do Feb. 2015

%just check that we are only dealing with two presynamptic neurons
%this is important as the number of weights is hardcoded in at 2 below.
assert( size(x,1) == 2, 'Not using 2 presynaptic neurons');

% initializations
T = size(x,2); % number of simulated time steps

% initialized the weights to be random, but normalized
wCurrent = randn(2,1);
wCurrent = wCurrent/norm(wCurrent);

% temporary matrix to store the temporal evolution of the weights
W = nan(2,T); % using nans as more obvious to spot if soemthings gone wrong.

% run through all time steps
for i=1:T    
    % update output
    y = LinearNeuron(x(:,i), wCurrent);
    
    % update weights
    wCurrent = UpdateWeights(x(:,i), y, wCurrent, eta);
    
    % store current weight in W
    W(:,i) = wCurrent;    
end

end