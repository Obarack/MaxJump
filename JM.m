%Sensorimotor computation
%Optimal control model for maximum-height human jumping
%Model using 4 segments (as in publication)

%Receive time and initial angular configuration
%t time vector
%th theta vector 4x1
%thv theta speed vector 4x1
function thp = JM(t, th4, a_t)

global M PT count ind;

th(1)=th4(2);
th(2)=th4(4);
th(3)=th4(6);
th(4)=th4(8);

%Consider using th(2) instead of th(1) for theta 1
initMusclesC(th);

% updates the new moment arm matrix
% M: moment arm matrix (3x8)
calcMomentArm();
% M
% solve musculotendon dynamics
% a_t = zeros(8,1);
% a_t(3) = 1;
%  a_t(1) = 1;
%  a_t(5) = 1;
%  a_t(4) = 1;
%  a_t(8) = 1;
MT_Dynamics(a_t, th4(2:2:end), th4(1:2:end));
% calculate parameters for solving the diff. system.
% A: system mass matrix (4x4),    
% B: coriolis&centrifugal effects (4x1),
% C: gravitational terms (4x1), 
% D: transform joint torques into segmental torques (4x3),
% T: externally appplied joint torques (4x1)
[A B C D T] = systemParams(th, th4);

% if(mod(count,50)==0 && count <300)
    %subplot(3,2,ind);
    drawSim();  
   % hold on;
    ind=ind+1;
        % draw the muscle-bone configuration based on J O In values.
%newLen = getLenMus()
% hold on;
% end
count = count+1;

thp = zeros(8,1);
thp(1:2:end) = th4(2:2:end);
% inv(A) % B % C % D % M % PT % T
% thp(2:2:end) = A\(B*(thp(1:2:end).^2) + C + D*M*PT + T);
% thp(2:2:end) = A\(B*(thp(1:2:end).^2) + C);
thp(2:2:end) = A\(C);
thp
