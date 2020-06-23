%-----Homework#5---Problem 6---- Part 4------


clear all
clc

xspan=[0 1000];
Y(1)=0;
V(1)=1;
h=0.5;


x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

for n=1:length(x)-1
    
    k11  = h * feval(fun,x(n),V(n));
    k12 = h * feval(fun,x(n),-Y(n));
    
    k21 = h * feval(fun,x(n)+h/2,V(n)+k12/2);
    k22 = h * feval(fun,x(n)+h/2,-Y(n)-k11/2);
    
    k31 = h * feval(fun,x(n)+h/2,V(n)+k22/2);
    k32 = h * feval(fun,x(n)+h/2,-Y(n)-k21/2);
    
    k41 = h * feval(fun,x(n)+h,V(n)+k32);
    k42 = h * feval(fun,x(n)+h,-Y(n)-k31);
    
    Y(n+1) = Y(n) + 1/6 * ( k11 + 2*k21 + 2*k31 + k41);
    V(n+1) = V(n) + 1/6 * ( k12 + 2*k22 + 2*k32 + k42);
end
subplot(2,1,1);
plot(V,Y);
grid on, title('cRK Method')
xlabel('V');
ylabel('Y');

H=(V.^2+Y.^2)/2;

y_exact=sin(x);
v_exact=cos(x);

H_exact=(v_exact.^2+y_exact.^2)/2;

Error =abs( H_exact - H) ;

subplot(2,1,2);
plot(x,Error)
grid on, title('Error in the Hamiltonian')
xlabel('Time');
ylabel('Error');
