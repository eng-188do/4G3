%run by result = runtests('testGradientCheck');
%Script to check that checkgrad is working
X = [ 12, 10, 09;
      61, 19,  8;
      32, 61, 61;
      10, 12, 10;
      19, 27, 07];

tol = 1e-5;
params = log([8; %a_1,2
              9; %a_1,3
              5; %a_2,1
              2; %a_2,3
              5; %a_3,1
              1; %a_3,2
              2; %b_1
              7; %b_2
              12;]); %b_3
          
d = checkgrad('assessLogLikelihood', params, 1e-9, X)

assert(abs(d) <= tol);