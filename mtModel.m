%% some definitions for MT contraction dynamics
%  a(t) = muscle activation
%  Pi = force in the ith element
%  li = length of ith elm
%  vi = velocity of ith elm
%  ki = stiffness of ith elm (i = T, SE, PE)
%  kM = kPE + kSE = muscle stiffness (alph = 0)
%  kMT = ( (kT*kM)/(kT+kM) ) = actuator stiffness (alph = 0)
%  epsT = tendon strain
%
% where i = T, M, MT, PE, SE, or CE, except as noted

%% five actuator specific parameters:
%  P0 = peak isometric active muscle force
%  lM0 = muscle fiber length where P0 is developed
%  alph0 = muscle fiber pennation when lM = lM0
%  lT0 = tendon slack strain
%  epsT0 = tendon strain when PT = P0

%% maximum intrinsic shortening velocity was assumed to be muscle
% independent (= 10/s). Thus the maximum shortening velocity (V0) of a
% muscle was equal to 10*lM0/s.

%%
kMa = kM*cos(alph) + (PT/lM)*tan(alph)^2;
dPT = [((kMa*cos(alph))*kT) / ((kMa*cos(alph))+kT)] * ...
      [vMT - (kSE/kMa)*vCE ];