% This code integrates the equation in problem 5 of HW 1
%   v' = -a*v + g
% vmax = 80 mph

global a g

% Convert the variables from one usints to the others:
vmax_mph = 80;                   % max speed in miles per hour
vmax = vmax_mph*(1600/3600);     % max speed in meters per second
g = 9.8;                         % acceleration of gravity in m/s^2
a = g/vmax;                      % friction constant

% Other parameters of the problem:
tmin = 0;
tmax = 2;                        % beginning and ending times [s]
h = 0.2;                         % step size in time

tspan = [tmin tmax];             % this is used by the solvers
v0 = 0;                          % this is the initial speed
t = tmin:h:tmax;

% Exact solution:
V_exact = vmax*(1-exp(-a*t));

% Solve the equation using the Modified Euler method:
[t_ME, V_ME] = ME_1eq(@fun4_hw1_p5,v0,tspan,h);


% Solve the equation using the Midpoint method:
[t_midpt, V_midpt] = midpoint(@fun4_hw1_p5,v0,tspan,h);

figure(10501);
plot(t_ME,V_ME,t_midpt,V_midpt,'--',t,V_exact,'-.')

figure(10502); 
plot(t_ME,V_ME-V_exact,t_midpt,V_midpt-V_exact,'--')

% figure(10503); 
% plot(t_ME,V_ME-V_midpt)


