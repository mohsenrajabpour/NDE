%-----Test 5---Problem 4---- Part A------


clear all
clc

xspan=[0 20];
Y(1)=0;
V(1)=1;
h=0.1;

x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

for n=1:length(x)-1
    
    V(n+1) = ( 1/(1+h^2) )*( V(n) - h*(  feval( fun,x(n),Y(n))));
    Y(n+1) = Y(n) + h*feval( fun,x(n),V(n+1)) ;
    
end
y_exact=sin(x);
v_exact=cos(x);

plot(Y,V,y_exact,v_exact,'-*r')
grid on, title('Simple Implicit Euler Method')
legend('Simple Implicit Euler','Exact solution')
xlabel('V');
ylabel('Y');