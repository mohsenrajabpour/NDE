%-----Homework#5---Bonus 2---- Part 1------

clear all
clc

xspan=[0 10];
Y(1)=0;
V(1)=1;
h=0.2;

x=xspan(1):h:xspan(2);
fun=@mohsen_hw5_p6_fun1;

for n=1:length(x)-1
    
    Y(n+1) = Y(n) + h*V(n) +(h^2/2)*feval(fun,x(n),Y(n)) ;
    V(n+1) = V(n) + (h/2)*(  feval( fun,x(n),Y(n) ) + feval( fun,x(n),Y(n+1)));
end


H=(V.^2+Y.^2)/2;

y_exact=sin(x);
v_exact=cos(x);

H_exact=(v_exact.^2+y_exact.^2)/2;

Error = (H_exact - H) ;
plot(x,Error)
grid on, title('Comparison between Verlet 1and Verlet 2')
xlabel('Time');
ylabel('Error');
hold on
%%

for n=1:length(x)-1
    
    
    V(n+1) = V(n) + h*feval( fun,x(n),Y(n)+(h/2)* V(n)) ;
    Y(n+1) = Y(n) +(h/2)*(V(n)+V(n+1));
end


H=(V.^2+Y.^2)/2;

y_exact=sin(x);
v_exact=cos(x);

H_exact=(v_exact.^2+y_exact.^2)/2;

Error = (H_exact - H) ;

plot(x,Error,'r')




