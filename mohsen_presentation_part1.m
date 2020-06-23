%----- Presentation --- Gamma=1 ---------

clear all
clc

h = 0.01;
t = 10;
gamma = 1;
xspan = [1e-15 t];

x = xspan(1):h:xspan(2);

%Symplectic Euler Method

Y(1) = 1;
V(1) = 0;

for n=1:length(x)-1
    
    V(n+1) = V(n) + h*( -(2/x(n))*V(n)-(Y(n))^gamma) ;
    Y(n+1) = Y(n) +(h)*V(n+1);
    
end

for i=1:length(x)
    y_exact(i) = sin(x(i))/x(i);
end
% % y_exact = 1-(x.^2)/6;

Error = y_exact-Y;

%Verlet-1 Method

Y1(1) = 1;
V1(1) = 0;

for n=1:length(x)-1
    
    Y1(n+1) = Y1(n) + h*V1(n) +(h^2/2)*(-(2/x(n))*V1(n)-(Y1(n))^gamma) ;
    V1(n+1) = V1(n) + (h/2)*( (-(2/x(n))*V1(n)-(Y1(n))^gamma)  + (-(2/x(n))*V1(n)-(Y1(n+1))^gamma) );
end

Error1=y_exact-Y1;

figure(1701)

subplot(1,2,1)
plot(x,Y,x, y_exact,'r')
grid on, title('Symplectic Euler Method')
legend('Symplectic Euler','Exact solution')
xlabel('X');
ylabel('Solution');

subplot(1,2,2)
plot(x,Error)
grid on, title('Error')
xlabel('X');
ylabel('Error');

figure(1702)

subplot(1,2,1)
plot(x,Y1,x, y_exact,'r')
legend('Verlet-1','Exact solution')
grid on, title('Verlet-1 Method')
xlabel('V');
ylabel('Y');

subplot(1,2,2)
plot(x,Error1)
grid on, title('Error')
xlabel('X');
ylabel('Error');