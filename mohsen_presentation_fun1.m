function dx = mohsen_presentation_fun1(t,x)

global lambda

dx = zeros(2,1);

dx(1) = x(2)/(1-t^7);
dx(2) = -( lambda*t^7  )*x(1);