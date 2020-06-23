%--------Homework#9-----Problem 1----

clear all
clc

xspan=[0 1];
alpha=0;
beta=1;
M=input('Please enter the value of M =');% 10 20 40
h=(xspan(2)-xspan(1))/(M+1);
x=xspan(1):h:xspan(2);

fun=@mohsen_hw9_p1_fun1;

for i=1:M
    R(i)=feval(fun,x(i+1));
end

r=R';
 
for j=1:M
    for k=1:M
        A(k,j)= -((j*pi)^2)*sin(j*pi*x(k+1))-(2/(1+x(k+1))^2)*sin(j*pi*x(k+1));
    end
end


c=A\r;

for k=1:M
    for j=1:M
        phi(k,j)=sin(j*pi*x(k+1));
    end
end

z=phi*c;

for i=1:M
    y(i)=z(i)+x(i+1);
end
y=[alpha y beta];

Yexact = (2*x)./(1+x);
subplot(1,2,1)
plot(x,Yexact,'->b',x,y,'-*r')
grid on
title(['Collocation Method. M= ',num2str(M)])
xlabel('Time');ylabel('Solution');
legend('Exact Solution','Numerical Solution','location','northeast')
error = y-Yexact;
subplot(1,2,2)
plot(x,error)
grid on, title('Error in the collocation method')
xlabel('Time');
ylabel('Error');