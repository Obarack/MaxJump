function initGlobals()

global l g ks cd t0;
global c a;

I = [0.008 0.065 0.126 6.814];  %moment of inertia of segment i about its center of mass
m = [2.2 7.5 15.15 51.22];      %mass of segment i (kg)
l = [0.175 0.40 0.48 0.343];    %Length of segment i (m)
lc = [0.095 0.274 0.251 0.343];	%Length from center of the segment i to the center of mass of segment (m)

g = 9.807;      %gravity acceleration constant (m/s^2)
ks = 9.0*10^7;  %spring stiffness constant (Nm rad^-3)
cd = 2.0*10^6;  %spring damping constant (nm rad^-6s^3
t0 = 0.5934;    %foot segment angle when foot is flat on the ground (34 degrees) should coincide with initial th)

c(1) = m(1)*lc(1)+(m(2)+m(3)+m(4))*l(1);
c(2) = m(2)*lc(2)+(m(3)+m(4))*l(2);
c(3) = m(3)*lc(3)+m(4)*l(3);
c(4) = m(4)*lc(4);

a(1,1) = I(1)+m(1)*lc(1)^2+(m(2)+m(3)+m(4))*l(1)^2;
a(1,2) = c(2)*l(1);
a(1,3) = c(3)*l(1);
a(1,4) = c(4)*l(1);

a(2,2)=I(2)+m(2)*lc(2)^2+(m(3)+m(4))*l(2)^2;
a(2,3)=c(3)*l(2);
a(2,4)=c(4)*l(2);
a(3,3)=I(3)+m(3)*lc(3)^2+m(4)*l(3)^2;
a(3,4)=c(4)*l(3);
a(4,4)=I(4)+m(4)*lc(4)^2;