function[xdot]=nonisocstr(t,x)
%x(1)=V;
%x(2)=Ca;
%x(3)=T;
%x(4)=Tj;
F0=40;
Ca0=0.5;
T0=530;
Vj=3.85;
U=150;
H=250;
Tj0=53;
L=-30000;
r=50;
r0=62.3;
P=0.75;
J=1;
K=((7.08*10^10)*exp(-30000/(1.99*x(3))));
F=(40-10*(48-x(1))); 
Fj=(49.9-0*(600-x(3)));
%Fj=(49.9-Kc*(600-x(3)));
xdot=zeros(size(x));
xdot(1)=(F0-F);
xdot(2)=(((F0*Ca0)/x(1))-((F*x(2))/x(1))-K*x(2)-((x(2)*(F0-F))/x(1)));
xdot(3)=(((F0*T0)/x(1))-((F*x(3))/x(1))-((L*K*x(2))/(r*P))-(((U*H*(x(3)-x(4)))/(r*P*x(1)))));
xdot(4)=(((Fj*(Tj0-x(4)))/Vj)+(((U*H*(x(3)-x(4)))/(r0*Vj*J))));
end

%t=(0:0.200:4.010);
%x=[48.00 0.245 600.00 594.590];
%[t,x]=ode45(@nonisocstr,t,x)