%-----homework #5--- Problem 8------
clear all
clc



h=input('enter the step size: h=')
t=input('enter the time: t=')
a=input('enter the constant(gamma): a=')

% h=.05;
% t=50;
% a=.015;

xspan=[0 t];

Y1(1)=0;
V1(1)=1;

w=1;
x=xspan(1):h:xspan(2);

for n=1:length(x)-1
    
    Y1(n+1) = Y1(n) + h*V1(n) ;
    V1(n+1) = V1(n) +(h)*(-2*a*V1(n)-w^2*Y1(n));
    
end

H1=(V1.^2+Y1.^2)/2;

Y2(1)=0;
V2(1)=1;

for n=1:length(x)-1
    
    V2(n+1) = V2(n) + h*(-2*a*V2(n)-(w^2)*Y2(n)) ;
    Y2(n+1) = Y2(n) +(h)*V2(n+1);
    
end

H2=(V2.^2+Y2.^2)/2;

for i=1:length(x)
    y_exact(i)=exp(-a*x(i))*(1/w)*sin(w*x(i));
    v_exact(i)=exp(-a*x(i))*(1/w)*(-a*sin(w*x(i))+cos(w*x(i)));
end

H_exact=(v_exact.^2+y_exact.^2)/2;

Error1 = ( H1-H_exact) ;
Error2 = ( H2-H_exact) ;


subplot(3,1,1);
plot(V1,Y1,y_exact,v_exact,'-.r')
grid on, title('Regular Euler Method and exact solution')
legend('Regular Euler Method','Exact solution')
xlabel('V');
ylabel('Y');

subplot(3,1,2);
plot(V2,Y2,y_exact,v_exact,'-.r')
grid on, title('Symplectic Euler Method and Exact solution')
xlabel('V');
ylabel('Y');
legend('Symplectic Euler Method','Exact solution')


subplot(3,1,3);
plot(x,Error1,x,Error2,'r')
grid on, title('Error in the Hamiltonian for Regular Euler and Symplectic Euler Methods')
xlabel('Time');
ylabel('Error');
