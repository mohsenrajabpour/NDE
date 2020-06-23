%-------- Test 2 -----Problem 1-----
%---Mohsen---

clear all
clc

xspan=[0 1];
h=0.1;
x=xspan(1):h:xspan(2);

y=10*sin(sqrt(10)*x)-(1/10)*cos(sqrt(10)*x)+1/10;
z=41.7924*sin(sqrt(9.9)*x)-(1/9.9)*cos(sqrt(9.9)*x)+1/9.9;

plot(x,y,x,z,'-*r')
grid on, title('Boundary Value Problem')
legend('y (Equation a)','z (Equation b)','location','northeast')
xlabel('X');
ylabel('Y & Z');
