clear all
clc

h=.2;
xspan=[0 4];
yint=1;
fun=@mohsen_hw2_p2_fun1;
[x,Y]=mohsen_cRK(fun,yint,xspan,h)
plot(x,Y)
