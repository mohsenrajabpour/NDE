%-------Homework #14--- Problem 3------
clear all
clc

z=1.5:.1:200;

ro1=(2+sqrt(4-2*z))./(2*z);
ro2=(2-sqrt(4-2*z))./(2*z);

figure(140301)
plot(z,abs(ro1))
grid on
title('Check the stability')
xlabel('Z');ylabel('ro')
figure(140302)
plot(z,abs(ro2))
grid on
title('Check the stability')
xlabel('Z');ylabel('ro')