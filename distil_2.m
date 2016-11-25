
function xdot=distil(t,x)

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

M0=75;
M=10;
M1=150;

xf(1)=0.6;
xf(3)=1-xf(1);


Nf=5;
Nt=10;

for i=1:Nt,
y(i)=a(1)*x(i)/(a(1)*x(i)+a(2)*x(i+Nt)+a(3)*(1-x(i)-x(i+Nt)));
end

for i=1:Nt,
y(i+Nt)=a(2)*x(i+Nt)/(a(1)*x(i)+a(2)*x(i+Nt)+a(3)*(1-x(i)-x(i+Nt)));
end
 
xdot(1)=(V*y(2)-(L+D)*x(1))/M0;
xdot(1+Nt)=(V*y(2+Nt)-(L+D)*x(1+Nt))/M0;

for i=2:Nf-1,
xdot(i)=(L*(x(i-1)-x(i))+V*(y(i+1)-y(i)))/M;
xdot(i+Nt)=(L*(x(i-1+Nt)-x(i+Nt))+V*(y(i+1+Nt)-y(i+Nt)))/M;
end

xdot(Nf)=(F*xf(1)+L*x(Nf-1)-L1*x(Nf)+V1*y(Nf+1)-V*y(Nf))/M;
xdot(Nt+Nf)=(F*xf(2)+L*x(Nt+Nf-1)-L1*x(Nf+Nt)+V1*y(Nf+1+Nt)-V*y(Nf+Nt))/M;

for i=Nf+1:Nt-1,
xdot(i)=(L1*(x(i-1)-x(i))+V1*(y(i+1)-y(i)))/M;
xdot(i+Nt)=(L1*(x(i-1+Nt)-x(i+Nt))+V1*(y(i+1+Nt)-y(i+Nt)))/M;
end

xdot(Nt)=(L1*x(Nt-1)-V1*y(Nt)-(L1-V1)*x(Nt))/M1;
xdot(Nt+Nt)=(L1*x(Nt+Nt-1)-V1*y(Nt+Nt)-(L1-V1)*x(Nt+Nt))/M1;

xdot=xdot';
