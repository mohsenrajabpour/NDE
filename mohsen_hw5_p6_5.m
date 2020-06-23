%-----Homework#5---Problem 6---- Part 5------


clear all
clc

xspan=[0 1000];
Y(1)=0;
V(1)=1;
h=0.2;

x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

Y(2)=Y(1)+h*V(1)+(h^2/2)* feval(fun,x,Y(1));

for n=2:length(x)-1

Y(n+1) = 2*Y(n) - Y(n-1) + (h^2)*feval(fun,x(n),Y(n));

V(n) = ( Y(n+1) - Y(n-1) )/(2*h);
end

z=length(x);
V(z)=(Y(z)-Y(z-1))/h + (h/2)*(-Y(z));
subplot(2,1,1);
plot(V,Y);
grid on, title('Simple Central-Difference Method')
xlabel('V');
ylabel('Y');

H=(V.^2+Y.^2)/2;


y_exact=sin(x);
v_exact=cos(x);

H_exact=(v_exact.^2+y_exact.^2)/2;

Error = abs(H_exact - H) ;

subplot(2,1,2);
plot(x,Error)
grid on, title('Error in the Hamiltonian')
xlabel('Time');
ylabel('Error');