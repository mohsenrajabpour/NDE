function dx = mohsen_hw5_p6_fun2(t,x)

dx = zeros(2,1);
a = 1;
dx(1) = x(2);
dx(2) = -a*x(1);