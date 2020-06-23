%---------------Homework 4----Problem 7------------------

clear all
clc

global a b

a=-20;
b=0; 

xspan=[0 1.5];
yint=1;
h=0.125;

fun=@mohsen_hw4_p7_fun;% calling the function y'=a*y

[x,Y1]=mohsen_Simple_Euler(fun,yint,xspan,h);% Solution using simple Euler method
[x,Y2]=mohsen_cRK(fun,yint,xspan,h);% Solution using cRK method
[x,Y3]=mohsen_Implicit(fun,yint,xspan,h);% Solution using implicit Euler methods

y_exact=exp(a*x);

plot(x,Y1)
title('Simple Euler Method')
xlabel('Time'); ylabel('Solution')

grid on

figure
plot(x,Y2,'-or', x,Y3,'-*b',x,y_exact,'x-g')
grid on
xlabel('Time'); ylabel('Solution')
title('Comparison of cRK, Implicit and Exact Solution');
legend('cRK','Implicit','Exact')