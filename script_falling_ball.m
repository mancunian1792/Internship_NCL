%===================Simulation=====================
tspan=1:1500;
e=randn(1500,1)*sqrt(2e5);
w=[randn(1500,1)*100 randn(1500,1)];
xtrue=zeros(1500,2);
y=zeros(1500,1);
x0=[1e7,0];
for i=0:1499
    [t,x]=ode45(@falling_ball,[i i+1],x0);
    xtrue(i+1,:)=x(end,:);
    x0=x(end,:)+w(i+1,:);
    y(i+1)=x(end,1)+e(i+1);
end
%plot(tspan,y);
hold on;
plot(tspan,xtrue(:,1),'g');
%====================Estimation==============
model.Ad=[1 1;0 1];
model.Bd=[0.5;1];
model.Cd=[1 0];
Q=diag([100,1]);
xhat=zeros(1500,2);
R=(2e5);
xhat_k=[100000,2]';
xhat(1,:)=xhat_k';
phat_k=diag([1000,1]);
u=-9.81;
y_k_plus_1=y(1);
for i=1:1499
    [xhat_k_plus_1,phat_k_plus_1,k]=kalmann(xhat_k,phat_k,u,y_k_plus_1',Q,R,model);
    xhat_k=xhat_k_plus_1;
    phat_k=phat_k_plus_1;
    xhat(i+1,:)=xhat_k';
    y_k_plus_1=y(i+1);
end
plot(tspan,xhat(:,1),'--r');