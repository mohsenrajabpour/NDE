%-------Homework #13--- Problem 4------

clear all
clc

k=input('Please enter one these 0.1, 0.05, 0.025 or 0.01 value for  k = ');
h=0.1;
xspan=[0 1];
x=xspan(1)+h:h:xspan(2)-h;

tspan=[0 .5];
t=tspan(1):k:tspan(2);

M=length(x);
N=length(t);
U=zeros(M,N);

r=k/h^2;         %Eq (12.13)

% Boundary confitions:
U(1,:)=zeros(1,N);
U(M,:)=zeros(1,N);
%Initial condition
U(:,1)=sin(pi*x);

a = 1 + zeros(M,1);
b =-2 + zeros(M,1);
c = a;

A = spdiags(a,-1,M,M) + spdiags(b,0,M,M) + spdiags(c,1,M,M);
B=(r/2)*zeros(1,M)';
C=(eye(M,M)-(r/2)*A)\(eye(M,M)+(r/2)*A);

for n=1:N-1
    B(1)=U(1,n)+U(1,n+1);
    B(end)=U(M,n)+U(M,n+1);
end

for n=1:N-1
    U(:,n+1) = C*U(:,n)+B;
end

%Finding the exact value of U

for n=1:N
    U_exact(:,n) = sin(pi*x(:))*exp(-pi^2*t(n));
end

Error = (U - U_exact); %Error
max(abs(Error(:,(end))))
Error(round(M/2),(end))
line_color(1,:)=[1 0 0];   % red
line_color(2,:)=[0 0 0];   % black
line_color(3,:)=[0 0 1];   % blue
line_color(4,:)=[1 0 1];   % purple
line_style=char('-','--','-.', ':');

figure(130401)

plot(x,U_exact(:,(end)),'g','DisplayName','Exact Solution ');
hold on

if k==.1
    plot(x,U(:,(end)),'color',line_color(1,:),'linestyle',line_style(1,:),'linewidth',2,'DisplayName',['k= ' num2str(k)] )
    legend('-DynamicLegend');
    hold all
elseif k==.05
    plot(x,U(:,(end)),'color',line_color(2,:),'linestyle',line_style(2,:),'linewidth',2,'DisplayName',['k= ' num2str(k)])
    legend('-DynamicLegend');
    hold all
elseif k==0.025
    plot(x,U(:,(end)),'color',line_color(3,:),'linestyle',line_style(3,:),'linewidth',2,'DisplayName',['k= ' num2str(k)])
    legend('-DynamicLegend');
    hold all
else
    plot(x,U(:,(end)),'color',line_color(4,:),'linestyle',line_style(4,:),'linewidth',2,'DisplayName',['k= ' num2str(k)])
    legend('-DynamicLegend');
    hold all
end

grid on
title(['Crank–Nicolson scheme h= ', num2str(h)])
xlabel('T');ylabel('X');

figure(130402)
if k==.1
    plot(x,Error(:,(end)),'color',line_color(1,:),'linestyle',line_style(1,:),'linewidth',2,'DisplayName',['k= ' num2str(k)] )
    legend('-DynamicLegend');
    hold all
elseif k==.05
    plot(x,Error(:,(end)),'color',line_color(2,:),'linestyle',line_style(2,:),'linewidth',2,'DisplayName',['k= ' num2str(k)])
    legend('-DynamicLegend');
    hold all
elseif k==0.025
    plot(x,Error(:,(end)),'color',line_color(3,:),'linestyle',line_style(3,:),'linewidth',2,'DisplayName',['k= ' num2str(k)])
    legend('-DynamicLegend');
    hold all
else
    plot(x,Error(:,(end)),'color',line_color(4,:),'linestyle',line_style(4,:),'linewidth',2,'DisplayName',['k= ' num2str(k)])
    legend('-DynamicLegend');
    hold all
end
grid on
title(['Error of Crank–Nicolson scheme h= ', num2str(h)])
xlabel('T');ylabel('Error');


Error_at_middle_of_x = Error(round(M/2),(end))