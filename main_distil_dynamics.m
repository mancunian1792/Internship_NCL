
% Main program calls function distil and plots composition 
% versus time and steady state composition versus plate number

global V1 F M0 M1 M R xf a Nf Nt V L L1 D

clc
tf=30;
ti=0;

R=5;

F=40;
V1=150;
V=V1;
D=V/(R+1);
L=V-D;
L1=L+F;

a(1)=2.34;
a(2)=1;
a(3)=0.44;
a(4)=2.1;

M0=75;
M=10;
M1=150;

xf(1)=0.25;
xf(2)=0.25;
xf(3)=0.25;
xf(4)=1-xf(1)-xf(2)-xf(3);

Nf=5;
Nt=10;

for i=1:Nt,
x0(i)=xf(1);
end

for i=1:Nt,
x0(i+Nt)=xf(2);
end

for i=1:Nt,
x0(i+Nt+Nt)=xf(3);
end

for i=1:Nt,
x0(i+Nt+Nt+Nt)=xf(4);
end

[t x]=ode45('distil',[ti tf],x0);

% for i=1:Nt,
% Bsteady(i)=x(end,i);
% end
% 
% for i=1:Nt,
% Tsteady(i)=x(end,i+Nt);
% end
% 
% for i=1:Nt,
% Xsteady(i)=1-Bsteady(i)-Tsteady(i);
% end

% figure(1);
% plot(Bsteady,'r');
% hold on;
% plot(Tsteady,'g');
% plot(Xsteady,'b');
% xlabel('plate number');
% ylabel('steady state composition')
% title('steady state composition versus plate number')

figure(2);
plot(t,x(:,1),'r');
hold on;
plot(t,x(:,11),'g');
plot(t,x(:,21),'k');
plot(t,1-x(:,1)-x(:,11)-x(:,21),'b');
xlabel('time');
ylabel('composition');
title('composition of benzene, toluene and p-xylene ethanol in the condenser');

figure(3);
plot(t,x(:,10),'r');
hold on;
plot(t,x(:,20),'g');
plot(t,x(:,30),'k');
plot(t,1-x(:,10)-x(:,20)-x(:,30),'b');
xlabel('time');
ylabel('composition');
title('composition of benzene, toluene and p-xylene etnaol in the reboiler');
