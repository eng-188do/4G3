function x = SparseInput()

	T = 100000;
    angle = 2*pi*rand();
	mix = [[cos(angle),sin(angle)];[-sin(angle),cos(angle)]];
	tmp = randn(2,T); 
	tmp = tmp.^3;   
	tmp = mix * tmp;
   
    % whiten the signals
    [V,D] = eig(cov(tmp'));
    tmp = V'*diag(1./(sqrt(diag(D))))*V*tmp;
     
	%tmp = diag(1./sqrt(diag(cov(tmp'))))*tmp;
    x = tmp;