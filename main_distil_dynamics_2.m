global V1 F M0 M1 M R xf a Nf Nt V L L1 D

clc
tf=200;
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

M0=75;
M=10;
M1=150;

xf(1)=0.6;
xf(2)=0.25;
xf(3)=1-xf(1)-xf(2);

Nf=5;
Nt=10;

for i=1:Nt,
x0(i)=xf(1);
end

for i=1:Nt,
x0(i+Nt)=xf(2);
end

[t x]=ode45('distil',[ti tf],x0);

for i=1:Nt,
i
Bsteady(i)=x(end,i);

end
Bsteady(i)
for i=1:Nt,
Tsteady(i)=x(end,i+Nt);
end

for i=1:Nt,
Xsteady(i)=1-Bsteady(i)-Tsteady(i);
end


%figure(2);
%plot(t,x(:,1),'r');
%hold on;
%plot(t,x(:,11),'g');
%plot(t,1-x(:,1)-x(:,11),'b');
%xlabel('time');
%ylabel('composition');
%title('composition of benzene, toluene and p-xylene in the condenser');

%figure(3);
%plot(t,x(:,10),'r');
%hold on;
%plot(t,x(:,20),'g');
%plot(t,1-x(:,10)-x(:,20),'b');
%xlabel('time');
%ylabel('composition');
%title('composition of benzene, toluene and p-xylene in the reboiler');
