function drawSim()

global J O In;

figure(1);
x1=[J(1,1) J(2,1) J(3,1) J(4,1) J(5,1)];
y1=[J(1,2) J(2,2) J(3,2) J(4,2) J(5,2)];

m1x=[O(1,1) In(1,1)];
m1y=[O(1,2) In(1,2)];

m2x=[O(2,1) In(2,1)];
m2y=[O(2,2) In(2,2)];

m3x=[O(3,1) In(3,1)];
m3y=[O(3,2) In(3,2)];

m4x=[O(4,1) In(4,1)];
m4y=[O(4,2) In(4,2)];

m5x=[O(5,1) In(5,1)];
m5y=[O(5,2) In(5,2)];

m6x=[O(6,1) In(6,1)];
m6y=[O(6,2) In(6,2)];

m7x=[O(7,1) In(7,1)];
m7y=[O(7,2) In(7,2)];

m8x=[O(8,1) In(8,1)];
m8y=[O(8,2) In(8,2)];


% plot(x1,y1,m1x,m1y,m2x,m2y,m3x,m3y,m4x,m4y,m5x,m5y,m6x,m6y,m7x,m7y,m8x,m8y);
plot(x1, y1);
axis([-1.5 1.5 -1.5 1.5]);
% pause(0.2);