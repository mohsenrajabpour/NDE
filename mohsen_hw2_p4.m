clear all
clc

h=4/96;
xspan=[0 4];
yint=0;
fun=@mohsen_fun4_hw2_p3;
[x,Ye,Y]=mohsen_RKF(fun,yint,xspan,h);
plot(x,Ye,'*r',x,Y)
hold on


global a1 a2 g
 

vmax_mph1 = 80;     
vmax_mph2 = 4; 

vmax1 = vmax_mph1*(1600/3600); 
vmax2 = vmax_mph2*(1600/3600);   
 
g = 9.8;                         
a1= g/vmax1;
a2 = g/vmax2;
                    


tmin = 0;
tmax = 4;                                                

tspan = [tmin tmax];             
v0 = 0;                          
t = tmin:h:tmax;


V_exact1 = vmax1*(1-exp(-a1*t));
V_exact2 = vmax2*(1-exp(-a2*t));
Vexact= [V_exact1(1:49) V_exact2(50:97)];
plot(t,Vexact,'r')

error4=Vexact-Y