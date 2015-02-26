%%questionII_1c

clear all; close all;
rng(0);
xtest = [ones(1, 10000); zeros(1, 10000)];
W=Learn(xtest, 0.00001);

time=1:10000;
plot(time, W(1,:), time, W(2,:))
legend('neuron 1', 'neuron 2')
xlabel('time iteration')
ylabel('weight value')
