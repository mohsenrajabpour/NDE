clear all
clc

ODEFUN=@mohsen_fun4_hw2_p3;
TSPAN=[0 4];
Y0=0;

[TOUT,YOUT] = ode45(ODEFUN,TSPAN,Y0);
plot(TOUT,YOUT)
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
h = 4/96;                         

tspan = [tmin tmax];             
v0 = 0;                          
t = TOUT';


V_exact1 = vmax1*(1-exp(-a1*t));
V_exact2 = vmax2*(1-exp(-a2*t));
Vexact= [V_exact1(1:54) V_exact2(55:97)];
plot(t,Vexact,'r')
 
error5=Vexact-YOUT'
