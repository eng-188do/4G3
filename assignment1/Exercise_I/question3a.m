%%question 3a
time=0:0.01:0.99;
R2_mod = (1/0.4062) * log( (R2-r0+14.24)/12.71 );
plot(time, R2_mod,'x')
ylabel('Expected response from linear filter (not including r_0)')
xlabel('time (secs)')