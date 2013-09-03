function [A B C D T] = systemParams(th, th4)

% globals that are initialized by the initGlobals()
global a c g ks cd t0;

%System mass matrix
A=[a(1,1) -a(1,2)*cos(th(1)-th(2)) a(1,3)*cos(th(1)-th(3)) -a(1,4)*cos(th(1)-th(4));
    -a(1,2)*cos(th(1)-th(2)) a(2,2) -a(2,3)*cos(th(3)-th(2)) a(2,4)*cos(th(4)-th(2));
    a(1,3)*cos(th(1)-th(3)) -a(2,3)*cos(th(3)-th(2)) a(3,3) -a(3,4)*cos(th(3)-th(4));
    -a(1,4)*cos(th(1)-th(4)) a(2,4)*cos(th(4)-th(2)) -a(3,4)*cos(th(3)-th(4)) a(4,4)
    ];

%Both coriolis and cetrifugance effects
B=[0 -a(1,2)*sin(th(1)-th(2)) -a(1,3)*sin(th(1)-th(3)) -a(1,4)*sin(th(1)-th(4));
    -a(1,2)*sin(th(1)-th(2)) 0 -a(2,3)*sin(th(3)-th(2)) a(2,4)*sin(th(2)-th(4));
    a(1,3)*sin(th(1)-th(3)) -a(2,3)*sin(th(3)-th(2)) 0 -a(3,4)*sin(th(3)-th(4));
    -a(1,4)*sin(th(1)-th(4)) -a(2,4)*sin(th(2)-th(4)) -a(3,4)*sin(th(3)-th(4)) 0
    ];

%Gravitational terms
% C = [-c(1)*g*cos(th(1));
%     c(2)*g*cos(th(2));
%     -c(3)*g*cos(th(3));
%     c(4)*g*cos(th(4))];
% C = [c(1)*g*cos(th(1));
%     c(2)*g*cos(th(2));
%     c(3)*g*cos(th(3));
%     c(4)*g*cos(th(4))];
C = [c(1)*g*cos(th(1));
     c(2)*g*cos(th(2));
     c(3)*g*cos(th(3));
     c(4)*g*cos(th(4))];
%joint torques into segments
D = [ 2 0 0;
    -2 -2 0;
    0 2 2;
    0 0 -2];

if(th(1)< t0)
    T=[(ks-cd*th4(1)^3)*(t0-th(1))^3;
        0;
        0;
        0]; %th4(1) is first derivative of theta 1 (ankle)
else
    T = zeros(4,1);
end