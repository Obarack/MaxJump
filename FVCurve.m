function [f,v] = FVCurve(P0, lM0,vMax)

P0 = P0./(lM0*1000);
n = 999;            % number of data points sampled for f-v relation
v = zeros(8, n+1);
f = zeros(8, n+1);

for i = 1:length(P0)
    a = 1.4 * P0(i);
    b = (vMax(i)*a)/P0(i);
    v(i,:) = ( vMax(i): (-vMax(i)+.2)/n : .2);
    f(i,:) = (((P0(i)+a)*b)./(v(i,:)+b)) - a;
%     plot(f(i,:),-v(i,:));
%     hold on;
%     plot(0,v(i,:));
%     hold on;
%     plot(f(i,:),0);
   % pause();
end
% f0 = PCE/(len*1000);       %0.3;
% a = 1.4*f0;         %0.09;
% b = vMax*len*1.4;   %0.75;
% v = [ -.2 : 0.01: vMax];
% f = (((f0+a)*b)./(v+b)) - a;
