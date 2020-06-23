
function [ v ]  = guess(x)
  
y = x.*sin(2.5*pi*x);
yp = sin(2.5*pi*x) + 2.5*pi*x.*cos(2.5*pi*x);
v = [ y; (1-x.^7).*yp ];