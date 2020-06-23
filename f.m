function [ ode ] = f(x,y,lambda)

if( x > .9995 ) 
  ode = [ lambda/7;
	  -lambda*(x^7)*y(1) ];
else
  ode = [ y(2)/(1-x^7);
	  -lambda*(x^7)*y(1) ];
end