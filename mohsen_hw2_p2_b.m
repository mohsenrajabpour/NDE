clear all
clc

h=.2;
xspan=[0 2];
yint=0;
fun=@mohsen_hw2_p2_fun2;
[x,Y]=mohsen_cRK(fun,yint,xspan,h);



global a g


vmax_mph = 80;                   
vmax = vmax_mph*(1600/3600);    
g = 9.8;                         
a = g/vmax;                     

tmin = 0;
tmax = 2;                        
h = 0.2;                         

tspan = [tmin tmax];             
v0 = 0;                          
t = tmin:h:tmax;


V_exact = vmax*(1-exp(-a*t));
error=Y-V_exact;
plot(x, error)
grid on
xlabel('Time');ylabel('Error')
title('HW2-P2-b','FontWeight','bold')

[t_ME, V_ME] = ME_1eq(@mohsen_hw2_p2_fun2,v0,tspan,h);

compar1 = V_ME(11)-V_exact(11)
compar2 = Y(11)-V_exact(11)


