function dx = mohsen_hw7_p6_fun1(t,x)

global lambda

dx = zeros(2,1);

dx(1) = x(2);
dx(2) = -( 2*(sech(t))^2 - lambda^2  )*x(1);