% tprime = [-.1 : .01 : 1.7];
lM0 = [0.034, 0.036, 0.07, 0.062, 0.090, 0.075, 0.106, 0.182];
k = 0.25;
%%
clear clc
f0 = 4235/34;       %0.3;
a = 1.4*f0;         %0.09;
b = 10*0.034*1.4;   %0.75;
vmax = 10;
v = [ -.2 : 0.01: 1];
f = (((f0+a)*b)./(v+b)) - a;
plot(f,v);
hold on;
plot(0,v);
hold on;
plot(f,0);
%%
vprime = (1 - tprime)./(1+tprime/k);
plot(vprime, tprime)
hold on, plot(tprime(11), vprime(11), 'r.')