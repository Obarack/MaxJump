function a = EC_Dynamics(u_t, a_p)
% EC_Dynamics first order differential solver for activation signal
%
% a = EC_Dyamics() returns the activation signal and its time derivative 
%
% tRise     : rise time constant
% tFall     : decay time constant for the activation signal
% u_t       : incoming neural signal [muscle excitation, u(t)]

tRise = 20;     % ms
tFall = 200;    % ms
a_min = 0.05;   % designated lower bound on muscle activation. 
                % Note: Introduced to cope with problems associated with
                % inverting the force-velocity curve of a muscle.

a = zeros(2,1);
a(1) = a_p(2);
a(2) = (1/tRise)*(1-a_p(1))*u_t + (1/tFall)*(a_min-a_p(1))*(1-u_t);
 
