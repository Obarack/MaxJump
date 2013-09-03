function initMT_Params()

global P0 lM0 lT0 W;
global PT PM vCE lM kT;
global xMdl ceMdl fMdl vMdl;

P0 = [4235; 3590; 1400; 2370; 5400; 930; 2350; 2650]; 
% lM0 = [0.034; 0.036; 0.07; 0.062; 0.090; 0.075; 0.106; 0.182]; % original
lM0 = [0.3541; 0.3871; 0.0725; 0.4093; 0.0560; 0.4428; 0.5516; 0.1629];    %lengths of muscles initial position
alph0 = [20; 10; 5; 12; 10; 14; 9; 0];
lT0 = [0.360; 0.405; 0.265; 0.411; 0.206; 0.323; 0.390; 0.090];
eT0 = [2.5; 2.6; 2.7; 3.9; 3.0; 2.6; 2.6; 5.3];

v0 = -10*lM0;
W = lM0.*sind(alph0);    % thickness of the muscle - constant

PT  = zeros(8,1);	% force on the tendon
PM  = zeros(8,1);   % force on the muscle

vCE = zeros(8,1);   % velocity of contracting element
lM  = zeros(8,1);   % current length of each muscle

% vM  = zeros(8,1); % velocity of each muscle
lM  = lM0;          % initial length of muscles. is it wrong to do so?

kT  = (P0./eT0)./lT0;

% model for active element
[xMdl ceMdl] = contElemModel(lM0, P0);
% model for force-velocity relation for Contractile Element
[fMdl, vMdl] = FVCurve(P0, lM0,v0);