function f = mohsen_test2_p4_fun1(x,u)

global lambda

f = -( 6*(sech(x))^2 - lambda  )*u + u^3;