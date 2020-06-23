%----presentation--------
clear all
clc

lambda0=.1;

solinit = bvpinit(linspace(0,1,10),@guess,lambda0);  
sol = bvp4c(@f,@bcs,solinit);
p1=plot( sol.x, sol.y(1,:), '-bo' ); hold on; 
grid on;  
xlabel('X');
ylabel('Numerical Solution');
fprintf( 'lambda = %g.\n', sol.parameters );







