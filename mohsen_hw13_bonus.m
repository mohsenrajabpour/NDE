%-------Homework #13--- Bonus------

clear all
clc

phi=[0:0.1:2*pi];
r=1:0.1:10;

for m=1:length(phi)
    for n=1:length(r)
        ro1(m,n) = ( 4*r(n)*cos(phi(m)) + sqrt( 16*r(n)^2*(cos(phi(m)))^2 -4*(2*r(n)-1) ) )/(2+4*r(n));
        ro2(m,n) = ( 4*r(n)*cos(phi(m)) + sqrt( 16*r(n)^2*(cos(phi(m)))^2 -4*(2*r(n)-1) ) )/(2+4*r(n));
    end
end
[r,phi]=meshgrid(r,phi);
figure(1300)
plot3(phi,r,abs(ro1));
figure(1301)
plot3(phi,r,abs(ro2));