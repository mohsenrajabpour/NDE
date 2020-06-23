%-----Homework#5---Problem 7------


clear all
clc

xspan=[0 20];
Y(1)=0;
V(1)=1;
h=0.02;

x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

for n=1:length(x)-1
    
    Y(n+1) = Y(n) + h*feval( fun,x(n),V(n)) ;
    V(n+1) = V(n) +(h)*(  feval( fun,x(n),-Y(n)));
    
end


H=(V.^2+Y.^2)/2;
y_exact=sin(x);
v_exact=cos(x);

H_exact=(v_exact.^2+y_exact.^2)/2;

Error = abs(H_exact - H) ;

plot(x,Error)
grid on, title('Error in the Hamiltonian')
xlabel('Time');
ylabel('Error');