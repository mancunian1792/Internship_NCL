function [ originaly xarray yarray scaling armin scaling1 umin] = isopolymer( input_args )
%ISOPOLYMER Summary of this function goes here
%   Detailed explanation goes here

%used for the generation of the prbs value of an isothermal reactor

dt=0.03;  %step size of the time
%parameter values initial or steady state
Ci=0.132906;
Do=0.0019752;
Di=49.38182;
Fi=0.0046;
yo=25000.5;
Cm=5.506774;
Cif=8;
Cmf=6;
ktc=1.31281*10^10;
F=1;
ktd=1.093*10^11;
ki=1.0225*10^-1;
kp=2.4952*10^6;
V=10.0;
kfm=2.4522*10^3;
f=0.58;
Mm=100.12;
ar=[];
i=1;
er=0;
erint=0;
umin=0.028966;
umax=0.0046;
% umin=0.0151047;
% umax=0.0184613;
uarray=zeros(1600,1);
Ps=0.2;
iflag=1;
uarray(1,1)=0.0046;
% Kp=5;
% Ki=2;
%Figen=idinput(800,'prbs',[0 0.5],[0.0046 0.028966]);
for(i1=2:1:1600)
    uprob=rand();
    
    if((uprob<=Ps)&&(iflag>5))
        iflag=1;
        uprob1=rand();
        uarray(i1,1)=umin+((umax-umin)*uprob1);
    else
        iflag=iflag+1;
        uarray(i1,1)=uarray(i1-1,1);
    end
end
i2=1;
for(t=0:0.03:47.97)
%    Fi=Figen(i);
    
    Fi=uarray(i2,1);
    yo=Di/Do;
%     er=25000.5-yo;
%     erint=erint+er*dt;
%     Fi=0.016783+Kp*er+Ki*erint;
    init=[Cm Ci Do Di];
    tspan=[t t+dt];
    y1=[t Cm Ci Do Di yo];
    ar=[ar;y1];
    [t1 y]=ode45(@isopolymerode,tspan,init,[],Fi);
    Cm=y(length(y),1);
    Ci=y(length(y),2);
    Do=y(length(y),3);
    Di=y(length(y),4);
    i2=i2+1;
end
subplot(2,1,1);
plot(ar(:,1),ar(:,6));
originaly=ar(:,6);
subplot(2,1,2);
plot(ar(:,1),uarray);
armax1=max(ar(:,6))+(rand()*max(ar(:,6))*0.1);
armin=min(ar(:,6))-(rand()*min(ar(:,6))*0.1);
scaling=armax1-armin;
% scaling=armax;
for(i4=1:1:1600)
    yout(i4,1)=((ar(i4,6)-armin)/scaling);
end
umax=max(uarray)+(rand()*max(uarray)*0.1);
umin=min(uarray)-(rand()*min(uarray)*0.1);
scaling1=umax-umin;
% scaling1=umax;
for(i5=1:1:1600)
    uin(i5,1)=((uarray(i5,1)-umin)/scaling1);
end
% a12=uarray(1:100)
% a13=uin(1:100)
yarray=[];xarray=[];
yarray=yout(3:1600);
for(i6=3:1:1600)
    xarray(i6-2,:)=[uin(i6-1,1) uin(i6-2,1) yout(i6-1,1) yout(i6-2,1)];
end
end

