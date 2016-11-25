function[xdot]=threecstr(t,x)
%x(1)=ca1;
%x(2)=ca2;
%x(3)=ca3;
k=0.5;
tau=2;
ca0=1.8;
xdot=zeros(size(x));
xdot(1)=(1/tau)*(ca0-x(1))-(k*x(1));
xdot(2)=(1/tau)*(x(1)-x(2))-(k*x(2));
xdot(3)=(1/tau)*(x(2)-x(3))-(k*x(3));
end




 t=0:0.1:2.9;
x=[0.4 0.2 0.1];
[t,x]=ode45(@threecstr,t,x)
