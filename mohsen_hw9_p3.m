%--------Homework#9-----Problem 3----

clear all
clc

xspan=[0 1];
alpha=0;
beta=1;
M=input('Please enter the value of M =');% 10 20 40
h=(xspan(2)-xspan(1))/(M+1);
x=xspan(1)+h:h:xspan(2)-h;
xj=x;

fun=@mohsen_hw9_p3_fun1;

for j=1:M
    for k=1:M
        if abs(x(k)-xj(j))<=h
            phi(j,k)=feval(fun,x(k),xj(j),h);
        else
            phi(j,k)=0;
        end
    end
end


for j = 1:M
    R(j) = (2*x(j)-4) / ( (1+x(j))^2 );
end

r=R*h;
r=r';

for j = 1:M
    for k = 1:M
        if k == j+1 | k == j-1
            a1(j,k) = -1/h;
            a2(j,k)= h/6;
        elseif k == j
            a1(j,k) = 2/h;
            a2(j,k)= (2*h)/3;
        else
            a1(j,k) = 0;
            a2(j,k)= 0;
        end
    end
end


for j = 1:M
    for k = 1:M
        if abs(k-j)<2
            Xmid(j,k) = (x(j)+x(k))/2;
            Q(j,k) = -2 / ( (1+Xmid(j,k))^2 );
        end
    end
end

a = -a1 + a2.*Q;

c = a\r;

z = phi*c;

for i = 1:M
    y(i) = z(i)+x(i);
end

y=[alpha y beta];
x=xspan(1):h:xspan(2);
Yexact = (2*x)./(1+x);

subplot(1,2,1)
plot(x,Yexact,'->b',x,y,'-*r')
grid on
title(['Galerkin Method. M= ',num2str(M)])
xlabel('Time');ylabel('Solution');
legend('Exact Solution','Numerical Solution','location','southeast')

error = abs(y-Yexact);

subplot(1,2,2)
plot(x,error)
grid on, title('Error in the Galerkin Method')
xlabel('Time');
ylabel('Error');