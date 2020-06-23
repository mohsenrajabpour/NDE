%-----Homework#5---Problem 6---- Part 1------

clear all
clc

xspan=[0 1000];
Y(1)=0;
V(1)=1;
h=0.2;

x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

for n=1:length(x)-1
    
    Y(n+1) = Y(n) + h*V(n) +(h^2/2)*feval(fun,x(n),Y(n)) ;
    V(n+1) = V(n) + (h/2)*(  feval( fun,x(n),Y(n) ) + feval( fun,x(n),Y(n+1)));
end
subplot(2,1,1);
plot(V,Y);
grid on, title('Verlet-1 Method')
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