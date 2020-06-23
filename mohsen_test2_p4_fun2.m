function f = mohsen_test2_p4_fun2(x,u)

global lambda

f = -( 6*(sech(x))^2 - lambda  ) + 3*u^2;