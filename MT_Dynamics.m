function dPT = MT_Dynamics(a_t, theta, thetaP)
% a(t)= muscle  activation 
% Pi = force in  ith element 
% li = length of  ith element 
% ui =  velocity of  fth element 
% ki = stiffness  of  ith element (i = T,  SE,  PE) 
% kM = kPE+kSE = =muscle  stiffness  (alph=0) 
% kMT = (kT.kM/kT+kM) = actuator  stiffness  (alph=O) 
% eT = tendon strain 

% where  i = T,  M,  MT,  PE.  SE,  or CE.  cxccpt as noted.

% P0  =  peak  isometric active muscle force 
% l used.M0 = muscle fiber  length where  P0  is developed 
% alph0 = muscle fiber pennation  when lM = lM0 
% lT0 = tendon  slack  length 
% eT0 =  tendon strain  when  PT = P0

% VMaxShort = maximum intrinsic shortening velocity

% dPT/dt = f[PT, lMT, vMT, a(t)]
global M P0 lM0 W;
global PT PM vCE lM kT;
global xMdl ceMdl fMdl vMdl;

PMp = zeros(8,1);   % force on the muscle at t=t-1
PSE = zeros(8,1);   % force on the serial element
PPE = zeros(8,1);   % force on the parallel element
PCE = zeros(8,1);   % force generated on the contractile element
lMp = zeros(8,1);   % length of each muscle at t=t-1
lMT = zeros(8,1);   % length of each musculotendon
vMT = zeros(8,1);   % velocity of each mt
lT  = zeros(8,1);   % current length of each tendon
kSE = zeros(8,1);   % stiffness of the active muscle

%% embed in the fnc for ode call
PCEfa = contElemF(lM, xMdl, ceMdl);
PPE	  = passElemF(lM, lM0);
PCE   = FbyFV(vCE, fMdl, vMdl);
PCE	  = ((PCEfa.*a_t)./P0).*PCE;
vCE   = VbyFV(PCE, fMdl, vMdl);     % update velocity of CE
alph  = acos( sqrt(1-(W./lM).^2) );	% pennation angle of each muscle
PSE = PCE;
PMp = PM;
PM  = PPE+PSE;
lMp = lM;                  % set previous length
lM  =  getLenMus(); %M'*theta(2:end);   %getLenMus() - lT
% lMT = M'*theta    
% lT  = (PT./kT) + lT0
% lM  = (lMT - lT)./cos(alph)
vMT = lM-lMp;   %M'*thetaP(2:end);

kSE = (100.*PSE + 10.*P0)./lM0;

kM  = (PM-PMp)./(lM-lMp);       % stiffness of the muscle dPm/dlM
kMa = kM.*cos(alph) + (PT./lM).*tan(alph).^2;

n = find(kM == 0);
dPT = (((kMa.*cos(alph)).*kT)./((kMa.*cos(alph))+kT)).*(vMT-(kSE./kMa).*vCE);
dPT(n) = 0;

PT = PT + dPT;

dPT = PT;
