function [ output_args ] = maincstr( input_args )
%MAINCSTR Summary of this function goes here
%   Detailed explanation goes here
ref=.1;
y1old=0.4;
y2old=0.2;
y3old=0.1;
ar=[];
eold=0;
er=0;er1=0;
dt=0.1;told=0;told2=0;
tau=5;
K=30;
u=0.8;
for t=0:0.5:8.5
    y1=[t y1old y2old y3old u];
    ar=[ar;y1];
    dtspan=[t t+dt];
    init=[y1old y2old y3old];
    u=0.8+K*(er1+er/tau)*dt;
    [x y]=ode45(@cstrnew,dtspan,init,[],u);
    y1old=y(length(y),1);
    y2old=y(length(y),2);
    y3old=y(length(y),3);
    eold=er;
    er=(ref-y3old);
    er1=(er-eold);
end	
    ar
end

