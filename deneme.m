clc;
clear all;
links = [0;1;pi/2;pi/2];
initMT_Params();
global M J O In;

l = [0.175 0.40 0.48 0.343];    %Length of segment i (m)
k = 1;
a_t = zeros(8,1);
thetaP = zeros(4,1);
th = links;
figure();
for i = pi/2:pi/360:pi/2+pi/18
    
    th(2) = i;
    thetaP(2) = (pi/360);
    a_t(3) = 1;
    J(1,1) = 0.1;
    J(1,2) = 0;
    J(2,1) = J(1,1) - l(1)*cos(th(1));
    J(2,2) = J(1,2) + l(1)*sin(th(1));
    J(3,1) = J(2,1) + l(2)*cos(pi-th(2));
    J(3,2) = J(2,2) + l(2)*sin(pi-th(2));
    J(4,1) = J(3,1) - l(3)*cos(th(3));
    J(4,2) = J(3,2) + l(3)*sin(th(3));
    J(5,1) = J(4,1) + l(4)*cos(pi-th(4));
    J(5,2) = J(4,2) + l(4)*sin(pi-th(4));
    initMuscles();
    M = [ moment([O(1,1) O(1,2)],[In(1,1) In(1,2)],[J(2,1) J(2,2)]) moment([O(2,1) O(2,2)],[In(2,1) In(2,2)],[J(2,1) J(2,2)]) moment([O(3,1) O(3,2)],[In(3,1) In(3,2)],[J(2,1) J(2,2)]) moment([O(4,1) O(4,2)],[In(4,1) In(4,2)],[J(2,1) J(2,2)]) 0 0 0 0;
        0 0 0 0 moment([O(5,1) O(5,2)],[In(5,1) In(5,2)],[J(3,1) J(3,2)]) moment([O(6,1) O(6,2)],[In(6,1) In(6,2)],[J(3,1) J(3,2)]) 0 0;
        0 0 0 0 0 0 moment([O(7,1) O(7,2)],[In(7,1) In(7,2)],[J(4,1) J(4,2)]) moment([O(8,1) O(8,2)],[In(8,1) In(8,2)],[J(4,1) J(4,2)])];
    
    PT2(k,:) = MT_Dynamics(a_t, th(2:end), thetaP(2:end))
    k = k+1;
end

plot([1:size(PT2,1)],abs(PT2(:,3)))