clc; clear all; close all;
pause on
%% Data Setting 
global xs xw ymax Dg Ds k beta1 beta2 c0 umax M name hy
hy = 0.1;
xs = 1;     % Interface
xw = 2;     % Right end of pipe
ymax = 4;   % y-axis maximum value
Dg = 1;     % Gas Coefficient
Ds = 1;     % Solid Coefficient
k = 1;
beta1 = 1;  
beta2 = 2;
c0 = 1;
umax = 1;   % Maximum value of parabolic velocity profile function


M = 51; 
%%
clc
% normal, given conditions
name=  'normal';
solver(0,1)

%%  Change xw
xw = 1.02;
hy = 1;
ymax = 100;
name=  'nocatal';
solver(1,0)
hy = 0.1;
%%
M=11;
xw = 1.1;
ymax = 1;
name=  'nocatal2';
solver(1,0)
M=51;
%%
xw = 1.16;
ymax = 10;
name=  'smallcatal';
solver(1,0)

xw = 3;
ymax = 10;
name=  'bigcatal';
solver(1,0)
xw = 2;

% change beta2
beta2= 5;
ymax = 5;
name=  'bigbeta';
solver(1,0)

beta2= 0.2;
ymax = 5;
name=  'smallbeta';
solver(1,0)
beta2=2;

% change umax
umax = 5;
ymax = 15;
name=  'bigumax';
solver(1,0)
umax = 0.2;
ymax = 15;
name=  'smallumax';
solver(1,0)
%%
umax = 0.001;
ymax = 1;
name=  'noumax';
solver(1,0)
umax = 1;
%%
% change k
k = 5;
ymax = 3;
name=  'bigk';
solver(1,0)

k = 0.5;
ymax = 3;
name=  'smallk';
solver(1,0)
k = 1;

% chagne M
M = 11;
ymax = 4;
name=  'smallM';
solver(1,0)

M = 101;
ymax = 4;
name=  'bigM';
solver(1,0)
M = 51;