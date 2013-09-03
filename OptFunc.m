% Sensorimotor computation
% Optimal control model for maximum-height human jumping
% Model using 4 segments (as in publication)

clear all
clc
%Initial angular configuration
th0=[0 0.5934 0 2.3562 0 0.7854 0 2.3562];
th02=[0; 0; 0; 2*pi/3.0; 0; pi/3.0; 0; 2*pi/3.0];
%th0=[0 0 0 1.5708 0 1.5708 0 1.5708];
%th0=[0 0.5934 0 2.3562 0 0.7854 0 1.570];

global M J O In count ind;
J = zeros(5,2);     % points (3 joints + 2 extreme points)
O = zeros(8,2);     % origin of each muscle
In = zeros(8,2);    % insertion of each muscle
M = zeros(3,8);     % moment arm matrix prop distance each musculoeskeletl actuator and the joints it spans
count = 0;
initGlobals();      % initialize some global constants
initMT_Params();
%[t,th]=ode45('JM',[0 time],th0);
% th0=[0 0 0 0 0 pi/2 0 pi/2];
% for i = pi/2:pi/360:pi/2+pi/18
%     th0(4) = i;
%     JM([0 time],th0);
%     pause()
%     hold on
%     %JM([0 time],th02);
% end

a_t = zeros(8,1);
a_t(3) = 1;
ind = 1;
tspan = linspace(0, 0.3, round(0.3*100)); 
[T, Y] = ode45(@(t,th02)JM(t,th02,a_t), tspan, th02);

% figure
% plot(T, Y(:,7))
 