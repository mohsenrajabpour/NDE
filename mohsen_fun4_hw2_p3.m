function f=mohsen_fun4_hw2_p3(t,y)

vmax_mph1 = 80;     
vmax_mph2 = 4; 

vmax1 = vmax_mph1*(1600/3600); 
vmax2 = vmax_mph2*(1600/3600); 

if t >= 0 & t <= 2
f= (-9.8/vmax1)*y+9.8;
else
f= (-9.8/vmax2)*y+9.8;
end