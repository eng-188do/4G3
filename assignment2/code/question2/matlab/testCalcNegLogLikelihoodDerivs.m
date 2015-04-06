%run by result = runtests('testCalcNegLogLikelihoodDerivs')
%only one test
tol = 1e-5; %tolerance
expectedVector = [0.939907657; %calculated using excel
                  1.028091474; %wrt a_1,3
                  0.251718591; %wrt a_2,1
                  -1.113209281;
                  -15.84641968;
                  -6.78697228; %wrt a_3,2
                  0.000150743; %wrt b_1
                  -0.005599581 %wrt b_2
                  -0.894929175;];  

X = [ 18, 35, 10;
    12, 10, 32;
    2, 98, 12;
    3, 5, 64];

params = log([5; %a_1,2
              8; %a_1,3
              9; %a_2,1
              12; %a_2,3
              6; %a_3,1
              1; %a_3,2
              1; %b_1
              5; %b_2
              3;]); %b_3
          
[ negLogLikDerivs ] = calcNegLogLikelihoodDerivs( X, params );

assert(max(abs(expectedVector -  negLogLikDerivs)) <= tol);