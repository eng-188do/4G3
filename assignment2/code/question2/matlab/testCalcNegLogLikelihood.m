%run by result = runtests('testCalcNegLogLikelihood');
%only one test
tol = 1e-5; %tolerance
expectedValue = 86.55731456; %calculated using excel

X = [ 41, 10, 03;
      61, 19, 88;
      32, 59, 61;
      34, 12, 10;
      19,  7, 89];

params = log([8; %a_1,2
              5; %a_1,3
              3; %a_2,1
              2; %a_2,3
              5; %a_3,1
              10; %a_3,2
              1; %b_1
              4; %b_2
              9;]); %b_3
          
[ negLogLik ] = calcNegLogLikelihood( X, params );

assert(abs(expectedValue -  negLogLik) <= tol);