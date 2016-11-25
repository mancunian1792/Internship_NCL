function [ dydt ] = isopolymerode( t,x,Fi )
%ISOPOLYMERODE Summary of this function goes here
%   Detailed explanation goes here

% all the ordinary differential equations are placed here



Cif=8;
Cmf=6;
ktc=1.31281*10^10;
F=1;
ktd=1.093*10^11;
ki=1.0225*10^-1;
kp=2.4952*10^6;
V=.1;
kfm=2.4522*10^3;
f=0.58;
Mm=100.12;
Po=((2*f*ki*x(2))/(ktd+ktc))^0.5;
w=-((kp+kfm)*x(1)*Po)+((F*(Cmf-x(1)))/V);
v=-(ki*x(2))+((Fi*Cif-F*x(2))/V);
x5=(0.5*ktc+ktd)*Po^2+(kfm*x(1)*Po)-(F*x(3)/V);
z=(Mm*(kp+kfm)*x(1)*Po)-((F*x(4))/V);
dydt=[w; v; x5; z];


end

