function x = CorrelatedInput()

	T = 100000;
	angle = 2*pi*rand();
	rot = [[cos(angle),sin(angle)];[-sin(angle),cos(angle)]];
	mix = [[1,0.7];[0.7,1]];
	mix = mix/det(mix);
	x = rot * mix * randn(2,T);