%-----Homework#5---Problem 6---- Part 6------


clear all
clc

xspan=[0 1000];
Y(1)=0;
V(1)=1;
h=0.2;

x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

% at=0.002;
% at=0.003;
at=input('Absolute Tolerance: AbsTol=')

options=odeset('AbsTol',at);
[t_ode45, y_ode45] = ode45(@mohsen_hw5_p6_fun2,[0 1000],[Y(1) V(1)], options);

V = y_ode45(:,2);
Y = y_ode45(:,1);
subplot(2,1,1);
plot(V,Y);
grid on, title('ode45 Method')
xlabel('V');
ylabel('Y');

H=(V.^2+Y.^2)/2;

y_exact=sin(t_ode45);
v_exact=cos(t_ode45);

H_exact=(v_exact.^2 + y_exact.^2)/2;

Error=abs(H_exact - H);

subplot(2,1,2);
plot(t_ode45,Error)
grid on, title('Error in the Hamiltonian')
xlabel('Time');
ylabel('Error');





