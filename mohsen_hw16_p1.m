%-------Homework #16--- Problem 1------

clear all
clc

x=[-10:0.1:10];
%%%We have to run the program twice, the first time for t between .1 & 1
%%%and the for t between 1 & 10

% t=[.1:0.2:1];
t=[1:0.2:10];

for n=1:length(t)
    if t<1
        for m=1:length(x)
            if x(m) < -t(n)
                u(m) = 0;
            elseif x(m) >= -t(n) & x(m) < t(n)
                u(m) = 0.5*(x(m) + t(n));
            elseif x(m) >= t(n) & x(m) < 2-t(n)
                u(m) = t(n);
            elseif x(m) >= 2-t(n) & x(m)<t(n)+2
                u(m) = -0.5*(x(m)-(t(n)+2));
            else x(m) > t(n)+2;
                u(m) = 0;
            end
        end
        
        %%%%%%%%
    else
        for m=1:length(x)
            if x(m) < -t(n)
                u(m) = 0;
            elseif x(m) >= -t(n) & x(m) < 2-t(n)
                u(m) = 0.5*(x(m)+t(n));
            elseif x(m) >= 2-t(n) & x(m) < t(n)
                u(m) = 1;
            elseif x(m) >= t(n) & x(m) < 2+t(n)
                u(m) = -0.5*(x(m)-(t(n)+2));
            else x(m) > 2+t(n);
                u(m) = 0;
            end
        end
    end
    figure(160101)
    plot(x,u,'color', rand(1,3),'LineWidth', 2)
    hold on
    grid on
    xlabel('X')
    ylabel('U')
end

