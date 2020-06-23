%----- Presentation --- Bessel ---------

clear all; 
clc;

t = 10;
xspan = [1e-15 t];

Y = 1;
V = 0;
Y0 = [Y V];

[x,Y] = ode45(@mohsen_presentation_bessel_fun, xspan, Y0);

y_exact =besselj(0,x);
Error = y_exact - Y(:,1);

figure(1705)
subplot(1,2,1)
plot(x,Y(:,1),x, y_exact,'r');
grid on, title('ODE45')
legend ('Numerical solution' ,'Exact Solution')
xlabel('X');
ylabel('Solution');

subplot(1,2,2)
plot(x,Error)
grid on, title('Error')
xlabel('X');
ylabel('Error')