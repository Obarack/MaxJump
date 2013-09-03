
% Ii = moment of inertia of segment i about its center of mass
% li = length of segment i
% lci = distance segment center of mass from distal end
% mi = mass of segment i
% theta_i = angle that segment i makes with the horizontal
m = [ 2.2 7.5 15.15 51.22];
lc = [0.095 0.274 0.251 0.343];
l = [ 0.175 0.435 0.4 0.343];
I = [0.008 0.605 0.126 6.814];
theta=[ 10 20 30 30];
g = 9.8;
for i = 1:3
    c(i) = m(i)*lc(i) + sum(m(i+1:end))*l(i);
end
c(4) = m(4)*lc(4);


a(1,1) = I(1)+m(1)*(lc(1)^2) + sum(m(2:4))*(l(1)^2);
a(1,2) = c(2)*l(1);
a(1,3) = c(3)*l(1);
a(1,4) = c(4)*l(1);

a(2,2) = I(2)+m(2)*(lc(2)^2) + sum(m(3:4))*(l(2)^2);
a(2,3) = c(3)*l(2);
a(2,4) = c(4)*l(2);

a(3,3) = I(3)+m(3)*(lc(3)^2) + m(4)*(l(3)^2);
a(3,4) = c(4)*l(3);

a(4,4) = I(4)+m(4)*(lc(4)^2);

A = [ a(1,1) -a(1,2)*cos(theta(1) - theta(2)) a(1,3)*cos(theta(1)-theta(3)) -a(1,4)*cos(theta(1) - theta(4));
  -a(1,2)*cos(theta(1) - theta(2)) a(2,2) -a(2,3)*cos(theta(3)-theta(2)) -a(2,4)*cos(theta(1) - theta(4));
  a(1,3)*cos(theta(1)-theta(3)) -a(2,3)*cos(theta(3) - theta(2)) a(3,3)  -a(3,4)*cos(theta(3) - theta(4)) ;
  a(1,4)*cos(theta(1)-theta(4)) -a(2,4)*cos(theta(4) - theta(2)) -a(3,4)*cos(theta(3)-theta(4)) a(4,4)
  ];


B = [...
 0 -a(1,2)*sin(theta(1) - theta(2)) a(1,3)*sin(theta(1)-theta(3)) -a(1,4)*sin(theta(1) - theta(4));
  -a(1,2)*sin(theta(1) - theta(2)) 0 -a(2,3)*sin(theta(3)-theta(2)) -a(2,4)*sin(theta(1) - theta(4));
  a(1,3)*sin(theta(1)-theta(3)) -a(2,3)*sin(theta(3) - theta(2)) 0  -a(3,4)*sin(theta(3) - theta(4)) ;
  a(1,4)*sin(theta(1)-theta(4)) -a(2,4)*sin(theta(4) - theta(2)) -a(3,4)*sin(theta(3)-theta(4)) 0
  ];

C = [-c(1)*g*cos(theta(1));
    c(2)*g*cos(theta(2));
    -c(3)*g*cos(theta(3));
    c(4)*g*cos(theta(4))];
D = [ 2 0 0 ; -2 -2 0; 0 2 2 ; 0 0 2];

ks = 9.0*10^7;          % spring stiffness constant. Nm/rad^3
cd = 2.0*10^6;          % spring damping constant. Nms^3/rad^6
theta0 = 34*pi/180;     % foot segment angle when foot is flat on the ground. rad

% T = [ (ks-cd*thetaP(1).^3)*((theta0-theta(1)).^3); 0; 0; 0 ]; % when
% theta(1) <= theta(0) otherwise T(theta, thetaP) = 0